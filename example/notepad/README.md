### 记事本示例

该示例参考了C++版本[Qt notepad example](https://doc.qt.io/qt-5/qtwidgets-tutorials-notepad-example.html)

创建main.cj文件
```cangjie
from cjqt import qt.widgets.*
from cjqt import qt.gui.*

main() {
    QApplication.create()

    let win = NotepadWindow()
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
<img src="./../../doc/assets/notepad_demo.png" width="60%" >
</p>