package scrollBar
import cjqt.core.*
import cjqt.gui.QMouseEvent
import cjqt.widgets.QWidget
import cjqt.widgets.QScrollBar

public class myScrollBar <: QScrollBar {
    public init(orientation: Orientation, parent: QWidget) {
        super(orientation, parent)
    }
    protected  override func mousePressEvent(event: QMouseEvent): Unit {
        println("entry myscrollBar mouseMoveEvent")
    }
}
