package gui

import cjqt.qt.widgets.*
import cjqt.qt.gui.*
import cjqt.qt.core.*
import std.collection.*

public class GuiApp <: QWidget {
    var ui: ?Ui = None

    public init() {
        ui = Ui(this)
    }
}