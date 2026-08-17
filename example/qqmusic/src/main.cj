package qqmusic

import cjqt.widgets.*
import cjqt.gui.*
import cjqt.core.*

main() {
    QApplication.create()
    let win = QQMusicWindow()
    AnimGlobals.progressTick = { => win.updateProgress() }
    AnimGlobals.navTick = { => win.tickNav() }
    win.show()
    QApplication.exec()
    win.delete()
    QApplication.delete()
}
