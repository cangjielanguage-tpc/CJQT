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
        let srollBar = QScrollBar(Orientation.Horizontal, widget)
        srollBar.setEvent()
       mainLayout.addWidget(srollBar, 10, 10,4,40)
        widget.setLayout(mainLayout)
        setCentralWidget(widget)
    }
}
