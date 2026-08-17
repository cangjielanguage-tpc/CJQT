package qqmusic

import cjqt.widgets.*
import cjqt.gui.*
import cjqt.core.*

main() {
    QApplication.create()
    let win = QQMusicWindow()
    win.show()
    QApplication.exec()
    win.delete()
    QApplication.delete()
}
