<p align="center">
<img src="./doc/assets/logo.png" width="30%" >
</p>

<p align="center">
<img alt="" src="https://badg.now.sh/badge/release/v0.0.1?color=green" style="display: inline-block;" />
<img alt="" src="https://badg.now.sh/badge/build/pass?color=green" style="display: inline-block;" />
<img alt="" src="https://badg.now.sh/badge/cjc/v0.28.4?color=green" style="display: inline-block;" />
<img alt="" src="https://badg.now.sh/badge/cjcov/90%25?color=green" style="display: inline-block;" />
<img alt="" src="https://badg.now.sh/badge/project/open?color=green" style="display: inline-block;" />
</p>



## <img alt="" src="./doc/assets/readme-icon-introduction.png" style="display: inline-block;" width=3%/>介绍

Qt是一个跨平台的C++图形开发框架，是目前主流的跨平台GUI库之一。

CjQt是Qt的仓颉语言绑定，提供仓颉语言风格的Qt类和函数的API封装。

项目基于QT5.14.2版本构建，在wsl2+Ubuntu20.04上测试

### 路线

- 近期目标：实现Demo运行，实现俄罗斯方块游戏
- 中期目标：常用QT类封装
- 长期目标：完成QT类封装，结合领域eDSL实现声明式UI框架

<p align="center">
<img src="./doc/assets/milestone.png" width="100%" >
</p>

### 当前进度

- [QWidgets封装进度](./doc/qt_widgets.md)
- [QCode封装进度](./doc/qt_code.md)
- [QGui封装进度](./doc/qt_gui.md)


##    <img alt="" src="./doc/assets/readme-icon-framework.png" style="display: inline-block;" width=3%/> 软件架构

### 架构图

<p align="center">
<img src="./doc/assets/framework.png" width="60%" >
</p>

### 源码目录

```shell
.
├── README.md
├── doc
│   ├── assets     
│   ├── design.md  
│   ├── proposal.md
│   └── xxx_lib.md 
├── native
│   ├── src
│   │   ├── code
│   │   ├── gui
│   │   └── widgets
│   └── CMakeLists.txt
├── src
│   ├── qt
│   │   ├── code
│   │   ├── gui
│   │   └── widgets
│   └── main.cj
└── test   
    ├── HLT
    ├── LLT
    └── UT
```

- `doc`是库的设计文档、提案、库的使用文档
- `native`是C语言绑定QT库源码目录
- `src`是库源码目录
- `test`是存放测试用例，包括HLT用例、LLT 用例和UT用例

## <img alt="" src="./doc/assets/readme-icon-compile.png" style="display: inline-block;" width=3%/>编译执行

### 编译

下载QT文件[qt-opensource-linux-x64-5.14.2.run](https://download.qt.io/archive/qt/5.14/5.14.2/)到安装目录


安装QT
```shell
chmod +x qt-opensource-linux-x64-5.14.2.run
./qt-opensource-linux-x64-5.14.2.run
```

配置环境变量
```shell
vim ~/.bashrc
export QT_HOME=/home/wathinst/Qt5.14.2/5.14.2/gcc_64(自己的安装目录)
source ~/.bashrc
```

编译项目源码

```shell
./native.make.sh
cpm update
cpm build
```

### Qt5示例

创建main.cj文件
```cangjie
import qt.gui.*
import qt.widgets.*

main() {
    QApplication.create()
    let win = QWidget()
    win.setWindowTitle("CJQT Example")
    win.resize(400, 300)

    let label = QLabel(win)
    label.setGeometry(150, 150, 100, 24)
    label.setText("Hello CJQT!")

    win.show()

    QApplication.exec()

    win.delete()
    QApplication.delete()
}
```

执行命令如下：

```shell
./run.sh
```

执行效果：

<p align="center">
<img src="./doc/assets/qt_demo.png" width="60%" >
</p>

### QML示例

创建hello.qml文件

```qml
import QtQuick 2.2
import QtQuick.Controls 1.4

ApplicationWindow {
    id: app
    title: "CJQT QRC Example"
    width: 600; height: 400
    color: "lightgray"
    Component.onCompleted: visible = true

    Text {
        text: "Hello CJQT!\nbinding by cangjie"
        y: 30
        anchors.horizontalCenter: app.contentItem.horizontalCenter
        font.pointSize: 24; font.bold: true
    }
}
```
创建main.cj文件
```cangjie
import qt.gui.*
import qt.widgets.*

main() {
    QApplication.create()
    let engine = QQmlApplicationAngine()
    engine.loadUrl("./src/hello.qml")

    QApplication.exec()

    engine.delete()
    QApplication.delete()
}
```

执行命令如下：

```shell
./run.sh
```

执行效果：

<p align="center">
<img src="./doc/assets/qml_demo.png" width="60%" >
</p>


### 俄罗斯方块游戏示例


创建main.cj文件
```cangjie
import qt.gui.*
import qt.widgets.*

main() {
    QApplication.create()

    let box = TetrisWindow()
    box.show()

    QApplication.exec()

    box.delete()

    QApplication.delete()
}
```

执行命令如下：

```shell
./run.sh
```

执行效果：

<p align="center">
<img src="./doc/assets/tetris_demo.png" width="60%" >
</p>

## <img alt="" src="./doc/assets/readme-icon-contribute.png" style="display: inline-block;" width=3%/>参与贡献

主要写参与贡献的人以及个人主页链接

[@chinesebear](https://gitee.com/chinesebear) [@wathinst](https://gitee.com/wathinst)
