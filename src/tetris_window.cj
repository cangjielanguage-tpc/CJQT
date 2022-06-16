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

    //var timer: QTimer //计时器
    var tetrisBox: TetrisBox //游戏窗口
    var nextTetrisBox: NextTetrisBox //“下一个”窗口
    var mainLayout: QGridLayout //mainLayout
    var nextTetrisLabel: QLabel //“下一个”窗口的标签
    var controlLabel: QLabel //“控制”标签
    var w_controlLabel: QLabel //W键的标签
    var s_controlLabel: QLabel //S键的标签
    var a_controlLabel: QLabel //A键的标签
    var d_controlLabel: QLabel //D键的标签
    var h_controlLabel: QLabel //H键的标签
    var j_controlLabel: QLabel //J键的标签
    var c_controlLabel: QLabel //C键的标签
    var m_controlLabel: QLabel //M键的标签
    var scoreTitleLabel: QLabel //分数标题标签
    var scoreLabel: QLabel //分数标签（用来显示分数）

    public init() {
        tetrisBox = TetrisBox()
        nextTetrisBox = NextTetrisBox()
        nextTetrisLabel = QLabel()
        nextTetrisLabel.setText("next: ")
        controlLabel = QLabel()
        controlLabel.setText("control: ")
        w_controlLabel = QLabel()
        w_controlLabel.setText("W-rotate")
        s_controlLabel = QLabel()
        s_controlLabel.setText("S-move down")
        a_controlLabel = QLabel()
        a_controlLabel.setText("A-move left")
        d_controlLabel = QLabel()
        d_controlLabel.setText("D-move right")
        h_controlLabel = QLabel()
        h_controlLabel.setText("H-start")
        j_controlLabel = QLabel()
        j_controlLabel.setText("J-stop")
        c_controlLabel = QLabel()
        c_controlLabel.setText("C-restart")
        m_controlLabel = QLabel()
        m_controlLabel.setText("M-end")
        scoreTitleLabel = QLabel()
        scoreTitleLabel.setText("score: ")
        scoreLabel = QLabel()
        scoreLabel.setText("0")
        mainLayout = QGridLayout()

        //设置mainLayout的水平和横向的间隔为20
        mainLayout.setHorizontalSpacing(20)
        mainLayout.setVerticalSpacing(20)

        //设置mainLayout居中
        mainLayout.setAlignment()

        //添加各个widget
        mainLayout.addWidget(tetrisBox, 0, 0, 14, 1)
        mainLayout.addWidget(nextTetrisLabel, 0, 1)
        mainLayout.addWidget(nextTetrisBox, 1, 1, 1, 2)
        mainLayout.addWidget(controlLabel, 5, 1)
        mainLayout.addWidget(w_controlLabel, 6, 1)
        mainLayout.addWidget(s_controlLabel, 6, 2)
        mainLayout.addWidget(a_controlLabel, 7, 1)
        mainLayout.addWidget(d_controlLabel, 7, 2)
        mainLayout.addWidget(h_controlLabel, 8, 1)
        mainLayout.addWidget(j_controlLabel, 8, 2)
        mainLayout.addWidget(c_controlLabel, 9, 1)
        mainLayout.addWidget(m_controlLabel, 9, 2)
        mainLayout.addWidget(scoreTitleLabel, 12, 1)
        mainLayout.addWidget(scoreLabel, 12, 2)

        //因为mainWindow已有一个layout，所以不能直接将mainLayout
        //设置到mainWindow中，需要先将mainLayout设置为一个widget的layout
        //在将widget设置为mainLayout的centralWidget
        let widget = QWidget(this)
        widget.setLayout(mainLayout)
        setCentralWidget(widget)

        tetris.createBlock()
        nextTetrisBox.updateNextTetris(tetris)
    }
}
