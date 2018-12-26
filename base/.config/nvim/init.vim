" filetype-specific indenting and plugins
filetype plugin indent on
" turn on linenumbers
set nu

" optional but recommended (some use " " instead)
let mapleader=","
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

" Appearance
" ----------
call minpac#add('rakr/vim-one')
set background=dark
colorscheme one

" Custom statusline
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'

" better (?) syntax highlighting
call minpac#add('sheerun/vim-polyglot')
" Highlight and :FixWhitespace
call minpac#add('bronson/vim-trailing-whitespace')

" Rainbow delimiters (easier to pick out matching delimiters)
" I leave this off by default, but may change my mind
" if I start doing Lisp development
call minpac#add('luochen1990/rainbow')
let g:rainbow_active = 0

" Navigation
" ----------

" Delay arrows, hjkl, etc.
call minpac#add('takac/vim-hardtime')
let g:hardtime_default_on = 1

" Use fast search tool from vim command line
call minpac#add('mileszs/ack.vim')
" Use a much faster search tool
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" % matches virtual delimiters (do/end in Ruby, HTML/JSX tags, etc.)
runtime macros/matchit.vim
" Display ctags in a window, by scope
call minpac#add('majutsushi/tagbar')

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

" Code editing
" ------------

" Autocomplete
" call minpac#add('Shougo/deoplete.nvim')
" Make <tab> do the right thing wrt autocomplete lists
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Linting/autocomplete/etc.
let g:ale_completion_enabled = 1
call minpac#add('w0rp/ale')
" Fix runaway autocomplete
set completeopt=menu,menuone,preview,noselect,noinsert

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
" call minpac#add('fishbullet/deoplete-ruby')

" JS/React
" --------

" Syntax highlighting & better indentation
call minpac#add('pangloss/vim-javascript')
let g:javascript_plugin_flow = 1
" Flow autocomplete for deoplete
" call minpac#add('wokalski/autocomplete-flow')
" call minpac#add('Shougo/neosnippet')
" call minpac#add('Shougo/neosnippet-snippets')
" let g:neosnippet#enable_completed_snippet = 1

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
call minpac#add('parsonsmatt/intero-neovim')

" Highlight the column just past maximum line length
set cc=+1

let $LOCALFILE=expand("~/.config/nvim/local.vim")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif
