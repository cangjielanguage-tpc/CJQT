// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from cjqt import qt.gui.*
from cjqt import qt.code.*
from cjqt import qt.widgets.*

main() {
    QApplication.create()
    newTextEditWithParentTest()
    setTextTest()
    setPlainTextTest()
    setHtmlTest()
    setMarkdownTest()
    setFontTest()
    setTextAttrTest()
    optTest()
    QApplication.delete()
    return 0
}

func newTextEditWithParentTest() {
    let widget = QWidget()
    let textEdit = QTextEdit(widget)
    textEdit.delete()
    widget.delete()
}

func setTextTest() {
    let textEdit = QTextEdit()
    textEdit.setText("textEdit")
    textEdit.append("append")
    textEdit.delete()
}

func setPlainTextTest() {
    let textEdit = QTextEdit()
    textEdit.setPlainText("textEdit")
    let result = textEdit.toPlainText()
    textEdit.delete()
}

func setHtmlTest() {
    let textEdit = QTextEdit()
    textEdit.setHtml("<html></html>")
    let result = textEdit.toHtml()
    textEdit.delete()
}

func setMarkdownTest() {
    let textEdit = QTextEdit()
    textEdit.setMarkdown("# test")
    let result = textEdit.toMarkdown()
    textEdit.delete()
}

func setFontTest() {
    let textEdit = QTextEdit()
    textEdit.setFontWeight(FontWeight.Normal)
    textEdit.setFontItalic(true)
    textEdit.setFontUnderline(true)
    textEdit.setFontFamily("宋体")
    textEdit.setCurrentFont(QFont())
    textEdit.delete()
}

func setTextAttrTest() {
    let textEdit = QTextEdit()
    textEdit.setTextColor(QColor.Black)
    textEdit.setTextBackgroundColor(QColor.White)
    textEdit.delete()
}

func optTest() {
    let textEdit = QTextEdit()
    textEdit.setText("test")
    textEdit.copy()
    textEdit.undo()
    textEdit.cut()
    textEdit.redo()
    textEdit.paste()
    textEdit.delete()
}
