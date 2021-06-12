# VIM插件笔记





## vim插件

Vim缺乏默认的插件管理器,所有插件的文件都散布在~/.vim下的几个文件夹中,插件的安装与更新与删除都需要自己手动来,既麻烦又可能出现错误,所以就有了很多可以管理插件的插件

这里先使用vundle

看网上介绍说比较新的插件管理插件vim-plug更好用,等有空再研究吧

### vundle

Vundle 是 Vim bundle 的简称,是一个 Vim 插件管理器

vundle可以:

1. 在.vimrc中跟踪和管理插件
2. 安装特定格式的插件(a.k.a. scripts/bundle)
3. 更新特定格式插件
4. 通过插件名称搜索Vim scripts中的插件
5. 清理未使用的插件
6. 可以通过单一按键完成以上操作,详见[interactive mode](https://github.com/VundleVim/Vundle.vim/blob/v0.10.2/doc/vundle.txt#L319-L360)

vundle自动完成:

1. 管理已安装插件的runtime path
2. 安装和更新后,重新生成帮助标签

#### 安装

```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

#### 配置说明

插件有三种类型: 
1. Github上vim-scripts仓库的插件 
2. Github上非vim-scripts仓库的插件 
3. 不在Github上的插件 

对于不同的插件,vundle自动管理和下载插件的时候,有不同的地址填写方法,有如下三类： 

1. 在Github上vim-scripts用户下的仓库,只需要写出repos(仓库)名称 
2. 在Github其他用户下的repos, 需要写出”用户名/repos名” 
3. 不在Github上的插件,需要写出git全路径

#### 配置

打开~/.vimrc,将下面的部分内容添加进去

```shell
"去除VI一致性,必须要添加
set nocompatible              " be iMproved, required
"必须要添加,关闭文件类型检测,详细作用未理解,后面会撤回
filetype off                  " required

"设置包括vundle和初始化相关的runtime path
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"另一种选择, 指定一个vundle安装插件的路径
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"让vundle管理插件版本,必须
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

">>>>>>>>>>>>>>>>>>>>下面的内容是需要管理的插件,根据实际情况填写
"以下范例用来支持不同格式的插件安装.
"请将安装插件的命令放在vundle#begin和vundle#end之间
"Github上的插件,格式为 Plugin '用户名/插件仓库名'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"来自 http://vim-scripts.org/vim/scripts.html 的插件
"格式为 Plugin '插件名称'
"实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
"由Git支持但不再github上的插件仓库
"格式为 Plugin 'git clone 后面的地址'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
"本地的Git仓库(例如自己的插件)
"格式为 Plugin 'file:///+本地插件仓库绝对路径'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
"定制其他参数,这里定制的是rtp参数
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"如果有同名的插件,可以改插件名
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" <<<<<<<<<<<<<<<<<<<<<<上面的内容是需要管理的插件,根据实际情况填写

"你的所有插件需要在下面这行之前
" All of your Plugins must be added before the following line
call vundle#end()            " required
"重现打开文件类型检测
filetype plugin indent on    " required
"上面那句可以用下面这句代替,忽视插件改变缩进,可以使用以下替代
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
```

#### 安装插件

配置好需要安装的插件后,在vim中执行

```shell
:PluginInstall
```

或者在shell中执行

```shell
vim +PluginInstall +qall
```

#### 移除不需要的插件

1. 编辑.vimrc文件移除的你要移除的插件所对应的plugin那一行.
2. 保存退出当前的vim
3. 重新打开vim,输入命令BundleClean.

#### 其他常用命令

在安装完成之后就可以使用如下命令查看Vundle的一些使用方法：
`:h vundle`

常用命令有如下四个：
`:BundleUpdate` 更新插件

`:BundleClean` 清除不再使用的插件

`:BundleList` 列出所有插件

`:BundleSearch` 查找插件,找到后按`i`即可安装

`:PlugStatus`	查看插件状态

针对某个插件如ctrlp.vim,可以用如下命令查看该插件的信息：
`:h ctrlp`

注：

- `:PluginSearch`指令所找出来的插件都在[vim-scripts](https://github.com/vim-scripts),这个仓库里可以找到一些插件的设置方法,文档说明等.
- 关于vimrc应该怎么编写,请看Vundle的说明文档,或者仿照着写应该问题不大.
- Vundle本身也是vim的一个插件,原理就是插件管理着插件而已.

#### 参考链接

[vundle - vim使用之先行配置简介](https://blog.csdn.net/xiaoxigua666/article/details/79410139/)

[使用Vundle管理Vim插件](https://www.cnblogs.com/xcw0754/p/8391711.html)

### NerdTree

见我的vimrc文件

### nerdtree-git-plugin

https://github.com/Xuyuanp/nerdtree-git-plugin

nerdtree可以显示git仓库状态插件

建议状态用下面图标显示

```shell
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
```



### Tagbar

见我的vimrc文件

### Auto Pairs

详细用法非常复杂,自己搜索

### MinaBufExplorer

当打开多个文件时,在vim最上方显示打开的文件

### BufExplorer

> \bv 垂直方向打开一个窗口,显示缓冲区列表
>
> \bs 水平方向打开一个窗口,显示缓冲区列表
>
> \be 在当前编辑窗口中显示缓冲区列表
>
> s 排序

### winmanager

作者很多年没维护了,太复杂,不太好用

### NERD Commenter

自动添加注释

使用方法

普通模式下按`<leader> + 指令`

<leader>是键盘映射,默认情况下是反斜杆`\`,可以在命令行模式下把<leader>定义为其他键,比如定义为`'`键

```shell
:let mapleader=“,”
```

指令包括

注意:下面部分指令是vim自带的快捷键,比如c$(删除光标到行尾的字符并进入插入模式),所以这里按完逗号,要快一点按指令

> <leader>ca	在可选的注释方式之间切换,比如C/C++ 的块注释/* */和行注释//
>
> <leader>cc	注释当前行
>
> <leader>cn	和cc一样但是强制嵌套(没懂)
>
> <leader>cm	对被选区域用一对注释符进行注释,前面的注释对每一行都会添加注释
>
> <leader>c<space>	切换注释/非注释状态
>
> <leader>ci	执行反转注释操作,选中区域注释部分取消注释,非注释部分添加注释
>
> <leader>cs	以”性感”的方式注释,即以非紧凑的方式注释,详情见手册NERDCommenterSexy
>
> <leader>cy	添加注释,并复制被添加注释的部分
>
> <leader>cA	在当前行尾添加注释符,并进入Insert模式
>
> <leader>cu	取消注释
>
> <leader>c$	从光标开始到行尾注释
>
> <leader>cl或cb	左对齐和左右对其,左右对其主要针对/**/
>
> count<leader>cc	光标以下count行添加注释 
>
> count<leader>cu	光标以下count行取消注释

Normal模式下,几乎所有命令前面都可以指定行数
Visual模式下执行命令,会对选中的特定区块进行注释/反注释

### YouCompleteMe

https://github.com/ycm-core/YouCompleteMe

安装比较麻烦,需要翻墙,看奔跑吧linux内核入门篇

ycm函数补全是基于buffer的,如果buffer中没有这个函数,就不会自动补全,如果要开启基于语义的补全,开启下面选项

默认是用 CTRL+SPACE 来触发补全的,中文操作系统下,CTRL+SPACE被系统劫持用作输入法切换,无法正确传到终端,所以一般要改成 CTRL+Z

let g:ycm_key_invoke_completion = '<c-z>'



`ctrl-y>`	取消显示当前出现的补全



参考链接:[YouCompleteMe 中容易忽略的配置](https://zhuanlan.zhihu.com/p/33046090)

### vim-airline

漂亮的状态栏,纯vim script,比python的powerline快

### echofunc

这个插件需要项目存在tags文件.且在创建tags文件时需要加`--fields=+lS`

在插入模式输入函数名后的"("时,在命令行栏会显示函数的声明

如果存在多个声明,按`alt + -`和`alt + =`向前和向后翻页,这个两个键可以通过设置g:EchoFuncKeyNext和g:EchoFuncKeyPrev参数来修改

注意:这个插件会和tagbar插件的一行配置冲突

```shell
autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx call tagbar#autoopen()
```

这行配置会导致echofunc插件的echofunc脚本中filetype值为tagbar,使CheckTagsLanguage函数返回值为-1,从而无法使用echofunc插件

如果你在编译vim时加上了"+balloon_eval"特性,那么当你把鼠标放在函数名上的时候会有一个tip窗口弹出,该窗口中也会有函数的声明(在终端下无效,原因未明)



### LeaderF

地址:https://github.com/Yggdroot/LeaderF

安装:

用vundle安装时需要加参数

```shell
Plugin 'Yggdroot/LeaderF', { 'do': './install.sh' }
```

搜索文件

`<leader>f`或`:LeaderfFile`

leader在NERD Commenter插件处介绍过了

搜索buffer

`<leader>b`或`:LeaderfBuffer`

搜索最近使用过的文件(search most recently used files,Mru)

`:LeaderfMru`

搜索当前文件中的函数

`:LeaderfFunction`

搜索当前文件中的字符

`:LeaderfLine`

在tags文件中搜索

`:LeaderfTag`

查看帮助

`:Leaderf -h`

甚至可以搜索自己的所有功能

`:Leaderf self`

在 LeaderF 运行起来以后(在正常检索的模式下),可以执行下面的一些操作:

```shell
<C-C>, <ESC> : 退出 LeaderF
<C-R> : 在模糊匹配和正则式匹配之间切换
<C-F> : 在全路径搜索和名字搜索之间切换
<Tab> : 在检索模式和选择模式之间切换
<C-J>, <C-K> : 在结果列表里选择
<C-X> : 在水平窗口打开
<C-]> : 在垂直窗口打开
<C-T> : 在新标签打开
<C-P> : 预览结果
<Up>/<Down> : 向上/下翻看查找的历史记录
```

在 LeaderF 检索文件的模式下,如果按 Tab 进入选择列表之后,会有其他的快捷键,可以通过 F1 来查看

集成 ripgrep 进行检索是 LeaderF 很强大的一个功能,rg 是异步的,比 vimgrep 要好很多.而且,对结果可以进行二次过滤:

```shell
:LeaderfRgRecall		#显示上次 rg 的结果
:Leaderf rg				#实时检索
:Leaderf rg [option]	#后面的 [option] 和 rg 的语法保持一致
```

其他一些特点

> 如果输入的搜索字符都是小写字母,则匹配是大小写不敏感的；如果输入大写字母,则只匹配大写字母,小写字母仍然是大小写不敏感的



### Gutentags,gutentags_plus,vim-preview

https://github.com/ludovicchabant/vim-gutentags

https://github.com/skywind3000/gutentags_plus

异步生产tags索引插件,更改文件保存后,会在后台自动更新tags文件,将 gutentags 搭配 gutentags_plus 一起使用,前者提供 gtags 数据库的无缝更新,后者提供数据库无缝切换

不使用cscope和ctags,使用gtags-cscope和gtags,需要安装global

```shell
sudo apt install global
```

插件安装方法

```shell
Plugin 'ludovicchabant/vim-gutentags'
#下面这两个插件是配合着用的
Plugin 'skywind3000/gutentags_plus'
Plugin 'skywind3000/vim-preview'
```

按照我的.vimrc中的配置方法配置后,就可以直接使用了

gutentags会根据你打开文件所在的工程目录(gutentags 搜索工程目录的标志是向上递归查找'.root', '.svn', '.git', '.hg', '.project',找到任意一个标志就停止)自动生成的 tags,GRTAGS,GPATH和GTAGS文件,并自动执行`set cscopeprg=gtags-cscope`和`cs add GTAGS`

有了这些文件后,可以像使用ctags和cscope工具一样在项目中查找字符,函数等内容的定义和引用

使用了vim-preview插件并配置后,在quickfix窗口,选中需要查看的内容后按`p`就可以在新窗口预览详细内容了,按`P`可自动关闭新窗口

### AsyncRun

异步运行Shell指令,并在quickfix显示

例子:

```shell
:AsyncRun gcc % -o %<
:AsyncRun g++ -O3 % -o %< -lpthread 
#该命令会在后台运行 gcc 并且把输出实时显示在 Quickfix 窗口,宏 % 代表当前文件名,%< 代表没有扩展名的文件名

:AsyncRun! grep -R word . 
:AsyncRun! grep -R <cword> .
#默认 :AsyncRun 运行命令后,输出添加到 Quickfix时 Quickfix 会自动滚动到最下面那一行,使用感叹号修饰符以后,可以避免 Quickfix 自动滚动.同时 <cword> 代表当前光标下面的单词

:AsyncStop{!}
停止后台任务(使用 TERM信号),如果有感叹号修饰,则使用 KILL 信号结束
```

### gtags

查找函数的定义和引用位置,可以按tab键补全

```shell
Gtags xxxx			查找xxxx的定义
Gtags -r xxxx		查找xxxx的引用
Gtags -s xxxx		查找xxxx出现的地方(好像有问题,查找一个函数名查找不到)
Gtags -g pattern	搜索pattern指定的字符串
Gtags -gie -pattern	-e选项可以用于搜索’-‘字符,但是基础搜索,没有元字符,-i选项忽略大小写,类似于grep的选项
GtagsCuorsor		取决于光标位置,要是在定义处,查询其引用,要是在引用处,跳转至其定义处,否则就是Gtags -s命令
Gtags -P text		查询包含text的路径名,Gtags -P后接/dir/为列出叫做dir目录下文件,后接\.h$列出所有的include文件
Gtags -f file		列出file里的符号,Gtags -f %则列出当前文件的符号
```

### ALE,Asynchronous Lint Engine

https://github.com/dense-analysis/ale

ALE,动态语法检测工具

如果语法有问题,会实时提醒,光标移动到这一行时会显示错误原因

```shell
#禁用代码检查
:ALEDisable
#启用代码检查
:ALEEnable
#查看详细描述
:ALEDetail
#查看上一个/下一个警告或错误(不会在文件中循环)
:ALEPrevious/:ALENext
#查看上一个/下一个警告或错误(会在文件中循环)
:ALEPreviousWrap/:ALENextWrap
```

### mark

https://www.vim.org/scripts/script.php?script_id=1238

高亮单词

```shell
\m 高亮单词
\n 清除
\r 根据正则高亮git
\* 下一个
\# 上一个
```

### Signify

通过 signify 这个插件,对于打开有版本控制的文件,可以在文件侧边实时显示文件的修改情况

`:SignifyDiff`	可以直接打开新 tab 对比版本差异,常用可以设置快捷键触发(必须在有版本控制的目录中才有效)

### DoxygenToolkit

自动添加Doxygen风格的代码文档

```shell
#生成许可协议
:DoxLic
#添加作者信息
:DoxAuthor
#添加注释,如果在函数名所在行上,添加函数的注释
:Dox
#README文件中这个命令的使用方法写错了,不能加括号.对某块代码添加条件编译,这个功能一直不能实现,不知道原因
#后面看脚本发现是在#ifdef DEBUG的条件编译代码块外用#ifndef DOX_SKIP_BLOCK这样的代码块包起来了,不懂这是在做什么
:DoxUndoc DEBUG
```

### vim-multiple-cursors

https://github.com/terryma/vim-multiple-cursors

多光标编辑,不过只能通过搜索相同的字符建立新光标

有两种使用方法,其实差不多

1. 在普通模式下,在一个单词上按`<C-n>`,将选中这个单词并在单词后面加上一个光标,再次按`<C-n>`,将向下寻找同名单词并在找到的单词后面加一个光标,这样的操作可重复多次.有了多个光标后,可以按方向键移动多个光标,也可以按c, s, I, A进入插入模式进行编辑操作

2. 先进入块选择模式,选择某块字符后,按`<C-n>`,自动向下寻找选中的字符块并加光标

如果用第一种方法在符号上面按`<C-n>`,可能不会向下选中字符,这是可以按`g<C-n>`,或者通过先进入块选择的第二种方法

其他操作:

```shell
ctrl+n	开始选择多光标并选中一个单词/向下选中一个单词
ctrl+p	取消选中的单词,回到上一个选中的单词
ctrl+x	跳过当前选中的单词,向下选中一个单词
esc		退出
ctrl+m	选中文件中所有的这个单词
```

**注意:默认的1`<A-n>`键在终端下的vim不生效,只有在gvim中才生效,所以通过`let g:multi_cursor_select_all_word_key = '<C-m>'`选项,将`<A-n>`改成了`<C-m>`**

### Better Rainbow Parentheses

https://github.com/kien/rainbow_parentheses.vim

多彩显示匹配的各种括号

### indentLine

https://github.com/Yggdroot/indentLine

可视化缩进

我一般用tab键进行缩进,所以这个插件基本上用不上,可以使用`:set list lcs=tab:\|\ `,用:来显示tab键

### vim-easymotion

https://github.com/easymotion/vim-easymotion

快速地移动光标

启动后,在当前屏幕需要移动的字符前加符号,按相应的符号即可将光标移到对应的字符前

按两下`<leader>`键再加一个功能键即可启动此插件

`\\w`	向后跳转

`\\b`	向前跳转

`\\s`	按完后再按一个想跳转的字符,搜索跳转

`\\j`	向下面行跳转

`\\k`	向上面行跳转

其他行内跳转,重复上一次动作见我的.vimrc文件配置

### Changes plugin

https://github.com/chrisbra/changesPlugin

显示文件哪些内容被修改

不好用,和ALE,Signify有冲突,关了

### vim-cpp-enhanced-highlight

https://github.com/octol/vim-cpp-enhanced-highlight

更好的c/c++语法高亮

### echodoc

https://github.com/Shougo/echodoc.vim

在showmode行自动显示函数原型,函数原型来自ycm,比echofunc好用

**注意,必须使用ycm的语义补全,且必须在补全框中选中函数按(号才会出现函数原型,全部自己手动敲的函数名不会出现函数原型**