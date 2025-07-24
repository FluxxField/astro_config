;; Inject TSX inside fenced code blocks with jsx or tsx
(fenced_code_block
  (info_string) @injection.language
  (code_fence_content) @injection.content
  (#match? @injection.language "^(tsx|jsx)$"))

;; Inject raw inline JSX as TSX
(html_block) @injection.content
(#set! injection.language "tsx")

