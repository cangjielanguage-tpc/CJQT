// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package cjqt
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

// 验证 QListWidget setItemWidget 功能（自定义行内嵌控件）
main() {
    QApplication.create()
    let list = QListWidget()
    list.setFixedSize(600, 300)
    list.addItem("")
    let row = QWidget()
    row.setFixedHeight(45)
    list.setItemWidget(0, row)
    list.addItem("")
    let count = list.count()
    list.clear()
    list.delete()
    QApplication.delete()
    if (count != 2) {
        println("FAIL count: ${count}")
        return 1
    }
    println("test OK!")
    return 0
}
