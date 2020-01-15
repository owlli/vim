# VIM补充笔记





查看vim文档中代表按键的符号的说明

:help keycodes



## vim手册

查看vim用户手册目录

:help usr_toc

查看vim用户手册某一章的内容

:help usr_xx

(xx代表章节数)

:help xxx

查看xxx指令的用法,xxx可以是指令的全称也可以是简写,但是简写有可能会搜索不到想要的结果,比如help指令可以简写为h,执行

:h h

时,只能看到光标移动指令h的介绍,就算执行

:ts

查看所有搜索结果,也只能多看到光标移动到当前页面最上方的指令H的介绍



## 光标跳转

跳转到匹配的括号中去

`%`

跳转到光标所在代码块的开头,如果光标已在代码块的开头,跳到上一段代码块的开头(要求代码块中'{'必须单独占一行)

`[[`

跳转到下一段代码块的开头(要求代码块中'{'必须单独占一行)

`]]`

跳转到光标所在代码块的末尾,如果光标已在代码块的末尾,跳到下一段代码块的末尾(要求代码块中'{'必须单独占一行)

```
(        移动到句首(根据?.!等标点符号),如果已经在句首,跳到上一句的句首,可以在前面加n代表跳n次
)         移动到下一句
{         移动到段首(根据空行)
}         移动到下一段
[[        移动到章首
]]        移动到下一章
z[Enter]  使光标指向的当前行成为屏幕的首行
z.        使光标指向的当前行成为屏幕的中间行
z-        使光标指向的挡前行成为屏幕的尾行
```

在括号内移动

```shell
[{	移动到{}的开始
]}	移动到{}的末尾
[和]后面的{}可以换成()和
```

在/* */类型的注释内移动

```shell
[/	移动到注释的开始
]/	移动到注释的末尾
```



在水平新窗口中打开一个文件,光标不会跳过去

`:pedit xxxx.h`

在c语言的当前文件中和当前文件包含的文件中查找字段名,并在水平新窗口中打开,光标不会跳过去

`:psearch 字段名`



## 其他配置

```shell
set whichwrap-=<,>,h,l  " 设置光标键不跨行
set virtualedit-=block,onemore   " 不允许光标出现在最后一个字符的后面
set splitright           " 在当前文档右边打开新的编辑窗口 (默认:左边)
" set splitbelow         " 在当前文档下面打开新的编辑窗口 (默认:上面)
set clipboard+=unnamed      " 与windows共享剪切板



```





## vim书签的使用

设置书签,x只能是a-z,0-9的字符号

`mx`

跳到书签处,x只能是a-z,0-9的字符号

