import cjqt.qt.core.*
import cjqt.qt.gui.*
import cjqt.qt.widgets.*

public class myScrollBar <: QScrollBar {
    public init(orientation: Orientation, parent: QWidget) {
        super(orientation, parent)
    }
    protected  override func mousePressEvent(event: QMouseEvent): Unit {
        println("entry myscrollBar mouseMoveEvent")
    }
}
