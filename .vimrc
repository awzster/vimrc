"call plug#begin()
call plug#begin('~/.vim/plugged')
Plug 'drmingdrmer/xptemplate'
let g:xptemplate_vars = "SPcmd=&BRloop=\n"

" Plug 'vim-scripts/YankRing.vim'
" nnoremap <silent> <F11> :YRShow<CR>

Plug 'tpope/vim-surround'
Plug 'gregsexton/MatchTag'
Plug 'Raimondi/delimitMate'
"-------------------------
" DelimitMate

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let b:delimitMate_insert_eol_marker = 1

Plug 'othree/xml.vim'
Plug 'mattn/emmet-vim' " Emmet, fast HTML inserting
Plug 'pangloss/vim-javascript'

"   On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'osyo-manga/vim-anzu'

"Plug 'majutsushi/tagbar'
Plug 'int3/vim-taglist-plus'
Plug 'skywind3000/asyncrun.vim'

Plug 'kshenoy/vim-signature'
" Plug 'autozimu/LanguageClient-neovim', {
"      \ 'branch': 'next',
"      \ 'do': 'bash install.sh',
"      \ }

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }

Plug 'dense-analysis/ale'

Plug 'mvolkmann/vim-js-arrow-function'

"Plug 'madox2/vim-ai'
call plug#end()

" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
"        \ 'javascript': ['quick-lint-js']
"        \ }

" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
"        \ 'javascript': ['/usr/local/bin/typescript-language-server']
"        \ }
" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['javascript-typescript-stdio']
"     \ }
" nnoremap ;. :call LanguageClient_contextMenu()<CR>
" nnoremap gd :call LanguageClient#textDocument_definition()<CR>

" let g:LanguageClient_loggingLevel = 'DEBUG'
" let g:LanguageClient_loggingFile = '/home/za/tmp/LanguageClient.log'


let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_flake8_options = '--max-line-length 88 --extend-ignore=E203'
let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_hover_to_floating_preview = 0
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_css_prettier_options = '--tab-width 2 --single-quote --no-semi'

let g:ale_fixers = {'javascript': ['eslint'], 'json': ['fixjson'], 'html': ['prettier'], 'css': ['prettier']}
let g:ale_linters = {'javascript': ['eslint'], 'json': ['fixjson'], 'html': [], 'css': []}

"let g:ale_lint_on_enter = 1             " Проверять при открытии файла
"let g:ale_lint_on_save = 1              " Проверять при сохранении
"let g:ale_lint_on_text_changed = 'never' " Не проверять при наборе (для производительности)

nmap ;e :ALEToggle<cr>

"CoC
":CocInstall coc-tsserver coc-json
":CocInstall coc-tsserver coc-json coc-html coc-css coc-eslint coc-prettier
"coc-prettier coc-eslint
"inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Включить автодополнение по <Tab>
"inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Горячие клавиши для навигации
"nmap <silent> gd <Plug>(coc-definition)     " Переход к определению
"nmap <silent> gy <Plug>(coc-type-definition) " Переход к типу (TS)
"nmap <silent> gr <Plug>(coc-references)      " Поиск ссылок
"nmap <silent> [g <Plug>(coc-diagnostic-prev) " Предыдущая ошибка
"nmap <silent> ]g <Plug>(coc-diagnostic-next) " Следующая ошибка

" Переименование переменной/функции
"nmap <leader>rn <Plug>(coc-rename)

" Форматирование кода
"command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
"autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx :call CocAction('format')
"CoC



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
"set foldlevel=2 " Первый уровень вложенности открыт, остальные закрыты

set breakindent
" ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
set breakindentopt=shift:2,min:4,sbr
" append '>>' to indent
set showbreak=>>

"let g:tagbar_ctags_bin = '/home/za/usr/bin/ctags'
set tags=tags,./tags,../tags

set iminsert=0
set imsearch=0

set ic
set hls
set is
set showcmd

set title
set smartindent
set confirm
set et
set smartcase

