"颜色主题
colorscheme desertEx
set t_Co=256
"darkburn

"不兼容老的vi模式
set nocompatible

"执行pathogen插件
call pathogen#infect()

"打开语法高亮
syntax on

"打开文件类型探测
filetype plugin indent on

"现实行号
set nu

"设置自动换行
set wrap

"设置自动折叠代码
"set foldmethod=syntax

"设置缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

"设置search高亮
set hlsearch 
set incsearch

"设置编码
set termencoding=utf-8
set encoding=utf-8

"启用鼠标
set mouse=a

"设置<leader>
"when use just in normal mode type ,ee   
let mapleader = "," 

"设置.vimrc相关
"Fast reloading of the .vimrc  
map <silent> <leader>ss :source ~/.vimrc<cr>  
"Fast editing of .vimrc  
map <silent> <leader>ee :e ~/.vimrc<cr>  
"When .vimrc is edited, reload it  
"autocmd! bufwritepost .vimrc source ~/.vimrc  

"配置nerdtree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowBookmarks=1
let NERDTreeAutoCenter=1
let NERDTreeMouseMode=2
let NERDTreeWinPos='left'
let NERDTreeWinSize=25
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen=1
map <silent> <leader>nt :NERDTreeToggle<cr>
map <silent> <leader>nf :NERDTreeFind<cr>

"配置taglist
"let Tlist_Ctags_Cmd='/bin/ctags'
"let Tlist_Ctags_Cmd='ctags.exe'
let Tlist_Show_One_File=1
let Tlist_OnlyWindow=1
let Tlist_Use_Right_Window=0
let Tlist_Sort_Type='name'
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=0
let Tlist_Max_Submenu_Items=10
let Tlist_Max_Tag_length=20
let Tlist_Use_SingleClick=0
let Tlist_Auto_Open=0
let Tlist_Close_On_Select=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Process_File_Always=1
let Tlist_WinHeight=10
let Tlist_WinWidth=30
let Tlist_Use_Horiz_Window=0
map <silent> <leader>tl :TlistToggle<cr>
"autocmd FileType cpp,c,pyton s:TlistToggle<cr>

"配置BufExplorer
let g:bufExplorerShowTabBuffer=1
let g:bufExplorerDefaultHelp=0

"配置MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1

"配置a.vim
map <silent> <leader>aa :A<cr>
map <silent> <leader>av :AV<cr>
map <silent> <leader>as :AS<cr>

"配置autofmt
let s:unicode = unicode#import()
let s:orig_prop_line_break = s:unicode.prop_line_break
function! s:unicode.prop_line_break(char)
    if a:char == "\u201c" || a:char == "\u2018"
        return "OP"   " Open Punctuation
    elseif a:char == "\u201d" || a:char == "\u2019"
        return "CL"   " Close Punctuation
    endif
    return call(s:orig_prop_line_break, [a:char], self)
endfunction

"配置快捷键
map <silent> <leader>wh <c-w>h
map <silent> <leader>wl <c-w>l
map <silent> <leader>ww <c-w><c-w>

if has("autocmd")
    filetype plugin indent on 
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                    \ endif
    augroup END
else
    set autoindent 
endif 
set vb t_vb=

