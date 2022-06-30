### 俄罗斯方块游戏示例

该示例参考了C++版本[Qt实现俄罗斯方块](https://blog.csdn.net/Canglin_1998/article/details/83388446)


创建main.cj文件
```cangjie
import qt.gui.*
import qt.widgets.*
import example.tetris.*

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
<img src="./../../doc/assets/tetris_demo.png" width="60%" >
</p>