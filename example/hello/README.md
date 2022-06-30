### hello示例

创建main.cj文件
```cangjie
from cjqt import qt.widgets.*
from cjqt import qt.gui.*

main() {
    QApplication.create()
    let win = QMainWindow()
    win.setWindowTitle("CJQT Example")
    win.resize(400, 300)

    let label = QLabel(win)
    label.setGeometry(120, 100, 200, 40)
    label.setText("Hello CJQT!")
    label.setFontSize(24)
    label.setFontColor(QColor.Red)

    let button = QPushButton(win)
    button.setGeometry(150, 180, 100, 24)
    button.setText("button")
    button.clicked.connect() {
        println("clicked")
    }

    win.show()

    QApplication.exec()

    win.delete()
    QApplication.delete()
}
```

执行命令如下：

```shell
cd `cjqtPath` # cjqt源码路径
./build.sh

cd `path` # 项目路径
cpm update
cpm build

export LD_LIBRARY_PATH=`cjqtPath`/native/build:${LD_LIBRARY_PATH}  # 添加cjqt native动态库路径

./bin/main
```

执行效果：

<p align="center">
<img src="./../../doc/assets/qt_demo.png" width="60%" >
</p>