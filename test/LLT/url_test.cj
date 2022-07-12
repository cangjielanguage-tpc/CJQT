// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from cjqt import qt.gui.*
from cjqt import qt.code.*
from cjqt import qt.widgets.*

main() {
    let url = QUrl("./README.md")
    url.isValid()
    url.toString()
    url.delete()
    return 0
}
