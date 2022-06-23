import qt.gui.*
import qt.code.*
import qt.widgets.*

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

        setKeyPressEvent() {
            event =>
            //W键-进行旋转并更新游戏窗口内容
            if (event.key() == QKeyEvent.KEY_W) {
                if (tetris.rotate()) {
                    //需要游戏状态为：正常进行
                    if (status == STATUS_ON) {
                        tetrisBox.updateTetris(tetris)
                    }
                }
            } else if (event.key() == QKeyEvent.KEY_A) {
                //A键-将方块向左移动并更新游戏窗口内容
                //需要游戏状态为：正常进行
                if (status == STATUS_ON) {
                    if (tetris.moveToLeft()) {
                        tetrisBox.updateTetris(tetris);
                    }
                }
            } else if (event.key() == QKeyEvent.KEY_S) {
                //S键-将方块向下移动并更新游戏窗口内容
                //需要游戏状态：正常进行
                if (status == STATUS_ON) {
                    if (tetris.moveToBottom()) {
                        tetrisBox.updateTetris(tetris)

                        nextTetrisBox.updateNextTetris(tetris)
                        updateScore();
                    } else {
                        //游戏结束
                        
                        //计时器停止
                        timer.stop();

                        //输出结束提示
                        //QMessageBox.information(this, "Game Over", "Game Over!\nYour Score is: ${tetris.score}!")
                        //更改游戏状态为：游戏结束
                        status = STATUS_END
                        setWindowTitle("CJQT Game Tetris - END")
                    }
                }
            } else if (event.key() == QKeyEvent.KEY_D) {
                //D键-将方块向右移动并更新游戏窗口内容
                //需要游戏状态为：正常进行
                if (status == STATUS_ON) {
                    if (tetris.moveToRight()) {
                        tetrisBox.updateTetris(tetris);
                    }
                }
            } else if (event.key() == QKeyEvent.KEY_H) {
                //H键-开始游戏
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
            } else if (event.key() == QKeyEvent.KEY_J) {
                //J键-游戏暂停
                //需要游戏状态为：正常进行
                if (status == STATUS_ON) {
                    timer.stop()
                    status = STATUS_PAUSE
                    setWindowTitle("CJQT Game Tetris - PAUSE");
                }
            } else if (event.key() == QKeyEvent.KEY_C) {
                //C键-重新开始游戏
                timer.stop()
                tetris.clear()
                tetrisBox.updateTetris(tetris)

                nextTetrisBox.updateNextTetris(tetris)
                updateScore()
                status = STATUS_OFF
                setWindowTitle("CJQT Game Tetris - OFF");
            } else if (event.key() == QKeyEvent.KEY_M) {
                //M键-关闭游戏
                close()
            }
        }
    }

    func updateScore() {
        scoreLabel.setText("${tetris.score}")
    }
}
