package gui

from cjqt import qt.widgets.*
from cjqt import qt.gui.*
from cjqt import qt.core.*

public class GuiApp <: QWidget {
    var ui: ?Ui = None

    public init() {
        ui = Ui(this)
    }
}