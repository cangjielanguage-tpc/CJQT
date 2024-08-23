import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
main(){
    QApplication.create()

    let mainWindow =  maniWindow ()
    mainWindow.show()

    QApplication.exec()

    mainWindow.delete()

    QApplication.delete()
}