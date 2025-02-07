<p align="center">
<img alt="" src="https://badg.now.sh/badge/release/v0.0.1?color=green" style="display: inline-block;" />
<img alt="" src="https://badg.now.sh/badge/build/pass?color=green" style="display: inline-block;" />
<img alt="" src="https://badg.now.sh/badge/cjc/v0.35.6?color=green" style="display: inline-block;" />
<img alt="" src="https://badg.now.sh/badge/cjcov/73.3%25?color=green" style="display: inline-block;" />
<img alt="" src="https://badg.now.sh/badge/project/open?color=green" style="display: inline-block;" />
</p>



## <img alt="" src="./doc/assets/readme-icon-introduction.png" style="display: inline-block;" width=3%/>介绍

Qt是一个跨平台的C++图形开发框架，是目前主流的跨平台GUI库之一。

CjQt是Qt的仓颉语言绑定，提供仓颉语言风格的Qt类和函数的API封装。

项目基于QT5.14.2版本构建，基于windows环境测试

目前仓颉仅支持64位系统，因此需要在相应64位系统上安装64位的C++环境及QT5.14.2

### 路线

- 近期目标：实现Demo运行
- 中期目标：常用QT类封装
- 长期目标：完成QT类封装



### 当前进度

- [QWidgets封装进度](./doc/qt_widgets.md)
- [QCore封装进度](./doc/qt_core.md)
- [QGui封装进度](./doc/qt_gui.md)


##    <img alt="" src="./doc/assets/readme-icon-framework.png" style="display: inline-block;" width=3%/> 软件架构


### 源码目录

```shell
.
├── README.md
├── doc
│   ├── api
│   ├── assets     
│   ├── cjcov  
│   └── develop 
├── example
│   ├── draw
│   ├── feeluown
│   ├── frame
│   ├── hello
│   ├── lineEdit
│   ├── notepad
│   ├── scrollBar
│   └── tetris
├── native
│   ├── build
│   ├── includes
│   │   ├── core
│   │   ├── gui
│   │   └── widgets
│   ├── lib
│   ├── src
│   │   ├── core
│   │   ├── gui
│   │   └── widgets
│   └── CMakeLists.txt
├── src
│   └── qt
│       ├── core。、
│       ├── gui
│       ├── tools
│       ├── widgets
│       └── main.cj
└── test   
    └── LLT
```

- `doc`是库的设计文档、提案、库的使用文档
- `example`是cjqt项目的使用示例
- `native`是C语言绑定QT库源码目录
- `src`是库源码目录
- `test`是存放测试用例，包括LLT 用例

## <img alt="" src="./doc/assets/readme-icon-compile.png" style="display: inline-block;" width=3%/>编译执行

### 接口说明

cjqt类和成员函数说明，详情见 [API](./doc/api/index.html)

### Linux环境安装依赖

Linux环境需安装 libxkbcommon-x11
```shell
sudo apt-get install libxkbcommon-x11-0
```


### 项目使用（源码引用方式）

克隆cjqt项目到本地
```shell
https://gitcode.com/Cangjie-TPC/CJQT.git
```


### 项目编译

1.安装p配置64位c++环境

2.下载安装QT

下载QT文件[qt-opensource-linux-x64-5.14.2.run](https://download.qt.io/archive/qt/5.14/5.14.2/)到安装目录

安装 QT
```shell
chmod +x qt-opensource-linux-x64-5.14.2.run
./qt-opensource-linux-x64-5.14.2.run
```

配置QT_HOME环境变量如下：其中 D:\Qt 为qt安装路径

3.编译native
使用 Qt Creator构建native项目
打开项目，选择CJQT\native\CMakeLists.txt，打开nativeQT项目，之后进行使用64位gcc构建，例如使用mingw64进行构建，构建目录建议为 CJQT\native\build

4.编译cjqt项目
使用cjpm build进行构建。如native构建目录选择其他目录，则需要相应修改cjqt项目下cjpm.toml文件中的nativeQt配置

5.设置运行环境变量
将QT、native、CJQT都添加到环境变量path中
D:\Qt\Qt5.14.2\5.14.2\mingw73_64\bin      #D:\Qt为qt安装目录
D:\Qt\Qt5.14.2\Tools\mingw730_64\bin
D:\work\CJQT\native\build                 #D:\work\CJQT为cjqt代码所在目录
D:\work\CJQT\target\release\cjqt

6.example示例运行

### hello示例

[hello示例详情](./example/hello)

选择example\hello项目，使用cjpm build进行构建，之后运行target\release\bin\main文件

也可执行命令如下：

Linux下：
```shell
./example/hello/run.sh 
```

Windows下：
```shell
.\example\hello\run.ps1 
```

执行效果：
<p align="center">
<img src="./doc/assets/qt_demo.png" width="60%" >
</p>

### 俄罗斯方块游戏示例

[俄罗斯方块示例详情](./example/tetris)

选择example\hello项目，使用cjpm build进行构建，之后运行target\release\bin\main文件

也可执行命令如下：

Linux下：
```shell
./example/tetris/run.sh
```

Windows下：
```shell
.\example\tetris\run.ps1 
```

执行效果：
<p align="center">
<img src="./doc/assets/tetris_demo.png" width="60%" >
</p>

### 记事本示例

[记事本示例详情](./example/notepad)

执行命令：

Linux下：
```shell
./example/notepad/run.sh
```

Windows下：
```shell
.\example\notepad\run.ps1 
```

执行效果：
<p align="center">
<img src="./doc/assets/notepad_demo.png" width="60%" >
</p>

### 单行文本编辑器使用示例

[单行文本编辑器使用示例详情](./example/lineEdit)

执行命令：

Linux下：
```shell
./example/lineEdit/run.sh
```

Windows下：
```shell
.\example\lineEdit\run.ps1 
```

执行效果：
<p align="center">
<img src="./doc/assets/lineEdit_demo.png" width="60%" >
</p>

### QFrame使用示例

[QFrame使用示例详情](./example/frame)

执行命令：

Linux下：
```shell
./example/frame/run.sh
```

Windows下：
```shell
.\example\frame\run.ps1 
```

执行效果：
<p align="center">
<img src="./doc/assets/QFrame_demo.png" width="60%" >
</p>

## <img alt="" src="./doc/assets/readme-icon-contribute.png" style="display: inline-block;" width=3%/>参与贡献

主要参与贡献的公司以及个人主页链接

上海双洪信息技术有限公司(http://www.honhand.com)

[@qq_21780589](https://gitcode.com/qq_21780589) [@wathinst-cj](https://gitcode.com/wathinst-cj) [@libor_zhou](https://gitcode.com/libor_zhou)