import cjqt.core.*

public class TetrisWindow <: QMainWindow {
    //游戏的状态
    let STATUS_ON = 0 //游戏正常进行
    let STATUS_PAUSE = 1 //游戏暂停
    let STATUS_OFF = 2 //游戏未开始
    let STATUS_END = 3 //游戏结束

    var status = 0 //游戏状态
    var tetris = Tetris() //俄罗斯方块类对象

    var timer: QTimer = QTimer() //计时器
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
        nextTetrisLabel = QLabel("下一个: ")
        controlLabel = QLabel("控制: ")
        wControlLabel = QLabel("W-旋转")
        sControlLabel = QLabel("S-下移")
        aControlLabel = QLabel("A-左移")
        dControlLabel = QLabel("D-右移")
        hControlLabel = QLabel("H-开始")
        jControlLabel = QLabel("J-暂停")
        cControlLabel = QLabel("C-重新开始")
        mControlLabel = QLabel("M-结束")
        scoreTitleLabel = QLabel("得分: ")
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

                QMessageBox.information(this, "游戏结束", "游戏结束!\n您的得分为: ${tetris.score}!")
                status = STATUS_END
                setWindowTitle("CJQT 俄罗斯方块 - 结束")
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
        setWindowTitle("CJQT 俄罗斯方块 - 未开始")

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
            case _ => ()
        }
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
                QMessageBox.information(this, "游戏结束", "游戏结束!\n您的得分为: ${tetris.score}!")
                //更改游戏状态为：游戏结束
                status = STATUS_END
                setWindowTitle("CJQT 俄罗斯方块 - 结束")
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
            setWindowTitle("CJQT 俄罗斯方块 - 开始");
        } else if (status == STATUS_OFF) {
            //初始化窗口视图
            tetris.createBlock()
            tetrisBox.updateTetris(tetris)

            nextTetrisBox.updateNextTetris(tetris)
            updateScore()

            status = STATUS_ON
            setWindowTitle("CJQT 俄罗斯方块 - 开始");
            timer.start()
        } else if (status == STATUS_END) {
            //初始化tetris
            tetris.clear()
            tetris.createBlock()
            tetrisBox.updateTetris(tetris)

            nextTetrisBox.updateNextTetris(tetris)
            updateScore()

            status = STATUS_ON
            setWindowTitle("CJQT 俄罗斯方块 - 开始");
            timer.start()
        }
    }

    //J键-游戏暂停
    func stopGame() {
        //需要游戏状态为：正常进行
        if (status == STATUS_ON) {
            timer.stop()
            status = STATUS_PAUSE
            setWindowTitle("CJQT 俄罗斯方块 - 暂停");
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
        setWindowTitle("CJQT 俄罗斯方块 - 未开始");
    }
}
