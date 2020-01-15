"在vimrc中,"代表注释
"在选项前加no一般代表取消这个选项,比如"set hlsearch"代表高亮显示搜索结果,"set nohlsearch"代表取消高亮显示搜索结果
"三种缩进方式:
"set autoindent,每行的缩进值与上一行相等
set ai
"set smartindent,开启新行时使用智能缩进
"set si
"set cindent,使用 C/C++ 语言的自动缩进方式
"set cin
"set tabstop,设置tab显示长度为4
set ts=4
"set shiftwidth=4,设置缩进的空格数为4
set sw=4
"set softtabstop=4,设置按退格键时可以一次删掉4个空格,这个值为负数时会使用shiftwidth的值
"注意,这个选项影响vim在插入模式下按tab 键所实际得到的字符,当softtabstop选项值小于tabstop选项值时,第一次按tab键,会插入softtabstop选项值对应的多个空格,当插入的空格个数到达tabstop指定的宽度时,会删除插入的空格,替换成一个tab字符,比如softtabstop=4,tabstop=8,且未设置expandtab,按一次tab会插入4个空格,再按一次tab会删除4个空格增加一个tab键
set sts=4
"使用多个空格代替tab,具体字符数看tabstop定义的长度,如果需要插入真正的tab,按ctrl+v,再按tab,这个选项只会把新插入的tab字符替换成特定数目的空格,不影响文件中已有的tab字符
"注意,当softtabstop=4,tabstop=8,且设置了expandtab,按一次tab会插入4个空格,再按一次tab,会删除4个空格增加一个tab键,但是,此时expandtab会将这个tab转换成8个空格
"set expandtab
"不使用多个空格代替tab,默认
"set noexpandtab
"关闭自动缩进
"set paste
"启用之前设置的自动缩进
"set nopaste

"set number,显示行号
set nu
"set relativenumber,显示相对于光标所在行的其他行的相对行号,不建议使用
"set rnu
"set cursorline,当前行显示下划线
set cul
"set cursorcolumn,高光显示当前列
set cuc
"编辑当前行时,才显示下划线(我的配置文件默认一直显示下划线,所以这个选项对我无用)
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul
"显示所有字符,tab,空格,换行
"set list
"tab显示为>~,空格显示为.,其他替换方法:help listchars
"set listchars=tab:>~,space:.
"整词换行显示
"set linebreak
"带有如下符号的单词不要被换行分割
"set iskeyword+=_,$,@,%,#,-
"强制显示侧边栏(行号左边的一栏,默认为auto,会根据一些插件的显示情况来显示)
"set signcolumn=yes

"设置ctags文件位置
"set tags=/home/lzh/Desktop/s5p6818_study/Linux/src/llinux-3.4/tags
"set tags+=/usr/src/linux-headers-4.15.0-24/tags
"set tags+=/usr/include/tags
"set tags+=/home/lzh/project/bumblebee-device/snowboy-dspc-newest/tags
"设置语法高亮显示
"syntax enable
syntax on
"设定配色方案
"colorscheme desert
"colorscheme pablo
"colorscheme elflord "默认的主题和ron好像一样的
"colorscheme ron
"自己下载的第三方主题molokai
colorscheme molokai
if has("gui_runing")              "如果在图形用户界面
    set background=light          "设置背景色为亮色
else                              "设置背景色为深色
    set background=dark           "就开启256色支持，默认为8色  
    set t_Co=256
