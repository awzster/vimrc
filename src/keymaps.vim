" ALE toggle
nmap ;e :ALEToggle<cr>

" Быстрые команды
nmap <leader>t :call TrimWhitespace()<CR>
nmap <leader>s :so ~/.vimrc<CR>
nmap <silent> <leader><leader> :noh<CR>
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
nnoremap Q a<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

nmap ;d : call DeployCurrentBuffer()<cr><esc>
nmap ;l :silent call MergeCurrentBuffer()<cr>:redraw<cr>
nmap ;a :call MergeAllBuffers()<cr>
"nmap ;t :set noexpandtab<cr>:retab!<cr>
nmap ;t :call TabToSpace()<cr>
nmap ;s :set expandtab<cr>

" Буферы и вкладки
map <S-left> :bp<cr>
nmap <S-left> :bp<cr>
imap <S-left> <ESC>:bp<cr>i
map <S-right> :bn<cr>
nmap <S-right> :bn<cr>
imap <S-right> <ESC>:bn<cr>i
map <C-Tab> :bn<cr>
nmap <C-Tab> :bn<cr>
imap <C-Tab> <ESC>:bn<cr>i

" Вырезать-копировать-вставить через Ctrl
vnoremap <C-X> "+x
vnoremap <C-C> "+y

" Домашние клавиши
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

" Быстрое выделение последнего вставленного текста
nnoremap <expr> <leader>p '`[' . strpart(getregtype(), 0, 1) . '`]'

" Быстрое удаление без копирования
nnoremap s "_d
nnoremap ss "_dd

nmap <F4> :e ~/.vimrc<cr>
nmap <F2> bve
nnoremap <silent> <F9> :TlistToggle<CR>
nnoremap <F8> Go<Esc>O<Esc>:put =strftime(\"%d/%m/%y %H:%M:%S\")<cr>o<Esc>o<Esc>:w<cr>
nmap <C-Z> :undo<cr>
imap <C-Z> <Esc> :undo<cr>
vnoremap // y/<C-R>"<CR>

"COC
" Вызов меню автодополнения вручную
inoremap <C-n> <C-n>
inoremap <C-p> <C-p>

" Навигация по выпадающему меню автодополнения
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-n>" 
inoremap <expr> <C-p> pumvisible() ? "\<C-p>" : "\<C-p>"

" Подтверждение выбора (Enter)
"inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Переход к определению, типу, ссылкам и диагностике
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gr <Plug>(coc-references)
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Переименование
"nmap <leader>rn <Plug>(coc-rename)

" Форматирование кода
"command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
"command! -nargs=* StyleFix :!stylelint --fix --config ~/.vim/.stylelintrc.json %
"autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx :call CocAction('format')

"COC
"inoremap <expr> <C-n> coc#refresh()

" Вызов code action на курсоре
"nmap <leader>ac <Plug>(coc-codeaction-cursor)

" Вызов code action на выделенном диапазоне
"xmap <leader>ac <Plug>(coc-codeaction-selected)

" Вызов всех code actions для текущего буфера
"nmap <leader>as <Plug>(coc-codeaction-source)

" Форматирование всего файла через ESLint autofix
"nnoremap <silent> <Leader>jf :CocCommand eslint.executeAutofix<CR>
" Форматирование выделенного текста через ESLint autofix
"xnoremap <silent> <Leader>jf :<C-u>CocCommand eslint.executeAutofix<CR>

"nnoremap <silent> <Leader>hf :CocCommand prettier.formatFile<CR>

"autocmd BufWritePre *.css :silent! :CocCommand stylelint.executeAutofix

