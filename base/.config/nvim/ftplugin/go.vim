let b:ale_linters = ['gobuild', 'golangci-lint']
set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_snippet_engine = "neosnippet"
let g:go_echo_command_info = 1
nmap <leader>gd  :GoDeclsDir<cr>
nmap <leader>ga  <Plug>(go-alternate-edit)
nmap <leader>gah <Plug>(go-alternate-split)
nmap <leader>gav <Plug>(go-alternate-vertical)
nmap <leader>gt  :GoTest -short<cr>
nmap <leader>gct :GoCoverageToggle -short<cr>
nmap <C-]>       <Plug>(go-def)
nmap <leader>gdv <Plug>(go-def-vertical)
nmap <leader>gat :GoAddTags<cr>

