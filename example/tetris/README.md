### 俄罗斯方块游戏示例

该示例参考了C++版本[Qt实现俄罗斯方块](https://blog.csdn.net/Canglin_1998/article/details/83388446)

创建tetris.cj文件
```cangjie
from std import random.*
from std import math.*
from std import collection.*

public class Tetris {
    static let MAX_X = 10 //显示窗口的横向格数
    static let MAX_Y = 20 //显示窗口的竖向格数
    static let NEXT_MAX_X = 6 //“下一个”显示窗口的横向格数
    static let NEXT_MAX_Y = 6 //“下一个”显示窗口的竖向格数
    static let WIDTH = 30 //单格的宽度
    static let HEIGHT = 30 //单格的高度
    static let INTERVAL = 2 //单格之间的间隔
    static let COUNT = 4 //每个方块的格数

    var score: Int64 = 0 //分数
    var block = Block() //当前方块
    var nextBlock = Block() //下一个方块

    //方格的坐标系 1表示右方格，0表示没有方格
    var box: ArrayList<ArrayList<BoxItem>> = ArrayList()

    let random = Random()

    public init() {
        for (i in 0..MAX_X) {
            let arr: ArrayList<BoxItem> = ArrayList()
            for (j in 0..MAX_Y) {
                arr.append(BoxItem())
            }
            box.append(arr)
        }
        createNextBlock()
    }

    //创建当前方块
    //将上一次生成的下一个方块nextBlock复制给block
    //并创建下一个nextBlock
    public func createBlock() {
        //nextBlock复制给block
        for (i in 0..COUNT) {
            block.x[i] = nextBlock.x[i]
            block.y[i] = nextBlock.y[i]
        }
        block.centerX = nextBlock.centerX
        block.centerY = nextBlock.centerY
        block.id = nextBlock.id
        block.color = nextBlock.color

        //创建下一个nextblock
        createNextBlock()
    }

    //返回坐标（x，y）的值，以判断是否右方格
    public func getBox(x: Int64, y: Int64) {
        return box[x][y]
    }

    //旋转当前方块
    //旋转成功返回true，否则返回false
    public func rotate(): Bool {
        return isRotatable()
    }

    //将当前方块向左移动一格
    //成功返回true，否则返回false
    public func moveToLeft(): Bool {
        return move(-1, 0)
    }

    //将当前方块向右移动一格
    //成功返回true，否则返回false
    public func moveToRight(): Bool {
        return move(1, 0)
    }

    //将方块向下移动一格
    //成功返回true， 游戏结束返回false
    public func moveToBottom(): Bool {
        if (!move(0, 1)) {
            //移动不成功
            blockToBox() //将当前方块复制到box中
            killLines() //消行

            //判断是否结束
            //否则创建新的方块
            if (isEnd()) {
                return false
            } else {
                createBlock()
            }
        }
        return true
    }

    //判断游戏是否结束
    //结束条件为第一行有方格
    public func isEnd(): Bool {
        let j = 0
        for (i in 0..MAX_X) {
            if (box[i][j].show) {
                return true
            }
        }
        return false
    }

    //消掉整行并进行分数奖励
    public func killLines() {
        var count = 0 //一次消掉的行数

        //通过getFirstFullLine()函数获得从上到下第一个整行
        //并将其上的行向下平移一行，达到消行的效果
        var temp = getFirstFullLine()
        while (temp != -1) {
            for (j in temp..0 : -1) {
                for (i in 0..MAX_X) {
                    box[i][j] = box[i][j - 1]
                }
            }
            count++
            temp = getFirstFullLine()
        }

        //消行的分数奖励
        score += count * count * 10
    }

    //对成员变量进行初始化，重新开始游戏
    public func clear() {
        //初始化
        score = 0

        for (i in 0..MAX_X) {
            for (j in 0..MAX_Y) {
                box[i][j].show = false
            }
        }
        for (i in 0..COUNT) {
            block.x[i] = -1
            block.y[i] = -1
        }
        block.centerX = -1
        block.centerY = -1
        block.id = 0

        //创建下一个方块
        createNextBlock()
    }

    //获得游戏窗口的宽度
    static public func getWidth(): Int64 {
        return MAX_X * WIDTH + (MAX_X - 1) * INTERVAL
    }

    //获得游戏窗口的高度
    static public func getHeight(): Int64 {
        return MAX_Y * HEIGHT + (MAX_Y - 1) * INTERVAL
    }

    //获得“下一个”窗口的宽度
    static public func getNextWidth(): Int64 {
        return NEXT_MAX_X * WIDTH + (NEXT_MAX_X - 1) * INTERVAL
    }

    //获得“下一个”窗口的高度
    static public func getNextHeight(): Int64 {
        return NEXT_MAX_Y * WIDTH + (NEXT_MAX_Y - 1) * INTERVAL
    }

    //创建“下一个”方块
    private func createNextBlock() {
        var centerX = (MAX_X - 1) / 2 //中心x坐标
        var id = abs(random.nextInt64() % 7) //获得0 - 6的随机数

        //根据不同的随机数创建方块
        match (id) {
            case 0 =>
                //##
                //##
                nextBlock.x = [centerX, centerX, centerX + 1, centerX + 1]
                nextBlock.y = [-2, -1, -2, -1]
                nextBlock.centerX = 0
                nextBlock.centerY = 0
                nextBlock.id = 0
                nextBlock.color = QColor.Cyan
            case 1 =>
                //####
                //
                nextBlock.x = [centerX - 1, centerX, centerX + 1, centerX + 2]
                nextBlock.y = [-1, -1, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -1
                nextBlock.id = 1
                nextBlock.color = QColor.Blue
            case 2 =>
                //##
                // ##
                nextBlock.x = [centerX - 1, centerX, centerX, centerX + 1]
                nextBlock.y = [-2, -2, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -2
                nextBlock.id = 2
                nextBlock.color = QColor(255, 165, 0, 255)
            case 3 =>
                // ##
                //##
                nextBlock.x = [centerX, centerX + 1, centerX - 1, centerX]
                nextBlock.y = [-2, -2, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -2
                nextBlock.id = 3
                nextBlock.color = QColor.Magenta
            case 4 =>
                //#
                //###
                nextBlock.x = [centerX - 1, centerX - 1, centerX, centerX + 1]
                nextBlock.y = [-2, -1, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -1
                nextBlock.id = 4
                nextBlock.color = QColor.Green
            case 5 =>
                //  #
                //###
                nextBlock.x = [centerX + 1, centerX - 1, centerX, centerX + 1]
                nextBlock.y = [-2, -1, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -1
                nextBlock.id = 5
                nextBlock.color = QColor(139, 0, 139, 255)
            case 6 =>
                // #
                //###
                nextBlock.x = [centerX, centerX - 1, centerX, centerX + 1]
                nextBlock.y = [-2, -1, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -1
                nextBlock.id = 6
                nextBlock.color = QColor.Red
            case _ => ()
        }
    }

    //可以移动就对block进行变换，返回true
    //否则返回false
    private func move(dx: Int64, dy: Int64): Bool {
        var newX = Array<Int64>(COUNT, item: 0)
        var newY = Array<Int64>(COUNT, item: 0)
        var newCenterX = 0
        var newCenterY = 0
        for (i in 0..COUNT) {
            newX[i] = block.x[i] + dx
            newY[i] = block.y[i] + dy

            //对变换后的坐标进行判定
            
            //x坐标超出范围返回false
            if (newX[i] < 0 || newX[i] >= MAX_X) {
                return false
            }

            //y坐标在0 - MAXY之间就对box中的状态进行判定
            //box中为1则返回false
            if (newY[i] >= 0 && newY[i] < MAX_Y) {
                if (box[newX[i]][newY[i]].show) {
                    return false
                }
            } else if (newY[i] >= MAX_Y) {
                //y坐标超出最大值返回false
                return false
            }
        }

        newCenterX = block.centerX + dx
        newCenterY = block.centerY + dy

        //满足条件就将新的x和y坐标赋值给block
        for (i in 0..COUNT) {
            block.x[i] = newX[i]
            block.y[i] = newY[i]
        }
        block.centerX = newCenterX
        block.centerY = newCenterY

        return true
    }

    //可以旋转就对block进行变换，返回true
    //否则返回false
    private func isRotatable(): Bool {
        var newX = Array<Int64>(COUNT, item: 0)
        var newY = Array<Int64>(COUNT, item: 0)
        var newCenterX = 0
        var newCenterY = 0

        if (block.id == 0) {
            return false
        }

        for (i in 0..COUNT) {
            let nx = block.x[i] - block.centerX
            let ny = block.y[i] - block.centerY
            newX[i] = nx * 0 + ny * (-1) + block.centerX
            newY[i] = nx * 1 + ny * 0 + block.centerY

            //对变换后的坐标进行判定
            
            //x坐标超出范围返回false
            if (newX[i] < 0 || newX[i] >= MAX_X) {
                return false
            }

            //y坐标在0 - MAXY 之间就对box中的状态进行判定
            //box中为1则返回false
            if (newY[i] >= 0 && newY[i] < MAX_Y) {
                if (box[newX[i]][newY[i]].show) {
                    return false
                }
            } else if (newY[i] >= MAX_Y) {
                //y坐标超过最大值返回false
                return false
            }
        }
        newCenterX = block.centerX
        newCenterY = block.centerY

        //满足条件后进行block的赋值
        for (i in 0..COUNT) {
            block.x[i] = newX[i]
            block.y[i] = newY[i]
        }
        block.centerX = newCenterX
        block.centerY = newCenterY

        return true
    }

    //将block中数据复制到box中
    private func blockToBox() {
        for (i in 0..COUNT) {
            let x = block.x[i]
            let y = block.y[i]
            if (y >= 0) {
                box[x][y].show = true
                box[x][y].color = block.color
            }
        }
    }

    //获得第一个整行的行数，并返回
    private func getFirstFullLine(): Int64 {
        //这里j从1开始就好
        for (j in 0..MAX_Y) {
            var judgement = true
            for (i in 0..MAX_X) {
                if (!box[i][j].show) {
                    judgement = false
                    break
                }
            }
            if (judgement) {
                return j
            }
        }
        return -1
    }
}

public struct Block {
    public var x = Array<Int64>(Tetris.COUNT, item: -1) //方块单格的x坐标
    public var y = Array<Int64>(Tetris.COUNT, item: -1) //方块单格的y坐标
    public var centerX: Int64 = -1 //方块的中心x坐标
    public var centerY: Int64 = -1 //方块的中心y坐标
    public var id: Int64 = 0 //方块的ID
    public var color = QColor.Black //方块的颜色
}

public class BoxItem {
    public var show = false //是否显示方块
    public var color = QColor.Black //方块的颜色
}

```

创建tetris_box.cj文件
```cangjie
from cjqt import qt.gui.*
from cjqt import qt.widgets.*

public class TetrisBox <: QWidget {
    var block = Block() //用来储存Tetris中block的数据

    //用来存储Tetris中box的数据
    var box: ArrayList<ArrayList<BoxItem>> = ArrayList()

    public init() {
        for (i in 0..Tetris.MAX_X) {
            let arr: ArrayList<BoxItem> = ArrayList()
            for (j in 0..Tetris.MAX_Y) {
                arr.append(BoxItem())
            }
            box.append(arr)
        }

        let w = Tetris.getWidth()
        let h = Tetris.getHeight()
        setFixedSize(w, h)

        //setPalette(QPalette(QColor.LightGray))
        //setAutoFillBackground(true)

        setPaintEvent() {
            event =>
            let painter = QPainter(this)

            painter.setPen(QPen(QColor.Black, 1))
            painter.setBrush(QBrush(QColor.LightGray))

            painter.drawRect(0, 0, Tetris.getWidth() - 2, Tetris.getHeight() - 2)

            painter.setPen(QPen(QColor.White, 0))
            painter.setBrush(QBrush(QColor.White))

            for (i in 0..Tetris.MAX_Y) {
                let y = (i + 1) * (Tetris.WIDTH + Tetris.INTERVAL) - Tetris.INTERVAL
                painter.drawRect(1, y + (Tetris.INTERVAL / 2), Tetris.getWidth() - 4, 0)
            }
            for (i in 0..Tetris.MAX_X) {
                let x = (i + 1) * (Tetris.WIDTH + Tetris.INTERVAL) - Tetris.INTERVAL
                painter.drawRect(x + (Tetris.INTERVAL / 2), 1, 0, Tetris.getHeight() - 4)
            }

            for (i in 0..Tetris.MAX_X) {
                for (j in 0..Tetris.MAX_Y) {
                    if (box[i][j].show) {
                        painter.setPen(QPen(QColor.Gray, 1))
                        painter.setBrush(QBrush(box[i][j].color))
                        let x = i * Tetris.WIDTH + i * Tetris.INTERVAL
                        let y = j * Tetris.HEIGHT + j * Tetris.INTERVAL
                        painter.drawRect(x, y, Tetris.WIDTH, Tetris.HEIGHT)
                    }
                }
            }

            painter.setPen(QPen(QColor.Gray, 1))
            painter.setBrush(QBrush(block.color))

            for (i in 0..Tetris.COUNT) {
                let x = block.x[i]
                let y = block.y[i]
                let x1 = x * Tetris.WIDTH + x * Tetris.INTERVAL
                let y1 = y * Tetris.HEIGHT + y * Tetris.INTERVAL
                painter.drawRect(x1, y1, Tetris.WIDTH, Tetris.HEIGHT)
            }

            painter.delete()
        }
    }

    public func updateTetris(tetris: Tetris) {
        //更新block
        block = tetris.block

        //更新box
        for (i in 0..Tetris.MAX_X) {
            for (j in 0..Tetris.MAX_Y) {
                box[i][j] = tetris.getBox(i, j)
            }
        }
        repaint()
    }
}

```

创建next_tetris_box.cj文件
```cangjie
from cjqt import qt.gui.*
from cjqt import qt.widgets.*

public class NextTetrisBox <: QWidget {
    let RESTX = (Tetris.MAX_X - Tetris.NEXT_MAX_X) / 2 //方块x坐标的转换常数
    let RESTY = 4 //方块y坐标的转换常数

    var nextBlock = Block() //“下一个”方块

    public init() {
        let w = Tetris.getNextWidth()
        let h = Tetris.getNextHeight()
        setFixedSize(w, h)

        //setPalette(QPalette(QColor.LightGray))
        //setAutoFillBackground(true)

        setPaintEvent() {
            event =>
            let painter = QPainter(this)

            painter.setPen(QPen(QColor.Black, 1))
            painter.setBrush(QBrush(QColor.LightGray))

            painter.drawRect(0, 0, Tetris.getNextWidth() - 2, Tetris.getNextHeight() - 2)

            painter.setPen(QPen(QColor.White, 0))
            painter.setBrush(QBrush(QColor.White))

            for (i in 0..Tetris.NEXT_MAX_Y) {
                let y = (i + 1) * (Tetris.WIDTH + Tetris.INTERVAL) - Tetris.INTERVAL
                painter.drawRect(1, y + (Tetris.INTERVAL / 2), Tetris.getNextWidth() - 4, 0)
            }
            for (i in 0..Tetris.NEXT_MAX_X) {
                let x = (i + 1) * (Tetris.WIDTH + Tetris.INTERVAL) - Tetris.INTERVAL
                painter.drawRect(x + (Tetris.INTERVAL / 2), 1, 0, Tetris.getNextHeight() - 4)
            }

            painter.setPen(QPen(QColor.Gray, 1))
            painter.setBrush(QBrush(nextBlock.color))

            for (i in 0..Tetris.COUNT) {
                let x = nextBlock.x[i]
                let y = nextBlock.y[i]
                if (x >= 0 && x < Tetris.NEXT_MAX_X && y >= 0 && y < Tetris.NEXT_MAX_Y) {
                    let x1 = x * Tetris.WIDTH + x * Tetris.INTERVAL
                    let y1 = y * Tetris.HEIGHT + y * Tetris.INTERVAL
                    painter.drawRect(x1, y1, Tetris.WIDTH, Tetris.HEIGHT)
                }
            }
            painter.delete()
        }
    }

    public func updateNextTetris(tetris: Tetris) {
        nextBlock.color = tetris.nextBlock.color
        for (i in 0..Tetris.COUNT) {
            nextBlock.x[i] = tetris.nextBlock.x[i] - RESTX
            nextBlock.y[i] = tetris.nextBlock.y[i] + RESTY
        }

        //重新绘制
        repaint()
    }
}

```

创建tetris_window.cj文件
```cangjie
from cjqt import qt.gui.*
from cjqt import qt.code.*
from cjqt import qt.widgets.*

public class TetrisWindow <: QMainWindow {
    //游戏的状态
    let STATUS_ON = 0 //游戏正常进行
    let STATUS_PAUSE = 1 //游戏暂停
    let STATUS_OFF = 2 //游戏未开始
    let STATUS_END = 3 //游戏结束

    var status = 0 //游戏状态
    var tetris = Tetris() //俄罗斯方块类对象

    var timer: QTimer //计时器
    var tetrisBox: TetrisBox //游戏窗口

    var nextTetrisBox: NextTetrisBox //“下一个”窗口
    var mainLayout: QGridLayout //mainLayout
    var nextTetrisLabel: QLabel //“下一个”窗口的标签
    var controlLabel: QLabel //“控制”标签
    var wControlLabel: QLabel //W键的标签
    var sControlLabel: QLabel //S键的标签
    var aControlLabel: QLabel //A键的标签
    var dControlLabel: QLabel //D键的标签
    var hControlLabel: QLabel //H键的标签
    var jControlLabel: QLabel //J键的标签
    var cControlLabel: QLabel //C键的标签
    var mControlLabel: QLabel //M键的标签
    var scoreTitleLabel: QLabel //分数标题标签
    var scoreLabel: QLabel //分数标签（用来显示分数）

    public init() {
        tetrisBox = TetrisBox()

        nextTetrisBox = NextTetrisBox()
        nextTetrisLabel = QLabel("next: ")
        controlLabel = QLabel("control: ")
        wControlLabel = QLabel("W-rotate")
        sControlLabel = QLabel("S-move down")
        aControlLabel = QLabel("A-move left")
        dControlLabel = QLabel("D-move right")
        hControlLabel = QLabel("H-start")
        jControlLabel = QLabel("J-stop")
        cControlLabel = QLabel("C-restart")
        mControlLabel = QLabel("M-end")
        scoreTitleLabel = QLabel("score: ")
        scoreLabel = QLabel("0")
        mainLayout = QGridLayout()

        //设置mainLayout的水平和横向的间隔为20
        mainLayout.setHorizontalSpacing(20)
        mainLayout.setVerticalSpacing(20)

        //设置mainLayout居中
        mainLayout.setAlignment()

        // 添加各个widget
        mainLayout.addWidget(tetrisBox, 0, 0, 14, 1)
        mainLayout.addWidget(nextTetrisLabel, 0, 1)

        mainLayout.addWidget(nextTetrisBox, 1, 1, 1, 2)
        mainLayout.addWidget(controlLabel, 5, 1)
        mainLayout.addWidget(wControlLabel, 6, 1)
        mainLayout.addWidget(sControlLabel, 6, 2)
        mainLayout.addWidget(aControlLabel, 7, 1)
        mainLayout.addWidget(dControlLabel, 7, 2)
        mainLayout.addWidget(hControlLabel, 8, 1)
        mainLayout.addWidget(jControlLabel, 8, 2)
        mainLayout.addWidget(cControlLabel, 9, 1)
        mainLayout.addWidget(mControlLabel, 9, 2)
        mainLayout.addWidget(scoreTitleLabel, 12, 1)
        mainLayout.addWidget(scoreLabel, 12, 2)

        timer = QTimer(500) {
            if (tetris.moveToBottom()) {
                tetrisBox.updateTetris(tetris)
                nextTetrisBox.updateNextTetris(tetris)
                updateScore()
            } else {
                timer.stop()

                //QMessageBox.information(this, "Game Over", "Game Over!\nYour Score is: ${tetris.score}!")
                status = STATUS_END
                setWindowTitle("CJQT Game Tetris - END")
            }
        }

        //因为mainWindow已有一个layout，所以不能直接将mainLayout
        //设置到mainWindow中，需要先将mainLayout设置为一个widget的layout
        //在将widget设置为mainLayout的centralWidget
        let widget = QWidget(this)
        widget.setLayout(mainLayout)
        setCentralWidget(widget)

        //初始化
        status = STATUS_OFF

        nextTetrisBox.updateNextTetris(tetris)
        setWindowTitle("CJQT Game Tetris - OFF")

        setKeyPressEvent(handleEvent)
    }

    func updateScore() {
        scoreLabel.setText("${tetris.score}")
    }

    func handleEvent(event: QKeyEvent) {
        match {
            case event.key() == QKeyEvent.KEY_W => rotateTetris()
            case event.key() == QKeyEvent.KEY_A => moveLeft()
            case event.key() == QKeyEvent.KEY_S => moveDown()
            case event.key() == QKeyEvent.KEY_D => moveRight()
            case event.key() == QKeyEvent.KEY_H => startGame()
            case event.key() == QKeyEvent.KEY_J => stopGame()
            case event.key() == QKeyEvent.KEY_C => restartGame()
            case event.key() == QKeyEvent.KEY_M => close()
        }
        //case _ => {}
    }

    //W键-旋转方块
    func rotateTetris() {
        //需要游戏状态为：正常进行
        if (status == STATUS_ON) {
            if (tetris.rotate()) {
                tetrisBox.updateTetris(tetris)
            }
        }
    }

    //A键-向左移动方块
    func moveLeft() {
        //需要游戏状态为：正常进行
        if (status == STATUS_ON) {
            if (tetris.moveToLeft()) {
                tetrisBox.updateTetris(tetris);
            }
        }
    }

    //S键-向下移动方块
    func moveDown() {
        //需要游戏状态：正常进行
        if (status == STATUS_ON) {
            if (tetris.moveToBottom()) {
                tetrisBox.updateTetris(tetris)

                nextTetrisBox.updateNextTetris(tetris)
                updateScore();
            } else {
                //游戏结束
                
                //计时器停止
                timer.stop()

                //输出结束提示
                //QMessageBox.information(this, "Game Over", "Game Over!\nYour Score is: ${tetris.score}!")
                //更改游戏状态为：游戏结束
                status = STATUS_END
                setWindowTitle("CJQT Game Tetris - END")
            }
        }
    }

    //D键-向右移动方块
    func moveRight() {
        //需要游戏状态为：正常进行
        if (status == STATUS_ON) {
            if (tetris.moveToRight()) {
                tetrisBox.updateTetris(tetris)
            }
        }
    }

    //H键-开始游戏
    func startGame() {
        //不同状态的相应：
        //之前状态    之后状态
        //游戏暂停 -> 正常进行
        //还未开始 -> 正常进行
        //游戏结束 -> 正常进行
        if (status == STATUS_PAUSE) {
            timer.start()
            status = STATUS_ON
            setWindowTitle("CJQT Game Tetris - ON");
        } else if (status == STATUS_OFF) {
            //初始化窗口视图
            tetris.createBlock()
            tetrisBox.updateTetris(tetris)

            nextTetrisBox.updateNextTetris(tetris)
            updateScore()

            status = STATUS_ON
            setWindowTitle("CJQT Game Tetris - ON");
            timer.start()
        } else if (status == STATUS_END) {
            //初始化tetris
            tetris.clear()
            tetris.createBlock()
            tetrisBox.updateTetris(tetris)

            nextTetrisBox.updateNextTetris(tetris)
            updateScore()

            status = STATUS_ON
            setWindowTitle("CJQT Game Tetris - ON");
            timer.start()
        }
    }

    //J键-游戏暂停
    func stopGame() {
        //需要游戏状态为：正常进行
        if (status == STATUS_ON) {
            timer.stop()
            status = STATUS_PAUSE
            setWindowTitle("CJQT Game Tetris - PAUSE");
        }
    }

    // C键-重新开始游戏
    func restartGame() {
        timer.stop()
        tetris.clear()
        tetrisBox.updateTetris(tetris)

        nextTetrisBox.updateNextTetris(tetris)
        updateScore()
        status = STATUS_OFF
        setWindowTitle("CJQT Game Tetris - OFF");
    }
}

```


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
<img src="./../../doc/assets/tetris_demo.png" width="60%" >
</p>