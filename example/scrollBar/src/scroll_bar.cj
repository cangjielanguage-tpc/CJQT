from cjqt import qt.core.*
from cjqt import qt.gui.*
from cjqt import qt.widgets.*

public class myScrollBar <: QScrollBar {
    public init(orientation: Orientation, parent: QWidget) {
        super(orientation, parent)
    }
    protected  override func mousePressEvent(event: QMouseEvent): Unit {
        println("entry myscrollBar mouseMoveEvent")
    }
}
