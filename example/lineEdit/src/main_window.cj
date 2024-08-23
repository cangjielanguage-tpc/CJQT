package lineEdit
import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*

public class maniWindow <: QMainWindow {
    let mainLayout: QGridLayout
    let label1: QLabel
    let lineEdit1: QLineEdit
    let label2: QLabel
    let note2: QLabel
    let leadingAction: QAction
    let trailingAction: QAction
    let lineEdit2: QLineEdit
    let label3: QLabel
    let lineEdit3: QLineEdit
    let label4: QLabel
    let lineEdit4: QLineEdit
    let lineEdit5: QLineEdit
    let lineEdit6: QLineEdit
    let lineEdit7: QLineEdit
    let lineEdit8: QLineEdit
    let lineEdit10: QLineEdit
    let note10: QLabel
    let label11: QLabel
    let lineEdit11: QLineEdit
    let note11: QLabel
    public init() {
        setFixedSize(600, 800)
        setWindowTitle("单行文本编辑器")
        mainLayout = QGridLayout()

        //设置mainLayout的水平和横向的间隔为20
        mainLayout.setHorizontalSpacing(10)
        mainLayout.setVerticalSpacing(10)

        //设置mainLayout居中
        mainLayout.setAlignment()

        label1 = QLabel("默认的文本编辑框")
        lineEdit1 = QLineEdit()

        //设置占位符
        lineEdit1.setPlaceholderText("请输入文本")
        mainLayout.addWidget(label1, 0, 0, 1, 80)
        mainLayout.addWidget(lineEdit1, 1, 0, 1, 80)

        label2 = QLabel("自定义搜索框")
        note2 = QLabel()
        lineEdit2 = QLineEdit()
        lineEdit2.setPlaceholderText("请输入文本")

        //Action
        leadingAction = QAction()
        leadingAction.setIcon(QIcon("./images/computer.png"))
        leadingAction.setCheckable(false)
        trailingAction = QAction()
        trailingAction.setIcon(QIcon("./images/search.png"))
        trailingAction.setCheckable(true)
        lineEdit2.addAction(leadingAction, ActionPosition.LeadingPosition)
        lineEdit2.addAction(trailingAction, ActionPosition.TrailingPosition)

        mainLayout.addWidget(label2, 3, 0, 1, 80)
        mainLayout.addWidget(lineEdit2, 4, 0, 1, 80)
        mainLayout.addWidget(note2, 5, 0, 1, 80)

        label3 = QLabel("密码输入框")
        lineEdit3 = QLineEdit()
        lineEdit3.setPlaceholderText("Password")
        lineEdit3.setEchMod(EchoMode.Password)
        mainLayout.addWidget(label3, 6, 0, 1, 80)
        mainLayout.addWidget(lineEdit3, 7, 0, 1, 80)

        label4 = QLabel("只读文本框")
        lineEdit4 = QLineEdit("信息只读")
        lineEdit4.setReadOnly(true)
        mainLayout.addWidget(label4, 8, 0, 1, 80)
        mainLayout.addWidget(lineEdit4, 9, 0, 1, 80)

        lineEdit5 = QLineEdit()
        let label5 = QLabel("输入IP地址:127.0.0.1")
        lineEdit5.setInputMask("000.000.000.000;_")
        lineEdit6 = QLineEdit()
        let label6 = QLabel("输入MAC地址:E5:AC:R5:Y9:23")
        lineEdit6.setInputMask("HH:HH:HH:HH:HH:HH;_")
        lineEdit7 = QLineEdit()
        let label7 = QLabel("输入日期:2022-02-21")
        lineEdit7.setInputMask("9999-99-99;_")
        lineEdit8 = QLineEdit()
        let label8 = QLabel("输入密钥")
        lineEdit8.setInputMask(">AAAAA-AAAAA-AAAAA-AAAAA-AAAAA;#")
        lineEdit8.setFrame(true)
        let label9 = QLabel("无边框的文本输入框")
        let lineEdit9 = QLineEdit()
        lineEdit9.setFrame(false)
        let label10 = QLabel("设置文本框字符长度")
        lineEdit10 = QLineEdit()
        lineEdit10.setMaxLengt(10)
        lineEdit10.setAlignmen(Alignment.AlignCenter)
        note10 = QLabel()
        mainLayout.addWidget(label5, 10, 0, 1, 80)
        mainLayout.addWidget(lineEdit5, 11, 0, 1, 80)
        mainLayout.addWidget(label6, 12, 0, 1, 80)
        mainLayout.addWidget(lineEdit6, 13, 0, 1, 80)
        mainLayout.addWidget(label7, 14, 0, 1, 80)
        mainLayout.addWidget(lineEdit7, 15, 0, 1, 80)
        mainLayout.addWidget(label8, 16, 0, 1, 80)
        mainLayout.addWidget(lineEdit8, 17, 0, 1, 80)
        mainLayout.addWidget(label9, 18, 0, 1, 80)
        mainLayout.addWidget(lineEdit9, 19, 0, 1, 80)
        mainLayout.addWidget(label10, 20, 0, 1, 80)
        mainLayout.addWidget(lineEdit10, 21, 0, 1, 80)
        mainLayout.addWidget(note10, 22, 0, 1, 80)

        label11 = QLabel("双精度浮点型文本框")
        lineEdit11 = QLineEdit()
        lineEdit11.setPlaceholderText("浮点型")
        lineEdit11.setMaxLengt(10)
        note11 = QLabel()
        mainLayout.addWidget(label11, 23, 0, 1, 80)
        mainLayout.addWidget(lineEdit11, 24, 0, 1, 80)
        mainLayout.addWidget(note11, 25, 0, 1, 80)
        let dwValidator: QDoubleValidator = QDoubleValidator()

        //范围为-100～100区间范围
        dwValidator.setRange(0.0, 100.0, 2);

        //设在为标准数字（0.005）
        dwValidator.setNotation(QDoubleValidatorNotation.StandardNotation)

        //精度为2
        dwValidator.setDecimals(2)
        lineEdit11.setValidator(dwValidator)

        //Signal
        trailingAction.triggered.connect(onSearch)

        //lineEdit10.inputRejected.connect(onInputRejected)
        //lineEdit10.returnPressed.connect(onReturnPressed)
        //lineEdit10.selectionChanged.connect(onSelectionChanged)
        lineEdit10.textChanged.connect(onTextChanged)
        dwValidator.bottomChanged.connect(onBottomChanged)
        dwValidator.topChanged.connect(onTopChanged)
        dwValidator.decimalsChanged.connect(onDecimalsChanged)
        lineEdit11.inputRejected.connect(onInputRejected)
        lineEdit11.returnPressed.connect(onReturnPressed)
        lineEdit11.selectionChanged.connect(onSelectionChanged)
        //lineEdit11.textChanged.connect(onTextChanged)

        let widget = QWidget(this)
        widget.setLayout(mainLayout)
        setCentralWidget(widget)
    }
    public func onSearch(checked: Bool): Unit {
        if (checked) {
            var strText: String = lineEdit2.text()
            if (strText == "") {
                strText = "空"
            }
            note2.setText("输入文本框内容为：${strText}")
        }
    }

    public func onInputRejected(d: Unit): Unit {
        let length = this.lineEdit11.maxLength()
        this.note10.setText("文本框字符长度不超过${length}")
    }
    public func onReturnPressed(d: Unit): Unit {
        let str = this.lineEdit11.text()
        this.note10.setText("输入的内容为：${str}")
    }

    public func onSelectionChanged(d: Unit): Unit {
        if (lineEdit11.hasSelectedText()) {
            let str = this.lineEdit11.selectedText()
            this.note10.setText("选中的内容为：${str}")
        }
    }

    public func onTextChanged(text:String): Unit {
        this.note10.setText("输入的内容为：${text}")
    }

    public func onBottomChanged(bottom: Float64): Unit {
        this.note11.setText("最小值不低于：${bottom}")
    }
    public func onTopChanged(top: Float64): Unit {
        this.note11.setText("最大值不超过：${top}")
    }
    public func onDecimalsChanged(decimals: Int64): Unit {
        this.note11.setText("小数点精度为：${decimals}")
    }
}
