package draw
import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
main(){
    QApplication.create()

    let mainWindow =  maniWindow ()
    let ui_mainWindow=Ui_MainWindow(mainWindow)
    
    mainWindow.show()

    QApplication.exec()

    mainWindow.delete()

    QApplication.delete()
}