``x`



## 取消和增加缩进

增加缩进

`x>k`

(x表示需要增加缩进的行数,这里增加缩进的总行数是当前行加x行,k表示方向,比如`5>j`,表示当前行和当前行下面的5行增加缩进)

取消缩进

`x<k`

(x表示需要取消缩进的行数,这里取消缩进的总行数是当前行加x行,k表示方向,比如`5<j`,表示当前行和当前行下面的5行取消缩进)



## 自带的色彩方案

vim8自带色彩方案存放路径

/usr/share/vim/vim80/colors/

打开语法高亮

syntax enable

syntax on

自带的色彩方案太丑了,稍微能看的几个色彩方案如下

colorscheme pablo
colorscheme elflord "默认的主题和ron好像一样的
colorscheme peachpuff
colorscheme koehler"这个目前感觉最棒



## cscope使用方法

### 生成数据库文件

在使用cscope之前我们需要为它准备好它需要使用的库,在我们需要使用cscope的目录使用命令

```shell
cscope -Rbq
```

执行完该命令后在当前目录下会生成cscope.out cscope.in.out cscope.po.out三个文件，其中cscope.out是基本的符号索引，后两个文件是使用”-q”选项生成的，可以加快cscope的索引速度

在缺省情况下,cscope在生成数据库后就会进入它自己的查询界面,我们一般不用这个界面,所以使用了`-b`选项.如果你已经进入了这个界面,按`<C-d>`退出

cscope在生成数据库中,在你的项目目录中未找到的头文件，会自动到/usr/include目录中查找。如果你想阻止它这样做，使用`-k`选项

Cscope缺省只解析C文件(.c和.h)、lex文件(.l)和yacc文件(.y)。如果你想使用cscope解析C++或Java后缀的文件，那么你需要把这些文件的名字和路径保存在一个名为cscope.files的文件。当cscope发现在当前目录中存在cscope.files时，就会为cscope.files中列出的所有文件生成索引数据库。首先进入到你程序所在目录，执行下面命令

```shell
find . –type f > cscope.files
cscope -bq
#也可以这样
find . -name "*.[h|c]" > cscope.files
cscope -bkq -i cscope.files 
```

上面命令将当前目录下的所有文件名以相对路劲的形式添加在cscope.files中了，这样cscope工具在检索的时候会通过该文件去检测文件中包含的所有文件了。上面的cscope命令并没有使用`-R`参数递归查找子目录，因为在cscope.files中已经包含了子目录中的文件。

注意：find命令输出的文件以相对路径表示，所以cscope.out的索引也相对于当前路径。如果你要在其它路径中使用当前的cscope.out，需要使用下面介绍的-P选项

cscope其他选项

> -R	在生成索引文件时，搜索子目录树中的代码 
> -b	只生成索引文件，不进入cscope的界面 
> -q	生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度 
> -k	在生成索引文件时，不搜索/usr/include目录 
> -i	如果保存文件列表的文件名不是cscope.files时，需要加此选项告诉cscope到哪儿去找源文件列表。可以使用”-“，表示由标准输入获得文件列表。 
> -I dir	在-I选项指出的目录中查找头文件 
> -u	扫描所有文件，重新生成交叉索引文件 
> -C	在搜索时忽略大小写 
> -P path	在以相对路径表示的文件前加上的path，这样，你不用切换到你数据库文件所在的目录也可以使用它了。 

Cscope只在第一次解析时扫描全部文件，以后再调用cscope，它只扫描那些改动过的文件，这大大提高了cscope生成索引的速度

### 在vim中使用cscope

在vim的命令行模式可以使用cscope命令,可以简写为cs命令

先调用`cscope add`命令添加一个cscope数据库，然后就可以调用`cscope find find功能 字符`命令进行查找了。vim支持8种cscope的查询功能，如下：

> 0或者s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方 
>
> 1或者g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能 
>
> 2或者d: 查找本函数调用的函数 
>
> 3或者c: 查找调用本函数的函数 
>
> 4或者t: 查找指定的字符串 
>
> 6或者e: 查找egrep模式，相当于egrep功能，但查找速度快多了 
>
> 7或者f: 查找并打开文件，类似vim的find功能 
>
> 8或者i : 查找#include这个文件的文件（们） 

比如:

```shell
#查找所有调用这个函数的函数（们）
:cscope find c ftpd_send_resp
:cscope find 3 ftpd_send_resp
#查找FTPD_CHECK_LOGIN这个符号
:cscope find 0 FTPD_CHECK_LOGIN
#cscope可用cs缩写,find可用f缩写
```

我们还可以进行字符串查找，它会双引号或单引号括起来的内容中查找。还可以输入一个正则表达式，这类似于egrep程序的功能，但它是在交叉索引数据库中查找，速度要快得多

使用cscope时在新窗口中打开

```shell
#水平分割屏幕打开
:scs f c symbol-name
#垂直分割屏幕打开
:vert scs f s symbol-name
```

其他cs命令

```shell
#显示cs帮助
:cs help
#杀掉cscope链接(关闭一个cscope数据库文件)
:cs kill {num|partial_name}
#查看打开的cscope数据库文件
:cs show
#重置cscope数据库
:cs reset
#cscope结果输出到quickfix窗口
:set cscopequickfix=c-,d-,e-,g-,i-,s-,t-
```

### cscope配置选项

> cscopeprg,csprg	指定cscope程序位置
>
> cscopequickfix,csqf		设置是否使用quickfix窗口来显示cscope的结果
>
> cscopetag,cst		搜索定义时使用cscope数据库代替ctags
>
> cscopetagorder,csto	搜索时决定先使用cscope数据库还是ctags(参考连接1的作者如下评论"我通常设置为1，因为在tag文件中查找到的结果，会把最佳匹配列在第一位",我没有验证)

### cscope官方建议使用方法

```shell
:help cscope-suggestions
```

一个经典的cscope使用例子

http://cscope.sourceforge.net/cscope_maps.vim

### 配置常用的快捷键

在.vimrc中加上

```shell
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> 
```

> <C-\>表示，按Ctrl+\
>
> s表示，按s，当然是在松开Ctrl+\之后
>
> 接下来的一串字符就是<C-\>s 定义的命令了
>
> ”:cs find s“ 表示输入的cscope命令
>
> <C-R>=expand("<cword>")<CR>实际上是两部分，<C-R>=表示插入‘=’寄存器的值，expand("<cword>")<CR>表示返回当前光标的函数名或变量名。整体来说就是插入光标下的字符串到cscope命令中

你可以通过以下命令获取更多关于<C-R>以及vim中特殊寄存器的信息

```shell
:help c_CTRL-R
```












### 参考连接

[vim利器—>cscope](https://blog.csdn.net/magiclyj/article/details/79660259)

[vim+cscope+ctags打造属于自己的IDE](https://blog.csdn.net/qq_26671365/article/details/78871835)



## 兼容模式compatible

vim是 vi 的最流行的加强版。它在 vi 的基础上增加了很多功能，但就不与 vi 完全兼容了。

```shell
set compatible
```

就是让vim关闭所有扩展的功能，尽量模拟 vi 的行为。
但这样就不能使用vim的很多强大功能，所以一般没有什么特殊需要的话（比如执行很老的 vi 脚本），都要在 vim 的配置开始，写上

```shell
set nocompatible
```

关闭兼容模式。由于这个选项是最最基础的选项，会连带很多其它选项发生变动（称作副作用），所以它必需是第一个设定的选项



## 文件类型检测filetype

当使用vim打开某种编程语言的文件时，你会看到关键字，函数名等都会高亮.但是把这个文件改一个不常见后缀后再用vim打开,关键字,函数名等的高亮就会消失了,因为vim会识别所打开的文件,这个功能就和文件类型检测filetype相关了

### 查看和设置文件类型检测功能

查看Vim的文件类型检测功能是否已打开

```shell
:filetype
#默认会看到
detection:ON plugin:OFF indent:OFF
```

detection

是否开启文件类型检测功能

开启与关闭命令如下

```shell
:filetype on
:filetype off
```

plugin

是否在Vim的运行时环境目录runtimepath下加载检测到的文件类型相关的插件,自己安装了一些针对某种特定文件的插件,如果想使用,需要打开这个选项.这个选项实际上是执行$vimRUNTIME/ftplugin.vim脚本

开启与关闭命令如下

```shell
:filetype plugin on
:filetype plugin off
```

indent

不同类型文件有不同的缩进方式,这个选项代表是否按检测到的文件类型自动设置缩进,

这条命令也是通过一个脚本来完成加载：$vimRUNTIME/indent.vim

对c类型的文件来说，它只是打开了cindent选项

这个设置会被其他缩进相关的命令覆盖,比如ai,cin,sw,开启与关闭命令如下

```shell
:filetype indent on
:filetype indent on
```

以上三个选项,后两个选项依赖第一个选项,不能单独修改,必须和第一个选项一起修改,比如

```shell
:filetype plugin indent on
```

后两个选项开启时会把第一个选项也开启,但关闭时不会影响第一个选项,比如

```shell
:filetype indent on		#filetype和indent都on
:filetype indent off	#filetype无变化,indenton
```

### 查看和设置检测到的文件类型

filetype检测文件类型的原理是执行$vimRUNTIME/filetype.vim脚本。这个脚本使用了自动命令(autocmd)来根据文件名来判断文件的类型，如果无法根据文件名来判断出文件类型，它又会调用$vimRUNTIME/scripts.vim来根据文件的内容设置文件类型

查看

```shell
:set filetype
:set ft
```

修改

```shell
:set ft=java
```

也可以在文件的开头通过不影响文件本身的注释来说明这个文件类型,vim在打开文件时，会在文件首、尾的若干行（行数由'modelines'选项决定，缺省为5行）检测具有vim特殊标记的行，称为模式行。如果检测到，就使用模式行中定义的选项值，来修改该缓冲区的选项,你可以留意一下vim的帮助页，每个文件的最后一行都是这样的模式行

比如在一个txt后缀的文件的开头加

```shell
// vim: ft=c
vim会认为这是个c文件
或者
#  vim: ft=sh
vim会认为这是个sh文件
```

**注意:注释符//或#或是按照所使用的文件类型的注释符来决定,注释符后面一定要有空格!**

### 自定义文件类型

在vim配置文件中加上

```shell
au BufRead,BufNewFile *.test set filetype=c
```

这句话的意思是让vim把.test后缀的文件识别为c文件

### 参考链接

[每日一Vim（25）filetype---- 文件类型检测](https://www.iteye.com/blog/liuzhijun-1846123)

[为vim 添加配置，使其识别新文件类型](https://blog.csdn.net/xiongzhengxiang/article/details/38357931)

[vi/vim使用进阶: 开启文件类型检测](https://blog.easwy.com/archives/advanced-vim-skills-filetype-on/)

## 缓冲区buffer

vim打开的文件都放在缓冲区中

查看buffer中文件

```shell
:buffers
:files
:ls
```

关闭文件

```shell
:bw
```

:e或:o

o是open的缩写

缓冲区中的文件状态

> \- （非活动的缓冲区）
>
> a （当前被激活缓冲区）    #指光标所在的缓冲区
>
> h （隐藏的缓冲区）
>
> % （当前的缓冲区）          #是指当前窗口可见的缓冲区，因为可以分割窗口，可能有多个
>
> \# （交换缓冲区）             # 代表轮换文件，按 <C - ^> 可以在当前，怎么指定轮换？
>
> = （只读缓冲区）
>
> \+ （已经更改的缓冲区）

### 切换缓冲区

```shell
:buffer <buffer中的编号>
#buffer可以用缩写b代替
:buffer <filename>
```

还有些是:

```shell
:bnext			#下一个
:bprevious		#上一个
:blast			#最后一个
:bfirst			#第一个
```

### 维护缓冲区

```shell
:badd <filename>	#添加一个文件进缓冲区
:bdelete <filename>	#从缓冲区中移除一个文件
```

## 在vim中使用make

在vim可以直接使用

```shell
:make
```

命令来编译当前项目文件

make命令执行的程序为vim变量makeprg的值，默认makeprg=make，使用Makefile机制进行项目的编译、管理。可以通过set makeprg=xxx的命令修改makeprg的值，从而使make命令执行不同的编译.例如:

```shell
:set makeprg=gcc\ hello.c\ -o\ hello
```

变量的值为字符串，当在其中有空格时需要用\进行转义，同样如果想输入\也要进行转义。在vim运行时通过命令行设置的变量值均是临时的，即当推出vim环境时，该变量值会恢复为配置文件中的值或者默认值

推荐使用Makefile的方式进行项目的编译、管理，可以实现项目的自动化管理、有利于提高效率

## quickfix

quickfix是vim自带插件

vim支持make命令

```shell
:make
:make clean
```

通过make命令完成程序的编译工作后，会得到编译结果，一般会有一些编译错误，此时的工作就是对照错误提示修改源文件，然后重新编译。quickfix功能使我们可以直接跳到文件中的错误位置，直接进行修改，并通过使用quickfix的命令完成错误列表的跳转。查看在线帮助，通过命令：

```shell
:help quickfix
```

常用的quickfix命令为：

> :cc     显示详细错误信息
>
> :cp     跳到上一个错误
>
> :cn     跳到下一个错误
>
> :cfirst	跳到第一个错误
>
> :clast	跳到最后一个错误
>
> :ccN	跳到第N个符号处
>
> :cl      列出所有错误(只有那些含有文件名或行数的错误信息会被显示,需要查看那些并不含文件名或行数的信息可用“:cl[ist]!”命令)
>
> :cw     如果有错误列表，则打开quickfix窗口，没有则什么也不错
>
> :copen 打开quickfix窗口，可以在后面添加窗口高度参数，如10行： :copen 10
>
> :cclose 关闭quickfix窗口
>
> :col     到前一个旧的错误列表
>
> :cnew  到后一个较新的错误列表



## VIM代码折叠

折叠用于把缓冲区内某一范围内的文本行显示为屏幕上的一行

那些文本仍然在缓冲区内而没有改变,受到折叠影响的只是文本行显示的方式

折叠的好处是,通过把多行的一节折叠成带有折叠提示的一行,会使你更好地了解文本
的宏观结构

折叠方式foldmethod有6种

> 1. manual //手工定义折叠
> 2. indent //用缩进表示折叠
> 3. expr　 //用表达式来定义折叠
> 4. syntax //用语法高亮来定义折叠
> 5. diff   //对没有更改的文本进行折叠
> 6. marker //用标志折叠

一般只用syntax和indent,设置方法:

```shell
:set foldmethod=syntax"使用语法高亮定义代码折叠
```

折叠级别foldlevel

'foldlevel' 是个数值选项,数字越大则打开的折叠更多

> 当 'foldlevel' 为 0 时，所有的折叠关闭
>
> 当 'foldlevel' 为正数时，一些折叠关闭
>
> 当 'foldlevel' 很大时，所有的折叠打开

打开文件时默认不折叠代码

```shell
set foldlevelstart=99"打开文件是默认不折叠代码
```

> 在打开文件时foldlevelstart选项会覆盖foldlevel的值

折叠栏foldcolumn

'foldcolumn' 是个数字，它在窗口的最左边表示折叠的栏的宽度。当为0时，没有折叠栏。最大是12

展开一个折叠后,此段折叠的折叠栏顶端是 '-',其下方是 '|',这栏在折叠结束的地方结束.当折叠嵌套时,嵌套的折叠出现在被包含的折叠右方一个字符位置

折叠后的代码在折叠栏显示 '+' 

当折叠栏太窄而不能显示所有折叠时,显示一数字来表示嵌套的级别

当mouse=a时,在折叠栏点击鼠标,可以打开和关闭折叠:

- 点击 '+' 打开折叠
- 在任何其他非空字符上点击,折叠这段代码

和折叠相关的快捷键

> za	非嵌套折叠展开/启用光标所在位置的折叠
>
> zA	嵌套展开/启用光标所在位置的折叠
>
> zc	折叠
>
> zC	对所在范围内所有嵌套的折叠点进行折叠
>
> zo	展开折叠
>
> zO	对所在范围内所有嵌套的折叠点展开
>
> zi	展开/启用所有折叠
>
> zM	启用所有折叠
>
> zR	展开所有折叠
>
> [z		到当前打开的折叠的开始处
>
> ]z		到当前打开的折叠的末尾处
>
> zj		向下移动。到达下一个折叠的开始处。关闭的折叠也被计入
>
> zk		向上移动到前一折叠的结束处。关闭的折叠也被计入

其他配置

```shell
" set foldopen=all "光标遇到折叠，折叠就打开
" set foldclose=all "光标移开折叠，自动关闭折叠
```



## 标签的使用

> x是{a-zA-Z}的字母,代表添加标签x

### 添加标签

在普通模式下执行

`mx`

或者在命令行模式下执行

`:ma x`

### 跳转到标签

跳到标签所在位置

``x`

跳到标签所在行

`'x`

### 删除标签

`:delm x`

### 查看所有标签

`:marks`

### 配合其他命令的用法

想删除光标所在行到标签x所在行的内容

在光标所在位置执行`d'x`,删除了光标所在位置和x标签之间所有数据

在光标所在位置执行``d`x``,删除了光标所在行和x标签所在行之间所有数据

## 缩进

TAB替换为空格:

```shell
:set ts=4
:set expandtab
:%retab!
```

空格替换为TAB:

```shell
:set ts=4
:set noexpandtab
:%retab!
```

## 历史记录(待学习)

这块没看

## GUI(待学习)

可以在vimrc中加下面代码更改gvim显示内容

```shell
if g:isGUI      " 使用GUI界面时的设置
    set guioptions+=c        " 使用字符提示框
    set guioptions-=m        " 隐藏菜单栏
    "set guioptions-=T        " 隐藏工具栏
    set guioptions-=L        " 隐藏左侧滚动条
    "set guioptions-=r        " 隐藏右侧滚动条
    set guioptions-=b        " 隐藏底部滚动条
    "set showtabline=0       " 隐藏Tab栏
endif
```



## vim插件

Vim缺乏默认的插件管理器，所有插件的文件都散布在~/.vim下的几个文件夹中，插件的安装与更新与删除都需要自己手动来，既麻烦又可能出现错误,所以就有了很多可以管理插件的插件

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

对于不同的插件，vundle自动管理和下载插件的时候，有不同的地址填写方法，有如下三类： 

1. 在Github上vim-scripts用户下的仓库,只需要写出repos（仓库）名称 
2. 在Github其他用户下的repos, 需要写出”用户名/repos名” 
3. 不在Github上的插件，需要写出git全路径

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

1. 编辑.vimrc文件移除的你要移除的插件所对应的plugin那一行。
2. 保存退出当前的vim
3. 重新打开vim，输入命令BundleClean。

#### 其他常用命令

在安装完成之后就可以使用如下命令查看Vundle的一些使用方法：
`:h vundle`

常用命令有如下四个：
`:BundleUpdate` 更新插件

`:BundleClean` 清除不再使用的插件

`:BundleList` 列出所有插件

`:BundleSearch` 查找插件，找到后按`i`即可安装

`:PlugStatus`	查看插件状态

针对某个插件如ctrlp.vim，可以用如下命令查看该插件的信息：
`:h ctrlp`

注：

- `:PluginSearch`指令所找出来的插件都在[vim-scripts](https://github.com/vim-scripts)，这个仓库里可以找到一些插件的设置方法，文档说明等。
- 关于vimrc应该怎么编写，请看Vundle的说明文档，或者仿照着写应该问题不大。
- Vundle本身也是vim的一个插件，原理就是插件管理着插件而已。

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

> \bv 垂直方向打开一个窗口，显示缓冲区列表
>
> \bs 水平方向打开一个窗口，显示缓冲区列表
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

> <leader>ca	在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
>
> <leader>cc	注释当前行
>
> <leader>cn	和cc一样但是强制嵌套(没懂)
>
> <leader>cm	对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
>
> <leader>c<space>	切换注释/非注释状态
>
> <leader>ci	执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
>
> <leader>cs	以”性感”的方式注释,即以非紧凑的方式注释,详情见手册NERDCommenterSexy
>
> <leader>cy	添加注释，并复制被添加注释的部分
>
> <leader>cA	在当前行尾添加注释符，并进入Insert模式
>
> <leader>cu	取消注释
>
> <leader>c$	从光标开始到行尾注释
>
> <leader>cl或cb	左对齐和左右对其，左右对其主要针对/**/
>
> count<leader>cc	光标以下count行添加注释 
>
> count<leader>cu	光标以下count行取消注释

Normal模式下，几乎所有命令前面都可以指定行数
Visual模式下执行命令，会对选中的特定区块进行注释/反注释

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

> 如果输入的搜索字符都是小写字母，则匹配是大小写不敏感的；如果输入大写字母，则只匹配大写字母，小写字母仍然是大小写不敏感的



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
#默认 :AsyncRun 运行命令后，输出添加到 Quickfix时 Quickfix 会自动滚动到最下面那一行，使用感叹号修饰符以后，可以避免 Quickfix 自动滚动。同时 <cword> 代表当前光标下面的单词

:AsyncStop{!}
停止后台任务（使用 TERM信号），如果有感叹号修饰，则使用 KILL 信号结束
```

### gtags

查找函数的定义和引用位置,可以按tab键补全

```shell
Gtags xxxx			查找xxxx的定义
Gtags -r xxxx		查找xxxx的引用
Gtags -s xxxx		查找xxxx出现的地方(好像有问题,查找一个函数名查找不到)
Gtags -g pattern	搜索pattern指定的字符串
Gtags -gie -pattern	-e选项可以用于搜索’-‘字符，但是基础搜索，没有元字符，-i选项忽略大小写，类似于grep的选项
GtagsCuorsor		取决于光标位置，要是在定义处，查询其引用，要是在引用处，跳转至其定义处，否则就是Gtags -s命令
Gtags -P text		查询包含text的路径名,Gtags -P后接/dir/为列出叫做dir目录下文件，后接\.h$列出所有的include文件
Gtags -f file		列出file里的符号，Gtags -f %则列出当前文件的符号
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