endif
"let g:molokai_original = 0
"let g:rehash256 = 0
"高光显示状态栏(默认值为1,正常显示状态栏),就是命令行上方高光显示一行
set laststatus=2
"设置在状态行显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"在状态栏上显示光标所在行,列位置,默认开启,可以set norule关闭,因为我们设置了statusline,所以下面这行无效
"set ruler
"set showmatch,显示匹配的括号,当输入后括号的时候(包括括号,方括号,花括号),光标会跳到前括号,再跳回来,(光标不是真的跳过去,只是前匹配的括号高亮显示)
set sm
"光标跳到匹配的括号时间(单位是十分之一秒)
set matchtime=10
"设置自动备份,如果vim修改一个名为filename文件后,则源文件会被另存成一个档名为filename~的档案
"set backup
"是否在左下角显示--INSERT--之类的提示,默认启用
"set showmode
"一般来说,如果我们按下i进入编辑模式后,可以利用退格键(backspace)来删除任意字符的.但是,某些distribution则不许如此.此时,我们就可以通过backspace来设定.当backspace为2时,就是可以删除任意值;0或1时,仅可删除刚刚输入的字符,而无法删除原本就已经存在的文字了
"set backspace=(012)
"显示不同的颜色色调,ubuntu默认为dark
"set bg=dark
"set bg=light


"在处理未保存或只读文件的时候,弹出确认框
"set confirm
"在切换buffer时自动保存当前文件的修改
set autowrite

"文件显示自动换行,默认
"set wrap 
"不自动换行
"set mowrap

"命令行高度,默认为1
"set cmdheight=1
"允许光标跨越行边界,在行首行尾按左右键可以移动到上下一行
"set whichwrap+=<,>,h,l

"========================搜索相关=============================
"set hlsearch 高亮显示搜索到的文本
set hls
"set incsearch输入搜索内容时就显示搜索结果
set is
"set ignorecase,搜索时忽略大小写
"set ic
"set ignorecase smartcase,搜索时忽略大小写,但输入搜索内容时有一个或以上大写字母时仍保持对大小写敏感
set ic sc
"set noignorecase,搜索时考虑大小写
"set noic
"禁止在搜索到文件两端时重新搜索
set nowrapscan


"========================gui相关==============================
"隐藏工具栏
"set guioptions-=T
"隐藏菜单栏
"set guioptions-=m
"如果文件被其他程序修改了自动重新加载文件,这个选项在终端的vim中无效,只有在gvim中才有效
"set autoread
"设置字体
"set guifont=Courier_New:h10:cANSI




"========================字符编码相关=========================
"打开文件时检测文件的字符编码顺序
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set termencoding=utf-8
"set encoding=utf-8



"如果命令输错不会发出报错提示音,默认
"set noeb
"打开报错提示音
"set eb

"重现打开文件时光标回到上次的位置
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"========================折叠选项=============================
set foldmethod=syntax
set foldlevelstart=99
set foldlevel=0




"自动补齐(),[],{},'',""
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap < <><ESC>i
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i

"设置跳出自动补全的括号
"func SkipPair()
"    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
"        return "\<ESC>la"
"    else
"        return "\t"
"    endif
"endfunc
" 将tab键绑定为跳出括号
"inoremap <TAB> <c-r>=SkipPair()<CR>

"meta键测试,之前用auto-pairs时调试的
"noremap <ESC>x :echo "ESC ALT-X pressed"<cr>
"noremap <M-x> :echo "ALT-X pressed"<cr>
"exec "set <M-x>=\ex"
"set ttimeout ttimeoutlen=100




