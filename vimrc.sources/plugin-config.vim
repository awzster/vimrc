" xptemplate
let g:xptemplate_vars = "SPcmd=&BRloop=\n"

" DelimitMate
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:}"
" comment adter update config
"let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let b:delimitMate_insert_eol_marker = 1

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep      = '⮀'
let g:airline_left_alt_sep  = '⮁'
let g:airline_right_sep     = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols       = #{branch: '⭠', readonly: '⭤', linenr: '⭡'}
"let g:airline#extensions#ale#enabled = 1
"let g:airline_theme='monokai_tasty'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 1
let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
let g:airline_section_c = airline#section#create(['filetype'])
let g:airline_section_x = airline#section#create(['%B'])
let g:airline_section_y = airline#section#create(['%P'])
let g:airline_section_z = airline#section#create_right(['%l', '%c'])

" ALE
" let g:ale_fix_on_save = 1
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_python_flake8_options = '--max-line-length 88 --extend-ignore=E203'
" let g:ale_completion_enabled = 0
" let g:ale_linters_explicit = 1
" let g:ale_hover_to_floating_preview = 0
" let g:ale_virtualtext_cursor = 'disabled'
" let g:ale_css_prettier_options = '--tab-width 2 --single-quote --no-semi'
" let g:ale_fixers = {'javascript': ['eslint'], 'json': ['fixjson'], 'html': ['htmlhint'], 'css': ['stylelint']}
" let g:ale_linters = {'javascript': ['eslint'], 'json': ['fixjson'], 'html': ['prettier'], 'css': ['prettier']}

"COC
let g:coc_enable_auto_popup = 0

" Использовать coc.nvim как источник символов (если установлен)
let g:vista_default_executive = 'coc'

" Фильтровать, показывая только функции и методы
let g:vista#renderer#filter_kind = ['Function', 'Method']

" Открыть панель Vista по клавише F9
nnoremap <F9> :Vista!!<CR>

" Для Far.vim
let g:far#source = 'rg'       " Использовать ripgrep для скорости
let g:far#file_mask = '**/*.{js,html,ts,css}' " Расширения файлов
" Пропустить текущую строку при --ask
let g:far#mapping_skip = '<C-n>'

" Подтвердить текущую строку при --ask
let g:far#mapping_accept = '<C-y>'

"let g:far#ignore_files = [tags] " Исключить папки
" Исключения для Far.vim:
" - tags          - служебный файл ctags
" - node_modules  - зависимости npm
" - .git          - системные файлы Git
" - dist          - папка сборки
" - .swp          - swap-файлы Vim
" - .min.js       - минифицированные JS
" let g:far#ignore_files = [
"       \ '**/tags',
"       \ '**/node_modules/**',
"       \ '**/.git/**',
"       \ '**/dist/**',
"       \ '**/*.swp',
"       \ '**/*.min.js'
"       \ ]
let g:far#ignore_files = [
      \ 'tags',               " Исключить файл tags в текущей папке
      \ '**/node_modules/**', " Исключить node_modules
      \ '**/.git/**',         " Исключить .git
      \ '**/dist/**',         " Исключить папку сборки
      \ '*.swp',              " Исключить vim swap
      \ '*.min.js'            " Исключить минифицированные файлы
      \ ]

" let g:far#source_options = {
"       \ 'rg': '--hidden --no-ignore-vcs --glob=!tags' 
"       \ }
let g:far#source_options = {
      \ 'rg': '--glob=!tags --glob=!*.swp --glob=!*.min.js --glob=!**/node_modules/** --glob=!**/.git/** --glob=!**/dist/**'
      \ }
" Горячие клавиши
nnoremap <leader>fr :Far 
nnoremap <leader>rp :Fardo<CR>

" Общие параметры
set tabstop=2
set noexpandtab
set shiftwidth=2
set wildmenu
set nowrap
syntax on
filetype on
set showcmd
set tabpagemax=15
set breakindent
set breakindentopt=shift:2,min:4,sbr
set showbreak=>>
set tags=tags,./tags,../tags
set iminsert=0
set imsearch=0
set ic
set hls
set is
set title
set smartindent
set confirm
set et
set smartcase
set ai
set cin
set lz
set selectmode=
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set background=dark
"let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty
"let g:airline_theme='monokai_tasty'
let g:lightline = { 'colorscheme': 'monokai_tasty' }
set guioptions-=T
set guioptions-=e
set guioptions-=r
set guioptions-=l
set clipboard=unnamedplus
set whichwrap=b,<,>,[,],l,h
set pastetoggle=
set mouse=a
set matchpairs+=<:>
set autoread
set t_Co=256
set list
set listchars=tab:>-,trail:-
highlight SpellBad ctermfg=Black ctermbg=Red
set completeopt=menu
set history=10000
set undodir=~/.vim/undo/
set undofile
set undolevels=10000
set undoreload=10000
set backupdir=~/.vim/backup/
set backupcopy=yes
set writebackup
set scrolloff=5
set sessionoptions+=resize,winpos,folds
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1
let g:session_default_to_last = 1
set foldmethod=indent
set foldcolumn=1
let javaScript_fold=2
set foldlevelstart=99
set complete=.,b,u,t,i
"set omnifunc=ale#completion#OmniFunc
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set viewoptions=cursor,folds
set viewoptions-=options
autocmd BufLeave *.* mkview!
autocmd BufEnter *.* silent! loadview
source /home/za/.vim/scripts/matchit.vim
set listchars=tab:\|\ 
set list
set fo+=t

