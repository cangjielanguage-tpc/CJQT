from cjqt import qt.code.*
from cjqt import qt.gui.*
from cjqt import qt.widgets.*

public class maniWindow <: QMainWindow {
    public init() {
        setFixedSize(600, 800)
        setWindowTitle("单行文本编辑器")
        let mainLayout = QGridLayout()

        //设置mainLayout的水平和横向的间隔为20
        mainLayout.setHorizontalSpacing(10)
        mainLayout.setVerticalSpacing(10)

        //设置mainLayout居中
        mainLayout.setAlignment()

        let widget = QWidget(this)

        let srollBar1 = QScrollBar(Orientation.Horizontal, widget)
        mainLayout.addWidget(srollBar1, 60, 10, 10, 40)
        //调用QScrollBar类MousePressEvent函数
        srollBar1.setMousePressEvent()

        let srollBar2 = myScrollBar(Orientation.Horizontal, widget)
        mainLayout.addWidget(srollBar2, 120, 10, 10, 40)
        //调用myScrollBar子类派生的MousePressEvent函数
        srollBar2.setMousePressEvent()

        let srollBar3 = myScrollBar(Orientation.Horizontal, widget)
        mainLayout.addWidget(srollBar3, 160, 10, 10, 40)
        //调用自定义的lambda表达式
        srollBar3.setMousePressEvent({
            event=>
            println("entry custMousePressEvent")
        })
        widget.setLayout(mainLayout)
        setCentralWidget(widget)
    }
}