"=======================cscope配置============================
"因为用了比cscope更快的gutentags,cscope不需要用了
"if has("cscope")
"	set csprg=/usr/bin/cscope
"	set csto=0
"	set cst
"	set nocsverb
"" add any database in current directory
"	if filereadable("cscope.out")
"		cs add cscope.out
"" else add database pointed to by environment
"	elseif $CSCOPE_DB != ""
"		cs add $CSCOPE_DB
"	endif
"	set csverb
"endif
""cscope结果输出到quickfix窗口
"set cscopequickfix=s-,c-,d-,i-,t-,e-
"nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"=======================插件==================================
" Vundle manage
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Nerdtree	显示文件树
Plugin 'scrooloose/nerdtree'
"nerdtree-git-plugin	nerdtree可以显示git仓库状态插件
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Tagbar	显示文件中的宏,函数,变量等
Plugin 'majutsushi/tagbar'
"auto-pairs	自动匹配括号
Plugin 'jiangmiao/auto-pairs'
"minibufferexplorer	在vim最上方显示buffer数据
"Plugin 'minibufexpl.vim' 
"minibufexpl 原作者不再更新,由另外一位开发者在更新
Plugin 'fholgado/minibufexpl.vim'
"Buffer Explorer
Bundle 'bufexplorer.zip'
"winmanager--Fox 
"实际上不需要用这个插件,注释
"Plugin 'vim-scripts/winmanager--Fox'
" NERD Commenter	自动添加注释
Plugin 'scrooloose/nerdcommenter'
"YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
"vim-airline	漂亮的状态栏
Bundle 'bling/vim-airline'
"echofunc	自动显示函数原型
"Plugin 'mbbill/echofunc'
"taglist测试
"Bundle 'taglist.vim'
"LeaderF	模糊查找
Plugin 'Yggdroot/LeaderF', { 'do': './install.sh' }
"Gutentags	异步生产tags索引
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
Plugin 'skywind3000/vim-preview'
"AsyncRun	异步运行Shell指令
Plugin 'skywind3000/asyncrun.vim'
"gtags	Gtags命令工具
Plugin 'gtags.vim'
"Asynchronous Lint Engine	动态语法检测工具
Plugin 'w0rp/ale'
"mark	单词高亮
Plugin	'owlli/mark'
"Signify
"if has('nvim') || has('patch-8.0.902')
"  Plugin 'mhinz/vim-signify'
"else
"  Plugin 'mhinz/vim-signify', { 'branch': 'legacy' }
"endif
"DoxygenToolkit		快速生成Doxygen文档
Plugin 'vim-scripts/DoxygenToolkit.vim'
"vim-multiple-cursors	多光标操作
Bundle 'terryma/vim-multiple-cursors'
"Better Rainbow Parentheses		多彩显示匹配的各种括号
Bundle 'kien/rainbow_parentheses.vim'
"indentLine		可视化缩进
"我一般用tab键进行缩进,所以这个插件基本上用不上,可以使用`:set list lcs=tab:\|\ `,用:来显示tab键
Plugin 'Yggdroot/indentLine'
"vim-easymotion		快速跳转光标
Plugin 'easymotion/vim-easymotion'
"Changes plugin
"显示文件哪些内容被修改,用不上,而且不好用,显示被改的地方在实际地方的上方
"Plugin 'chrisbra/changesPlugin'
"vim-cpp-enhanced-highlight		更好的c/c++语法高亮
Plugin 'octol/vim-cpp-enhanced-highlight'
"echodoc	自动显示函数原型,函数原型来自ycm,比echofunc好用
Plugin 'Shougo/echodoc.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Nerdtree
"显示在左边,默认
"let NERDTreeWinPos='left'
"设置宽度
let NERDTreeWinSize=20
"按f2打开隐藏
map <F2> :NERDTreeToggle<CR>
" 打开文件时关闭树
"let NERDTreeQuitOnOpen=1
"显示书签
let NERDTreeShowBookmarks=1
autocmd StdinReadPre * let s:std_in=1
"当打开vim且没有文件时自动打开NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"显示行号
"let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
"显示隐藏文件
let NERDTreeShowHidden=1
"忽略部分文件
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
"nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
	\ 'Ignored'   : "☒",
    \ "Unknown"   : "?"
    \ }

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
"这句不需要指定的,使用默认ctags命令就行
"let g:tagbar_ctags_bin = 'ctags'
"设置宽度宽度
let g:tagbar_width = 30
"打开下面的文件时自动打开tagbar,下面命令会和echofunc插件冲突,会导致echofunc插件的echofunc脚本中filetype值为tagbar,使CheckTagsLanguage函数返回值为-1,从而无法使用echofunc插件
"autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx call tagbar#autoopen()
"当打开tagbar时,光标自动跳到tagbar窗口
let g:tagbar_autofocus=1

" minibufexpl.vim
"let g:miniBufExplMapWindowNavVim=1 
"let g:miniBufExplMapWindowNavArrows=1 
"let g:miniBufExplMapCTabSwitchBufs=1 
"上面的选项已经过时,最新的MBE已经不提供这些功能,如果想要,:h MiniBufExplKeyboard查看帮助自己加映射

" BufExplorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.

"winmanager
"let g:winManagerWindowLayout="NERDTree|BufExplorer"
"let g:winManagerWindowLayout="NERDTree|Tagbar|BufExplorer"
"let g:NERDTree_title="[NERDTree]"
"let g:Tagbar_title="[Tagbar]"
"function! Tagbar_Start()  
"    exec 'Tagbar'  
"endfunction
"nmap <C-m> :WMToggle<CR>
"function! NERDTree_Start()  
"    exec 'NERDTree'  
"endfunction
"function! NERDTree_IsValid()  
"    return 1  
"endfunction

" YouCompleteMe
"只对白名单中的文件类型生效
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
"关闭语法检查
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"在选择列表中选第一个和最后一个的快捷键默认为tab和shift tab,或者为<C-n>和<C-p>,可以把它们映射成down和up
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0 
"从第2个键入字符就开始罗列匹配项,关闭时默认就是2
"let g:ycm_min_num_of_chars_for_completion=2 
"禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0  
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"ycm函数补全是基于buffer的,如果buffer中没有这个函数,就不会自动补全,如果要开启基于语义的补全,开启下面选项
let g:ycm_key_invoke_completion = '<c-z>'
"输入第二个字符后就开始显示语义补全框
let g:ycm_min_num_identifier_candidate_chars = 2
"自动触发语义补全
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
"语义补全函数,使用上下键选择时,不会自动弹出预览窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
"开启基于tag的补全,可以在这之后添加需要的标签路径,注意,ctags必须是Exuberant Ctags,且生产tags文件时需要加--fields=+l,如果为纯c项目,还需要加--langmap=c:.c.h选项
"let g:ycm_collect_identifiers_from_tags_files = 1
"如果为1,ycm会根据vim识别到的文件类型,把文件中的语法关键字加入补全数据库,默认为0
"let g:ycm_seed_identifiers_with_syntax = 1
"补全后自动关闭预览窗口,没懂
let g:ycm_autoclose_preview_window_after_completion = 1
"回车及选中当前项,不需要
"inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '\<CR>'

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>lo :lopen<CR> "open locationlist
nnoremap <leader>lc :lclose<CR>   "close locationlist
inoremap <leader><leader> <C-x><C-o>"
inoremap <leader><leader> <C-x><C-o>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

"echofunc
"这个查询需要通过下面选项生产的tags文件
"ctags -R --fields=+lS .
"默认切换声明的快捷键和ubuntu的终端快捷键有冲突,重新定义
let g:EchoFuncKeyNext='<Esc>+'
let g:EchoFuncKeyPrev='<Esc>-'

"LeaderF




"Gutentags
"搜索工程目录的标志,碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', '.gitignore']
"所生成的数据文件的名称
let g:gutentags_ctags_tagfile = 'tags'
"同g时开启ctags和gtags支持:
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
"将自动生成的tags文件全部放入~/.cache/tags目录中,避免污染工程目录
"let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_cache_dir = s:vim_tags
"检测 ~/.cache/tags 不存在就新建
"if !isdirectory(s:vim_tags)
"   silent! call mkdir(s:vim_tags, 'p')
"endif
"禁用gutentags自动加载gtags数据库的行为,避免多个项目数据库相互干扰,如果使用了gutentags_plus插件就解决了这个问题
let g:gutentags_auto_add_gtags_cscope = 0
"搜索完成后光标自动移动到quickfix窗口
let g:gutentags_plus_switch = 1
"添加ctags额外参数
"let g:gutentags_ctags_extra_args = ['--fields=+niazlS', '--extra=+q']
let g:gutentags_ctags_extra_args = ['--fields=+lS'] "echofunc插件需要的ctags编译选项
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if isdirectory("kernel/") && isdirectory("mm/")
	let g:gutentags_file_list_command = 'find arch/arm/ mm/ kernel/ include/ init/ lib/'
