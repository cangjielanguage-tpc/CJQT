// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.qt.gui.*
import cjqt.qt.core.*
import cjqt.qt.widgets.*

main() {
    let url = QUrl("./README.md")
    url.isValid()
    url.toString()

    let url1 = QUrl(url.ptr)
    url.delete()

    let url2 = QUrl("./README.md", 1)
    url2.delete()
    return 0
}
