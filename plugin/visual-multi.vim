""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File:         visual-multi.vim
" Description:  multiple selections in vim
" Mantainer:    Gianmaria Bajo <mg1979.git@gmail.com>
" Url:          https://github.com/mg979/vim-visual-multi
" Licence:      The MIT License (MIT)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Initialize variables

let g:loaded_visual_multi = 1

com! -nargs=? -complete=customlist,vm#themes#complete
      \ VMTheme  call vm#themes#load(<q-args>)
com!    VMConfig call vm#special#config#start()
com!    VMDebug  call vm#special#help#debug()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Vm = { 'hi'          : {},
      \ 'is_active'        : 0,
      \ 'extend_mode'      : 0,
      \ 'selecting'        : 0,
      \ 'mappings_enabled' : 0,
      \ 'last_ex'          : '',
      \ 'last_normal'      : '',
      \ 'last_visual'      : '',
      \ 'oldupdate'        : exists("##TextYankPost") ? 0 : &updatetime,
      \}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Global mappings

call vm#plugs#permanent()
call vm#maps#default()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands

augroup plugin-visual-multi-start
    au!
    au ColorScheme  * call vm#themes#init()
    if exists("##TextYankPost")
        au TextYankPost * call vm#operators#after_yank()
    else
        au CursorMoved  * call vm#operators#after_yank()
        au CursorHold   * call vm#operators#after_yank()
    endif
augroup END

