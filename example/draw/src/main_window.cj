package draw
import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*

public class maniWindow <: QMainWindow {

    public init() {
        resize(800, 800)
        setWindowTitle("绘图工具")
        let icon = QIcon(("./images/widget.ico"))
        setWindowIcon(icon)
    }
}
