// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from cjqt import qt.gui.*
from cjqt import qt.code.*
from cjqt import qt.widgets.*

main() {
    QApplication.create()
    let widget = QWidget()
    InitTest(widget)
    textTest()
    setPlaceholderTextTest()
    addActionTest()
    setEchModTest()
    setReadOnlyTest()
    setInputMaskTest()
    setFrameTest()
    selectedTextTest()
    setMaxLengtTest()
    setModifiedTest()
    setValidatorTest()
    setAlignmenTest()
    optTest()
    signalTest()
    widget.delete()
    QApplication.delete()
    return 0
}
public func InitTest(widget: QWidget): Unit {
    let lineEdit1 = QLineEdit("单行文本框")
    let lineEdit2 = QLineEdit(widget)
    let lineEdit3 = QLineEdit("单行文本框", widget)
    let lineEdit4 = QLineEdit()
    lineEdit1.delete()
    lineEdit2.delete()
    lineEdit3.delete()
    lineEdit4.delete()
}

public func addActionTest() {
    let action = QAction()
    let action2 = QAction()
    let lineEdit = QLineEdit()
    let icon = QIcon()
    lineEdit.addAction(action, ActionPosition.LeadingPosition)
    lineEdit.addAction(action2, ActionPosition.TrailingPosition)
    lineEdit.addAction(icon, ActionPosition.TrailingPosition)
    action.delete()
    lineEdit.delete()
}
public func textTest() {
    let lineEdit = QLineEdit("单行文本框")
    lineEdit.text()
    lineEdit.delete()
}
public func setPlaceholderTextTest() {
    let lineEdit = QLineEdit()
    lineEdit.setPlaceholderText("清输入文本内容")
    lineEdit.placeholderText()
    lineEdit.delete()
}
public func setEchModTest() {
    let lineEdit = QLineEdit()
    let lineEdit1 = QLineEdit()
    let lineEdit2 = QLineEdit()
    lineEdit.setEchMod(EchoMode.Password)
    lineEdit1.setEchMod(EchoMode.PasswordEchoOnEdit)
    lineEdit2.setEchMod(EchoMode.convert(Int32(5)))
    lineEdit.echMode()
    lineEdit1.echMode()
    lineEdit2.echMode()
    lineEdit.delete()
    lineEdit1.delete()
    lineEdit2.delete()
}
public func setReadOnlyTest() {
    let lineEdit = QLineEdit()
    lineEdit.setReadOnly(true)
    lineEdit.isReadOnly()
    lineEdit.delete()
}
public func setInputMaskTest() {
    let lineEdit = QLineEdit()
    lineEdit.setInputMask("000.000.000.000;_")
    lineEdit.inputMask()
    lineEdit.delete()
}
public func setFrameTest() {
    let lineEdit = QLineEdit()
    lineEdit.setFrame(true)
    lineEdit.hasFrame()
    lineEdit.delete()
}

public func selectedTextTest() {
    let lineEdit = QLineEdit()
    lineEdit.selectedText()
    lineEdit.hasSelectedText()
    lineEdit.delete()
}
public func setMaxLengtTest() {
    let lineEdit = QLineEdit()
    lineEdit.setMaxLengt(10)
    lineEdit.maxLength()
    lineEdit.delete()
}
public func setModifiedTest() {
    let lineEdit = QLineEdit()
    lineEdit.setModified(false)
    lineEdit.modified()
    lineEdit.delete()
}

public func setAlignmenTest() {
    let lineEdit = QLineEdit()
    lineEdit.setAlignmen(Alignment.AlignCenter)
    lineEdit.alignment()
    lineEdit.delete()
}
public func setValidatorTest() {
    let lineEdit = QLineEdit()
    let dwValidator: QDoubleValidator = QDoubleValidator()
    lineEdit.setValidator(dwValidator)
    lineEdit.validator()
    dwValidator.delete()
    lineEdit.delete()
}

func optTest() {
    let lineEdit = QLineEdit()
    lineEdit.setText("test")
    lineEdit.selectAll()
    lineEdit.copy()
    lineEdit.undo()
    lineEdit.cut()
    lineEdit.redo()
    lineEdit.paste()
    lineEdit.clear()
    lineEdit.delete()
}
func signalTest() {
    let lineEdit = QLineEdit()
    lineEdit.cursorPositionChanged.connect(onCursorPositionChanged)
    lineEdit.inputRejected.connect(onInputRejected)
    lineEdit.returnPressed.connect(onReturnPressed)
    lineEdit.selectionChanged.connect(onSelectionChanged)
    lineEdit.textChanged.connect(onTextChanged)
    lineEdit.textEdited.connect(onTextEdited)
    lineEdit.editingFinished.connect(onEditingFinished)
    lineEdit.setText("test")
    lineEdit.selectAll()
    lineEdit.delete()
}

public func onInputRejected(d: Unit): Unit {
    return
}
public func onReturnPressed(d: Unit): Unit {
    return
}

public func onSelectionChanged(d: Unit): Unit {
    return
}

public func onTextChanged(text: String): Unit {
    return
}
public func onTextEdited(text: String): Unit {
    return
}
public func onCursorPositionChanged(pos: (Int64, Int64)) {
    return
}
public func onEditingFinished(d: Unit): Unit {
    return
}
