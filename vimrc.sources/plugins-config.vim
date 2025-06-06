" === ALE ===
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_hover_to_floating_preview = 0
let g:ale_virtualtext_cursor = 'disabled'
let g:airline#extensions#ale#enabled = 1

" === Airline ===
let g:airline_powerline_fonts = 1
let g:airline_theme='monokai_tasty'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 1

" Символы Airline (один из вариантов)
let g:airline_left_sep      = '⮀'
let g:airline_left_alt_sep  = '⮁'
let g:airline_right_sep     = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols       = #{branch: '⭠', readonly: '⭤', linenr: '⭡'}

" === DelimitMate ===
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let b:delimitMate_insert_eol_marker = 1

" === Emmet ===
let g:user_emmet_leader_key = '<C-Z>'

" === Цветовая схема ===
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

" === Прочее ===
set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ 17
let g:tagbar_ctags_bin = '/home/za/usr/bin/ctags'
set tags=tags,./tags,../tags