set ai
set cin

set lz
"ленивая перерисовка экрана при выполнении скриптов

"For indent!!!!
set selectmode=

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set background=dark
"color gruvbox
"colorscheme sublimemonokai
"color desert

let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty
let g:airline_theme='monokai_tasty'
let g:lightline = { 'colorscheme': 'monokai_tasty' }  " lightline theme

set guioptions-=T
set guioptions-=e
set guioptions-=r
set guioptions-=l

set clipboard=unnamedplus " во избежание лишней путаницы использовать системный буфер обмена вместо буфера Vim
set title " показывать имя буфера в заголовке терминала
set whichwrap=b,<,>,[,],l,h " перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.

set pastetoggle=

"nnoremap * *N
noremap <home> <S-^>
inoremap <home> <Esc> <S-^> I

noremap <C-BS> db
inoremap <C-BS> <Esc>dbi

imap <F2> <Esc> <C-O>vae
nmap <F2> vae

inoremap <C-Del> <Esc>cw
noremap <C-Del> cw

imap <C-F3> <Esc>*
nmap <C-F3> *

imap <C-'> <C-X><C-O>

"" Вырезать-копировать-вставить через Ctrl
vnoremap <C-X> "+x
vnoremap <C-C> "+y

"" Переключение табов (вкладок) (rxvt-style)
map <S-left> :bp<cr>
nmap <S-left> :bp<cr>
imap <S-left> <ESC>:bp<cr>i
map <S-right> :bn<cr>
nmap <S-right> :bn<cr>
imap <S-right> <ESC>:bn<cr>i
map <C-Tab> :bn<cr>
nmap <C-Tab> :bn<cr>
imap <C-Tab> <ESC>:bn<cr>i

set mouse=a " включает поддержку мыши при работе в терминале (без GUI)
set matchpairs+=<:> " показывать совпадающие скобки для HTML-тегов
"set showmatch " показывать первую парную скобку после ввода второй
set autoread " перечитывать изменённые файлы автоматически
set t_Co=256 " использовать больше цветов в терминале
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
set list " включить подсветку
set listchars=tab:>-,trail:- " установить символы, которыми будет осуществляться подсветка
"Проблема красного на красном при spellchecking-е решается такой строкой в .vimrc
highlight SpellBad ctermfg=Black ctermbg=Red

set whichwrap=b,<,>,[,],l,h " перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
"set virtualedit=all " позволяет курсору выходить за пределы строки

vnoremap // y/<C-R>"<CR>
set completeopt=menu

"":autocmd InsertEnter * set cul
"":autocmd InsertLeave * set nocul

set history=10000
set undodir=~/.vim/undo/
set undofile
set undolevels=10000
set undoreload=10000
set backupdir=~/.vim/backup/
set backupcopy=yes
set writebackup
"au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
nmap <C-Z> :undo<cr>
imap <C-Z> <Esc> :undo<cr>

:set scrolloff=5

set sessionoptions+=resize,winpos,folds
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1
let g:session_default_to_last = 1

