" filetype-specific indenting and plugins
filetype plugin indent on
set ts=2 sts=2

" turn on linenumbers (hybrid when editing & focused, absolute otherwise)
set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

let mapleader=","
let maplocalleader=","
" clear search highlights
nmap <Leader><CR> :nohlsearch<cr>

" Fuzzy finder (junegunn/fzf) via Homebrew; could also use package manager
set rtp+=/usr/local/opt/fzf

" =======
" Plugins
" =======

call plug#begin(stdpath('data') . '/plugged')

" packadd minpac
" call minpac#init()
" call minpac#add('k-takata/minpac', {'type': 'opt'})

" Make external jobs run in tmux/iTerm/etc.
" call minpac#add('tpope/vim-dispatch')

" Custom statusline
" -----------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

" Highlight and :FixWhitespace
Plug 'bronson/vim-trailing-whitespace'
nmap <Leader>w :FixWhitespace<cr>

" Rainbow delimiters (easier to pick out matching delimiters)
" I leave this off by default, but may change my mind
" if I start doing Lisp development
" Plug 'luochen1990/rainbow'
let g:rainbow_active = 0

" Filetype glyphs
Plug 'ryanoasis/vim-devicons'

" Navigation
" ----------

" File system explorer in a sidebar
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in")| NERDTree | endif

" Display source code navigation in a sidebar
" Plug 'majutsushi/tagbar'
" Use fast search tool from vim command line
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
" call minpac#add('mileszs/ack.vim')
" Use a much faster search tool
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

" % matches virtual delimiters (do/end in Ruby, HTML/JSX tags, etc.)
runtime macros/matchit.vim

" Text editing
" ------------

" Various next/previous convenience commands (see :h unimpaired)
" call minpac#add('tpope/vim-unimpaired')
" Surround text with quotes, parens, braces, tags
Plug 'tpope/vim-surround'
" Make . repetition work with some plugins
Plug 'tpope/vim-repeat'
" Autoinsert close parens, braces, quotes, 2-sided spaces
Plug 'jiangmiao/auto-pairs'
" Automatically ends blocks in Ruby, other languages
Plug 'tpope/vim-endwise'
" Abbreviation, substitution, and case-coersion; works with Rails
" pluralization
" call minpac#add('tpope/vim-abolish')
" Cross-language comment/uncomment blocks (handles embedded syntax!)
Plug 'tomtom/tcomment_vim'
" Autodetect shiftwidth and expandtab
Plug 'tpope/vim-sleuth'
" Easier to create text objects; dependency of vim-textobj-rubyblock
Plug 'kana/vim-textobj-user'
" Create text objects for code comments (ic, ac, aC)
Plug 'glts/vim-textobj-comment'
" Transition between single- and multi-line constructs
Plug 'AndrewRadev/splitjoin.vim'

" Code editing
" ------------

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autocomplete
" " call minpac#add('Shougo/deoplete.nvim')
"
" let g:deoplete#enable_at_startup = 1
" function! Multiple_cursors_before()
"   let b:deoplete_disable_auto_complete = 1
" endfunction
" function! Multiple_cursors_after()
"   let b:deoplete_disable_auto_complete = 0
" endfunction

" Make <tab> do the right thing wrt autocomplete lists
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Linting/autocomplete/etc.
" " call minpac#add('dense-analysis/ale')
" " let g:ale_sign_error = '⤫'
" " let g:ale_sign_warning = '⚠'
" " " Enable integration with airline.
" " let g:airline#extensions#ale#enabled = 1

" vim-slime (send code/tests to tmux pane)
" call minpac#add('jpalardy/vim-slime')
let g:slime_target = "tmux"

" Snippets
" " call minpac#add('Shougo/neosnippet.vim')
" " call minpac#add('Shougo/neosnippet-snippets')
" let g:neosnippet#enable_completed_snippet = 1
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

" File handling
" -------------

" Useful Unix commands as Vim commands
Plug 'tpope/vim-eunuch'

" Git
" ---

" Use Git commands in Vim command line
Plug 'tpope/vim-fugitive'
" call minpac#add('tpope/vim-fugitive')
" Show diff in gutter; can also stage/undo by chunks
Plug 'airblade/vim-gitgutter'
" Interact with git log
Plug 'kablamo/vim-git-log'

" Go
" --

Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'
" call minpac#add('deoplete-plugins/deoplete-go')

" Ruby/Rails
" ----------

" Usually pre-installed, but get the latest version
" call minpac#add('vim-ruby/vim-ruby')
" LOTS of navigation/highlighting/task-running/tools
" (vim-rake is similar for non-Rails projects)
" call minpac#add('tpope/vim-rails')
" Bundler convenience commands
" call minpac#add('tpope/vim-bundler')
" Run RSpec tests from vim
" call minpac#add('thoughtbot/vim-rspec')

" Slim syntax highlighting
" call minpac#add('slim-template/vim-slim')
" DB interaction
" call minpac#add('tpope/vim-dadbod')
" r indicates current Ruby block
" call minpac#add('nelstrom/vim-textobj-rubyblock')
" " call minpac#add('fishbullet/deoplete-ruby')

" JS/React
" --------

" Syntax highlighting & better indentation
" call minpac#add('pangloss/vim-javascript')
let g:javascript_plugin_flow = 1
" Flow autocomplete for deoplete
" " call minpac#add('wokalski/autocomplete-flow')

" Syntax highlighting for JSX
" call minpac#add('mxw/vim-jsx')
" Write & autoexpand abbreviated tags
" call minpac#add('mattn/emmet-vim')
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" JSON
" ----
Plug 'elzr/vim-json'

" Haskell
" -------
" call minpac#add('neovimhaskell/haskell-vim')
" call minpac#add('alx741/vim-hindent')

" Idris
" -----
" call minpac#add('idris-hackers/idris-vim')

" Kubernetes
" ----------
Plug 'andrewstuart/vim-kubernetes'
Plug 'c9s/vikube.vim'

" Markdown
" --------
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'

" Scheme/Racket/Lisp
" ------------------
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

" Racket
" ------
" call minpac#add('wlangstroth/vim-racket')

" Rust
" ----
" call minpac#add('rust-lang/rust.vim')

" Terraform
" ---------
" call minpac#add('hashivim/vim-terraform')
" call minpac#add('juliosueiras/vim-terraform-completion')
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" YAML
" ----
Plug 'mrk21/yaml-vim'
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Load all packages in case local.vim wants to use them
call plug#end()
" packloadall

" " call deoplete#custom#option('sources', {'_': ['ale']})

" Highlight the column just past maximum line length
set textwidth=120 cc=+1

" ==========
" COC Config
" ==========

set hidden cmdheight=2 updatetime=300 shortmess+=c signcolumn=yes
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <expr> <cr> complete_info()["selected"] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
let g:go_def_mapping_enabled = 0
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

let airline#extensions#coc#error_symbol = '⤫'
let airline#extensions#coc#warning_symbol = '⚠'

nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j :<C-u>CocNext<cr>
nnoremap <silent> <space>k :<C-u>CocPrev<cr>
nnoremap <silent> <space>p :<C-u>CocListResume<cr>

" =====================
" Handle local settings
" =====================

let $LOCALFILE=expand("~/.config/nvim/local.vim")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif
