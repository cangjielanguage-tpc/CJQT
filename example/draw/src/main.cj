import cjqt.qt.core.*
import cjqt.qt.gui.*
import cjqt.qt.widgets.*
main(){
    QApplication.create()

    let mainWindow =  maniWindow ()
    let ui_mainWindow=Ui_MainWindow(mainWindow)
    
    mainWindow.show()

    QApplication.exec()

    mainWindow.delete()

    QApplication.delete()
}