local M = {}

local ts_utils = require "nvim-treesitter.ts_utils"
local api = vim.api

--- Get buffer text from a TS node
local function get_node_text(node) return vim.treesitter.get_node_text(node, 0) end

--- Remove node from the buffer
local function remove_node(node)
  local start_row, start_col, end_row, end_col = node:range()
  local line = api.nvim_buf_get_lines(0, start_row, start_row + 1, false)[1] or ""
  local clamped_end_col = math.min(end_col, #line)
  api.nvim_buf_set_text(0, start_row, start_col, end_row, clamped_end_col, {})
end

--- Return the nearest jsx_element parent
local function get_jsx_element_node(node)
  while node do
    if node:type() == "jsx_element" then return node end
    node = node:parent()
  end
  return nil
end

--- Count the number of jsx_element or jsx_self_closing_element children
local function count_jsx_children(node)
  local count = 0
  for child in node:iter_children() do
    local t = child:type()
    if t == "jsx_element" or t == "jsx_self_closing_element" then count = count + 1 end
  end
  return count
end

M.wrap_next = function()
  local cursor_node = ts_utils.get_node_at_cursor()
  if not cursor_node then return end

  local current = get_jsx_element_node(cursor_node)
  if not current then
    print "No JSX element under cursor"
    return
  end

  local parent = get_jsx_element_node(current:parent())
  if not parent then
    print "No JSX parent found"
    return
  end

  local open_tag, closing_tag
  for child in current:iter_children() do
    if child:type() == "jsx_opening_element" then
      open_tag = child
    elseif child:type() == "jsx_closing_element" then
      closing_tag = child
    end
  end

  local tag_name_node = open_tag and open_tag:field("name")[1]
  if not tag_name_node then
    print "Unable to find JSX tag name"
    return
  end
  local tag_name = get_node_text(tag_name_node)

  local total_children = count_jsx_children(parent)

  local parent_open, parent_close
  for child in parent:iter_children() do
    if child:type() == "jsx_opening_element" then
      parent_open = child
    elseif child:type() == "jsx_closing_element" then
      parent_close = child
    end
  end

  if not parent_open or not parent_close then
    print "Parent tag is missing opening or closing element"
    return
  end

  local force_wrap = total_children == 1

  if force_wrap then
    --- FORCE WRAP FLOW ---
    local open_row = open_tag and open_tag:range()
    local close_row = closing_tag and closing_tag:range()

    -- Remove opening tag and trim line
    if open_tag and open_row then
      remove_node(open_tag)
      local line = api.nvim_buf_get_lines(0, open_row, open_row + 1, false)[1] or ""
      if vim.trim(line) == "" then
        api.nvim_buf_set_lines(0, open_row, open_row + 1, false, {})
        if close_row then close_row = close_row - 1 end
      end
    end

    -- Remove closing tag and trim line
    if closing_tag and close_row then
      remove_node(closing_tag)
      local line = api.nvim_buf_get_lines(0, close_row, close_row + 1, false)[1] or ""
      if vim.trim(line) == "" then api.nvim_buf_set_lines(0, close_row, close_row + 1, false, {}) end
    end

    local parent_open_row = parent_open:end_()
    local parent_close_row = parent_close:start()
    local indent = string.rep(" ", vim.fn.indent(parent_open_row))
    local child_indent = string.rep(" ", vim.fn.shiftwidth() + vim.fn.indent(parent_open_row))

    api.nvim_buf_set_lines(0, parent_close_row, parent_close_row, false, { indent .. "</" .. tag_name .. ">" })
    api.nvim_buf_set_lines(0, parent_open_row + 1, parent_open_row + 1, false, { indent .. "<" .. tag_name .. ">" })

    -- Re-indent inner block one level deeper
    for i = parent_open_row + 2, parent_close_row do
      local line = api.nvim_buf_get_lines(0, i, i + 1, false)[1]
      if line and line:match "%S" then
        api.nvim_buf_set_lines(0, i, i + 1, false, { child_indent .. vim.trim(line) })
      end
    end
  else
    --- NORMAL WRAP FLOW ---
    local parent_open_row = parent_open:end_()
    local parent_close_row = parent_close:start()

    local insert_open = true
    local insert_close = true

    if open_tag and open_tag:start() == parent_open:end_() + 1 then insert_open = false end
    if closing_tag and closing_tag:end_() == parent_close:start() - 1 then insert_close = false end

    local open_row = open_tag and open_tag:range()
    local close_row = closing_tag and closing_tag:range()

    if insert_open and open_tag and open_row then
      remove_node(open_tag)
      local line = api.nvim_buf_get_lines(0, open_row, open_row + 1, false)[1] or ""
      if vim.trim(line) == "" then
        api.nvim_buf_set_lines(0, open_row, open_row + 1, false, {})
        if close_row then close_row = close_row - 1 end
      end
    end

    if insert_close and closing_tag and close_row then
      remove_node(closing_tag)
      local line = api.nvim_buf_get_lines(0, close_row, close_row + 1, false)[1] or ""
      if vim.trim(line) == "" then api.nvim_buf_set_lines(0, close_row, close_row + 1, false, {}) end
    end

    local indent = string.rep(" ", vim.fn.indent(parent_open_row))

    if insert_close then
      api.nvim_buf_set_lines(0, parent_close_row, parent_close_row, false, { indent .. "</" .. tag_name .. ">" })
    end
    if insert_open then
      api.nvim_buf_set_lines(0, parent_open_row + 1, parent_open_row + 1, false, { indent .. "<" .. tag_name .. ">" })
    end
  end
end

vim.keymap.set("n", "<t", function()
  M.wrap_next()
  vim.lsp.buf.format { async = true }
end, { desc = "Wrap next JSX siblings" })

return M
