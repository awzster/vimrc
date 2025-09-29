" xptemplate
let g:xptemplate_vars = "SPcmd=&BRloop=\n"

" DelimitMate
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:}"
" comment adter update config
"let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let b:delimitMate_insert_eol_marker = 1


" Фильтровать, показывая только функции и методы
let g:vista#renderer#filter_kind = ['Function', 'Method']

" Открыть панель Vista по клавише F9
nnoremap <F9> :Vista!!<CR>

" Для Far.vim
let g:far#source = 'rg'       " Использовать ripgrep для скорости
let g:far#file_mask = '**/*.{js,html,ts,css}' " Расширения файлов
" Пропустить текущую строку при --ask
"let g:far#mapping_skip = '<C-n>'

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
      \ 'tags',
      \ '**/node_modules/**',
      \ '**/.git/**',
      \ '**/dist/**',
      \ '*.swp',
      \ '*.min.js'
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

let g:matchup_matchparen_offscreen = {'method': 'popup'}

"autocmd BufWritePre *.js :JsBeautify

" Общие параметры
set noswapfile
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
":set termencoding=utf-8
set background=dark
"let g:vim_monokai_tasty_italic = 1
"colorscheme vim-monokai-tasty
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
set undodir=~/.config/nvim/undo/
set undofile
set undolevels=10000
set undoreload=10000
set backupdir=~/.config/nvim/backup/
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

" Настройка синтаксиса для JSP (комбинированный режим)
au FileType jsp set syntax=jsp
au FileType jsp setlocal filetype=jsp.html

" Автоматическое распознавание HTML/Java секций
au FileType jsp runtime! syntax/html.vim
au FileType jsp syn include @jspJava syntax/java.vim
au FileType jsp syn region jspScriptlet matchgroup=jspDelimiter start=/<%/ end=/%>/ keepend contains=@jspJava

" Восстанавливаем стандартное поведение выделения
setlocal selection=inclusive
setlocal selectmode&

" Не переопределяем поведение мыши
nnoremap <buffer> <2-LeftMouse> <C-LeftMouse>
