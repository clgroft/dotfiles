" filetype-specific indenting and plugins
filetype plugin indent on

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

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Make external jobs run in tmux/iTerm/etc.
call minpac#add('tpope/vim-dispatch')

" Custom statusline
" -----------------
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
let g:airline_powerline_fonts = 1

" better (?) syntax highlighting
" call minpac#add('sheerun/vim-polyglot')
" Highlight and :FixWhitespace
call minpac#add('bronson/vim-trailing-whitespace')
nmap <Leader>w :FixWhitespace<cr>

" Rainbow delimiters (easier to pick out matching delimiters)
" I leave this off by default, but may change my mind
" if I start doing Lisp development
call minpac#add('luochen1990/rainbow')
let g:rainbow_active = 0

" Filetype glyphs
call minpac#add('ryanoasis/vim-devicons')

" Navigation
" ----------

" Display source code navigation in a sidebar
call minpac#add('majutsushi/tagbar')
" Use fast search tool from vim command line
call minpac#add('mileszs/ack.vim')
" Use a much faster search tool
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" % matches virtual delimiters (do/end in Ruby, HTML/JSX tags, etc.)
runtime macros/matchit.vim

" Text editing
" ------------

" Various next/previous convenience commands (see :h unimpaired)
call minpac#add('tpope/vim-unimpaired')
" Surround text with quotes, parens, braces, tags
call minpac#add('tpope/vim-surround')
" Make . repetition work with some plugins
call minpac#add('tpope/vim-repeat')
" Autoinsert close parens, braces, quotes, 2-sided spaces
call minpac#add('jiangmiao/auto-pairs')
" Automatically ends blocks in Ruby, other languages
call minpac#add('tpope/vim-endwise')
" Abbreviation, substitution, and case-coersion; works with Rails
" pluralization
call minpac#add('tpope/vim-abolish')
" Cross-language comment/uncomment blocks (handles embedded syntax!)
call minpac#add('tomtom/tcomment_vim')
" Autodetect shiftwidth and expandtab
call minpac#add('tpope/vim-sleuth')
" Easier to create text objects; dependency of vim-textobj-rubyblock
call minpac#add('kana/vim-textobj-user')
" Create text objects for code comments (ic, ac, aC)
call minpac#add('glts/vim-textobj-comment')
" Transition between single- and multi-line constructs
call minpac#add('AndrewRadev/splitjoin.vim')

" Code editing
" ------------

" Autocomplete
call minpac#add('Shougo/deoplete.nvim')
let g:deoplete#enable_at_startup = 1
function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete = 0
endfunction
" Make <tab> do the right thing wrt autocomplete lists
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Linting/autocomplete/etc.
call minpac#add('dense-analysis/ale')
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" vim-slime (send code/tests to tmux pane)
call minpac#add('jpalardy/vim-slime')
let g:slime_target = "tmux"

" Snippets
call minpac#add('Shougo/neosnippet.vim')
call minpac#add('Shougo/neosnippet-snippets')
let g:neosnippet#enable_completed_snippet = 1
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" File handling
" -------------

" Useful Unix commands as Vim commands
call minpac#add('tpope/vim-eunuch')

" Git
" ---

" Use Git commands in Vim command line
call minpac#add('tpope/vim-fugitive')
" Show diff in gutter; can also stage/undo by chunks
call minpac#add('airblade/vim-gitgutter')
" Interact with git log
call minpac#add('kablamo/vim-git-log')

" Go
" --

call minpac#add('fatih/vim-go')
call minpac#add('deoplete-plugins/deoplete-go')
call minpac#add('sebdah/vim-delve')

" Ruby/Rails
" ----------

" Usually pre-installed, but get the latest version
call minpac#add('vim-ruby/vim-ruby')
" LOTS of navigation/highlighting/task-running/tools
" (vim-rake is similar for non-Rails projects)
call minpac#add('tpope/vim-rails')
" Bundler convenience commands
call minpac#add('tpope/vim-bundler')
" Run RSpec tests from vim
call minpac#add('thoughtbot/vim-rspec')

" Slim syntax highlighting
call minpac#add('slim-template/vim-slim')
" DB interaction
call minpac#add('tpope/vim-dadbod')
" r indicates current Ruby block
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('fishbullet/deoplete-ruby')

" JS/React
" --------

" Syntax highlighting & better indentation
call minpac#add('pangloss/vim-javascript')
let g:javascript_plugin_flow = 1
" Flow autocomplete for deoplete
call minpac#add('wokalski/autocomplete-flow')

" Syntax highlighting for JSX
call minpac#add('mxw/vim-jsx')
" Write & autoexpand abbreviated tags
call minpac#add('mattn/emmet-vim')
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" JSON
" ----
call minpac#add('leshill/vim-json')

" Haskell
" -------
call minpac#add('neovimhaskell/haskell-vim')
call minpac#add('alx741/vim-hindent')

" Markdown
" --------
call minpac#add('godlygeek/tabular')
call minpac#add('gabrielelana/vim-markdown')

" Idris
" -----
call minpac#add('idris-hackers/idris-vim')

" Racket
" ------
call minpac#add('wlangstroth/vim-racket')

" Rust
" ----
call minpac#add('rust-lang/rust.vim')

" Scheme/Racket/Lisp
" ------------------
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

" Load all packages in case local.vim wants to use them
packloadall

" Highlight the column just past maximum line length
set cc=+1

let $LOCALFILE=expand("~/.config/nvim/local.vim")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif
