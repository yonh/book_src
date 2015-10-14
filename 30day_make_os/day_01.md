# 简单回顾
这节没什么做的，首先是用二进制写了个镜像文件，然后通过虚拟机运行，二进制文件可以不用写了，直接用作者写好的拷过来用吧  

直接拷贝CD下面的img和文中提到的bat文件吧，我这里因为个人做笔记的需要，也更改了下，把所有文件按照  天数/第几次修改/具体代码，如: 01/a/  表示第一天第一次修改的代码  而代码下所需要用到的代码全放在tools文件夹里面了(最外层的tools是全部的工具，代码目录外层的tools就是根据学习的程度逐步添加[貌似意义不大]）  

好了当做好了这一切，我们现在只是简单的执行01/a/run.bat文件就可以了使用虚拟机打开加载这个镜像文件  
此处的run.bat如下  
copy helloos.img ..\..\tools\qemu\fdimage0.bin  
..\..\tools\make.exe	-C ..\..\tools\qemu  

#目录树  
├── 01  
│   └── a  
│       ├── !cons_nt.bat  
│       ├── helloos.img  
│       └── run.bat  
└── tools  
    ├── make.exe  
    └── qemu  
        ├── bios.bin  
        ├── fdimage0.bin  
        ├── Makefile  
        ├── qemu.exe  
        ├── qemu-win.bat  
        ├── SDL.dll  
        └── vgabios.bin  

#使用汇编编译  
此时我们的工具集多了nask这个汇编编译器，由作者编写的(由于作者的代码用nasm直接不能编译，所以为了降低学习难度我也就用这个来做了)  
代码见/01/b/helloos.asm  
使用nask编译helloos.asm，得到helloos.img  
执行!cons_nt.bat输入以下命令  
..\..\tools\nask.exe helloos.asm helloos.img  
或  
asm #asm是一个批处理文件  

执行run.bat可以执行查看运行结果，和上次一样  


编写更漂亮的汇编程序  
代码见/01/c/helloos.asm
