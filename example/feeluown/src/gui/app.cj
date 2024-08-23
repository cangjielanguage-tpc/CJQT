package gui

import cjqt.widgets.*
import cjqt.gui.*
import cjqt.core.*
import std.collection.*

public class GuiApp <: QWidget {
    var ui: ?Ui = None

    public init() {
        ui = Ui(this)
    }
}