endif
"gtags-cscope
"s:查找C代码符号
"g:查找本定义
"c:查找调用本函数的函数
"t:查找本字符串
"e:查找本egrep模式
"f:查找本文件
"i:查找包含本文件的文件
"d:查找本函数调用的函数
"禁用默认的按键映射
let g:gutentags_plus_nomap = 1
"定义自己的按键映射
noremap <silent> <c-\>s :GscopeFind s <C-R><C-W><cr>
noremap <silent> <c-\>g :GscopeFind g <C-R><C-W><cr>
noremap <silent> <c-\>c :GscopeFind c <C-R><C-W><cr>
noremap <silent> <c-\>t :GscopeFind t <C-R><C-W><cr>
noremap <silent> <c-\>e :GscopeFind e <C-R><C-W><cr>
noremap <silent> <c-\>f :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <c-\>i :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <c-\>d :GscopeFind d <C-R><C-W><cr>
noremap <silent> <c-\>a :GscopeFind a <C-R><C-W><cr>
"vim-preview
"在quickfix窗口中按p/P来查看/关闭预览窗口
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <Leader>u :PreviewScroll -1<cr> "往上滚动预览窗口
noremap <leader>d :PreviewScroll +1<cr> "  往下滚动预览窗口

"AsyncRun
"自动打开quickfix window,高度为9
let g:asyncrun_open = 9
"任务结束时候响铃提醒
let g:asyncrun_bell = 1

"ale
"除g:ale_linters指定,其他文件不可用
    let g:ale_linters_explicit = 1
    let g:ale_linters = {
\   'cpp': ['cppcheck','clang','gcc'],
\   'c': ['cppcheck','clang', 'gcc'],
\   'python': ['pylint'],
\   'sh': ['shellcheck'],
\   'go': ['golint'],
\}
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
"错误标志
let g:ale_sign_error = '✗'
"警告标志
let g:ale_sign_warning = 'w'
"貌似这个选项没用了
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_format = '%severity%:[%linter%] %code: %%s'
"下面是和severity相关的显示,使用默认即可
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"代表vim在normal模式下文本改变运行linter
let g:ale_lint_on_text_changed = 'normal'
"代表离开insert模式运行linter
let g:ale_lint_on_insert_leave = 1
"是否在airline中显示ale的警告和错误,默认显示
"let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
"设置普通模式下前往上/下一个错误或警告的映射
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-J> <Plug>(ale_next_wrap)
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
"按F7打开关闭代码检查,第一打开文件时,必须要按两次
map <F7> :ALEToggle<CR>

"Signify
"default updatetime 4000ms is not good for async update
set updatetime=100

"DoxygenToolkit
let g:DoxygenToolkit_authorName="lzh"

"vim-multiple-cursors
"选中所有单词快捷键重新定义,默认的<A-n>在终端中的vim下无法使用
let g:multi_cursor_select_all_word_key = '<C-m>'
"从块选择模式离开后删除所有多光标
let g:multi_cursor_exit_from_visual_mode=1
"从插入模式离开后删除所有多光标
let g:multi_cursor_exit_from_insert_mode=1

"Better Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
"不加入这行,防止黑色括号出现,很难识别
" \ ['black',       'SeaGreen3'],
"最多可嵌套16层
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
"打开vim时就启用
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons



"indentLine
"设置对其符号
"let g:indentLine_char='┆'
"不同的缩进等级用不同的符号表示
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"默认使用
let g:indentLine_enabled = 1
"高亮显示对齐符号
"let g:indentLine_setColors = 0
"第一个缩进也用符号显示,别使用,太丑了
"let g:indentLine_showFirstIndentLevel = 1

"vim-easymotion
"默认搜索一个字符跳转
"let g:EasyMotion_smartcase = 1
"行内向左向右跳转
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
"重复上一次动作
map <Leader><leader>. <Plug>(easymotion-repeat)

"echodoc
"必须不在左下角显示模式,否则insert会覆盖函数原型
set noshowmode
"默认启用
let g:echodoc#enable_at_startup = 1