""autocmd VIMEnter * :source ~/tmp/session.vim
""autocmd VIMLeave * :mksession! ~/tmp/session.vim
map <C-F12> :%s/\(function.*\)\({\)\n/\1\\r\2/gci
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

set foldmethod=indent
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=2 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

"nnoremap <C-S-M> <ESC>:!bash /home/za/usr/bin/deploy.sh %:t %:p:h
"nnoremap <C-S-M> AsyncRun /home/za/usr/bin/deploy.sh %:t %:p:h

"last
" Visually select the most recently edited or pasted text
nnoremap <expr> <leader>p '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap s "_d
nnoremap ss "_dd

" NERDTree
"let NERDTreeMapOpenInTab='\r'
"let NERDTreeQuitOnOpen=1
"nnoremap <silent> <F12> :NERDTreeToggle<cr>
"let NERDTreeAutoDeleteBuffer = 1
"nnoremap <F12> :tabnew<CR> :sleep 200m<CR> :NERDTreeToggle<CR>

" Airline
"
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" old vim-powerline symbols
let g:airline_left_sep      = '⮀'
let g:airline_left_alt_sep  = '⮁'
let g:airline_right_sep     = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols       = #{branch: '⭠', readonly: '⭤', linenr: '⭡'}

" the separator used on the left side
let g:airline_left_sep=''
" the separator used on the right side 
let g:airline_right_sep=''

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#po#displayed_limit = 0
"call airline#parts#define_minwidth('%c', 200)
let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
let g:airline_section_c = airline#section#create(['filetype'])

let g:airline_section_x = airline#section#create(['%B'])
let g:airline_section_y = airline#section#create(['%P'])
let g:airline_section_z = airline#section#create_right(['%l', '%c'])


"Macroses for quick switching between buffers
"
"
set laststatus=2
let g:airline_theme='badwolf'
"let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
" don't show buffers names if open only one file<
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"set guifont=Fira\ Mono\ for\ Powerline\ 16
"set gfn=Liberation\ Mono\ for\ Powerline\ 15
"set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ 16
"set gfn=Hack\ Regular\ 16
set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ 17
"set columns=92
"set lines=42
"winpos 1 6

source /home/za/.vim/scripts/matchit.vim

set listchars=tab:\|\ 
set list
"set tw=160
"set wrap
set fo+=t
"set wm=2
"set wrap linebreak

nmap <leader>q :NERDTreeToggle<CR>
nmap <leader>t :call TrimWhitespace()<CR>
nmap <leader>s :so ~/.vimrc<CR>
" Clear search highlighting
nmap <silent> <leader><leader> :noh<CR>

"nmap ;d :!bash /home/za/usr/bin/deploy.sh %:t %:p:h<cr>
"nmap ;a :bufdo :w<cr> echo bufname("%")<cr> execute ""/home/za/usr/bin/copy2dev.sh" %:t %:p:h<cr>/home/za/usr/bin/copy2dev.sh" %:t %:p:h<cr>
"nmap ;a :Bufdo /home/za/usr/bin/copy2dev.sh" %:t %:p:h<cr>
"https://github.com/powerline/fontsnmap ;l :!bash /home/za/usr/bin/copy2dev.sh %:t %:p:h<cr>
"nmap ;l :!bash /home/za/usr/bin/copy2dev.sh %:t %:p:h<cr>
"nmap ;d :!deploy-mc.sh %<cr>:e<cr>
"nmap ;f :!eslint --fix %<cr>
nmap ;d : call DeployCurrentBuffer()<cr><esc>
nmap ;l :silent call MergeCurrentBuffer()<cr>:redraw<cr>
nmap ;a :call MergeAllBuffers()<cr>
"nmap ;t :set noexpandtab<cr>:retab!<cr>
nmap ;t :call TabToSpace()<cr>
nmap ;s :set expandtab<cr>
"line break
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
nnoremap Q a<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

"nmap ;w :set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ 17<cr>:set columns=178<cr>:set lines=48<cr>:winpos 1930 40<cr>
"nmap ;q :set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ 15<cr>:set columns=158<cr>:set lines=40<cr>:winpos 10 10<cr>

"nnoremap ;b :buffers <cr>
nmap <F4> :e ~/.vimrc<cr>
"nmap <F5> :w<cr> :so ~/.vimrc<cr>:bd<cr>
nmap <F2> bve
"nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <silent> <F9> :TlistToggle<CR>

"nmap <PageDown> <nop>
"nmap <PageUp> <nop>
"imap <PageDown> <nop>
"imap <PageUp> <nop>

set complete=.,b,u,t,i
"set omnifunc=syntaxcomplete#Complete
set omnifunc=ale#completion#OmniFunc

"let g:tagbar_autofocus = 1
"let g:tagbar_show_linenumbers = 0
"let g:tagbar_foldlevel = 1

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

nnoremap <F8> Go<Esc>O<Esc>:put =strftime(\"%d/%m/%y %H:%M:%S\")<cr>o<Esc>o<Esc>:w<cr>
set viewoptions=cursor,folds
set viewoptions-=options
"set viewoptions+=fold
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview

autocmd BufLeave *.* mkview!
autocmd BufEnter *.* silent! loadview

"au BufRead *.* retab!

function! DeployCurrentBuffer()
  update
  exec '!/home/za/usr/bin/deploy-vim.sh %:t %:p:h'
  edit
  
  let buffer_count = NrBufs()
  echo buffer_count
  
  if (buffer_count == 1)
    quit
  endif
  :bd
endfunction

function! MergeCurrentBuffer()
  update
  "exec '!copy2dev.sh %:t %:p:h'
  exec 'AsyncRun copy2dev.sh %:t %:p:h'
endfunction

function! MergeAllBuffers()
  :let buf=bufnr('%') | exec 'bufdo !copy2dev.sh %:t %:p:h' | exec 'b' buf
endfunction

function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

function! TabToSpace()
    let l:save = winsaveview()
    %s/\t/  /g
    call winrestview(l:save)
endfunction

if has("autocmd")
    autocmd FileType {xml,xslt,html,css} setlocal iskeyword=@,-,\:,48-57,_,128-167,224-235
    autocmd FileType {xml,xslt,html,css} set foldmethod=indent
    autocmd FileType {javascript} set foldmethod=syntax
    autocmd FileType {py} set tabstop=4
    autocmd FileType {jsp} setlocal iskeyword-=:

    "autocmd FileType {javascript} set omnifunc=javascriptcomplete#CompleteJS
    set omnifunc=ale#completion#OmniFunc

    autocmd FileType {xml,xslt,html} set omnifunc=htmlcomplete#CompleteTags
endif
"au FileType vue :source /home/za/.config/nvim/plugged/xptemplate/personal/ftplugin/javascript/javascript.xpt.vim
"au FileType vue :source /home/za/.config/nvim/plugged/xptemplate/personal/ftplugin/html/html.xpt.vim
"au BufRead,BufNewFile *.vue set filetype=javascript

nmap ;b <Plug>BookmarkToggle
nmap ;m <Plug>BookmarkShowAll
""  nmap <Leader>i <Plug>BookmarkAnnotate
nmap ;j <Plug>BookmarkNext
""  nmap <Leader>k <Plug>BookmarkPrev
nmap ;r <Plug>BookmarkClear
nmap ;x <Plug>BookmarkClearAll
nnoremap ;h :<C-u>s/<[^>]*>/\r&\r/g<CR>:<C-u>g/^$/d<CR>gg=G

"" for notebook
" nnoremap <PageUp> <nop>
" nnoremap <PageDown> <nop>
" imap <PageUp> <nop>
" imap <PageDown> <nop>

"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>
"set rnu

"set columns=152
"set lines=40
"winpos 10 10
"
let g:xml_syntax_folding = 1
set foldmethod=syntax

:map Q <Nop>

function! NrBufs()
  let i = bufnr('$')
  let j = 0
  while i >= 1
    if buflisted(i)
      let j+=1
    endif
    let i-=1
  endwhile
  return j
endfunction

autocmd BufEnter * silent! :lbadge badge-defaltcd%:p:h

function! Translate()
  let l:save = winsaveview()
  let save_pos = getpos(".")
  normal! yit
  call setpos('.', save_pos)
  normal! h
  normal! a translate=""
  normal! P
  "normal! www
  normal! vi"U
  "execute 'normal! vi"<esc>'
  normal! vi"
  normal! d
  let selected = @*
  echo selected
  let replaced = substitute(selected, " ", "_", "g") 
  execute "normal! i" . replaced . "\<Esc>"
endfunction

nmap ;z :call Translate()<CR>

let g:xptemplate_vars="$author=za"

set autochdir
set browsedir=current

