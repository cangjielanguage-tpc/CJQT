from cjqt import qt.code.*
from cjqt import qt.gui.*
from cjqt import qt.widgets.*
main(){
    QApplication.create()

    let mainWindow =  maniWindow ()
    let ui_mainWindow=Ui_MainWindow(mainWindow)
    
    mainWindow.show()

    QApplication.exec()

    mainWindow.delete()

    QApplication.delete()
}