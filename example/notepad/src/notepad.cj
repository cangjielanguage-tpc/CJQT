import cjqt.qt.core.*
import fs.*

public class NotepadWindow <: QMainWindow {
    let textEdit: QTextEdit
    let layout: QVBoxLayout
    var currentFile: String = ""

    let actionBold = QAction()
    let actionItalic = QAction()
    let actionUnderline = QAction()

    public init() {
        setFixedSize(600, 400)
        setWindowTitle("记事本")

        setPalette(QPalette(QColor.White))
        setAutoFillBackground(true)

        let centralWidget = QWidget()
        setCentralWidget(centralWidget)

        layout = QVBoxLayout()
        centralWidget.setLayout(layout)

        textEdit = QTextEdit()
        layout.addWidget(textEdit)

        initAction()
        createMenu()
        createToolBar()
    }

    func initAction() {
        actionBold.setText("粗体")
        actionBold.setIcon(QIcon("./images/bold.png"))
        actionBold.setCheckable(true)
        actionBold.triggered.connect(setFontBold)

        actionItalic.setText("斜体")
        actionItalic.setIcon(QIcon("./images/italic.png"))
        actionItalic.setCheckable(true)
        actionItalic.triggered.connect(setFontItalic)

        actionUnderline.setText("下划线")
        actionUnderline.setIcon(QIcon("./images/underline.png"))
        actionUnderline.setCheckable(true)
        actionUnderline.triggered.connect(setFontUnderline)
    }

    func createMenu() {
        createFileMenu()
        createEditMenu()
        createParagraphMenu()
        createFormatMenu()
        createViewMenu()
        createThemeMenu()
        createHelpMenu()
    }

    func createFileMenu() {
        let menuFile = menuBar().addMenu("文件(&F)")
        let actionNew = menuFile.addAction(QIcon("./images/new.png"), "新建")
        actionNew.triggered.connect(newDocument)

        let actionOpen = menuFile.addAction(QIcon("./images/open.png"), "打开···")
        actionOpen.triggered.connect(openFile)

        menuFile.addSeparator()
        let actionSave = menuFile.addAction(QIcon("./images/save.png"), "保存")
        actionSave.triggered.connect(saveFile)

        let actionSaveAs = menuFile.addAction(QIcon("./images/save_as.png"), "另存为···")
        actionSaveAs.triggered.connect(saveFileAs)

        let actionClose = menuFile.addAction(QIcon("./images/exit.png"), "关闭")
        actionClose.triggered.connect(exitApp)
    }

    func createEditMenu() {
        let menuEdit = menuBar().addMenu("编辑(&E)")
        let actionUndo = menuEdit.addAction(QIcon("./images/edit_undo.png"), "撤销")
        actionUndo.triggered.connect(editUndo)
        let actionRedo = menuEdit.addAction(QIcon("./images/edit_redo.png"), "恢复")
        actionRedo.triggered.connect(editRedo)

        menuEdit.addSeparator()
        let actionCut = menuEdit.addAction(QIcon("./images/cut.png"), "剪切")
        actionCut.triggered.connect(editCut)
        let actionCopy = menuEdit.addAction(QIcon("./images/copy.png"), "复制")
        actionCopy.triggered.connect(editCopy)
        let actionPaste = menuEdit.addAction(QIcon("./images/paste.png"), "粘贴")
        actionPaste.triggered.connect(editPaste)
    }

    func createParagraphMenu() {
        let menuParagraph = menuBar().addMenu("段落(&P)")
        menuParagraph.addAction("一级标题")
        menuParagraph.addAction("二级标题")
        menuParagraph.addAction("三级标题")
        menuParagraph.addAction("四级标题")
        menuParagraph.addSeparator()
        menuParagraph.addAction("段落")
        menuParagraph.addSeparator()
        menuParagraph.addAction("有序列表")
        menuParagraph.addAction("无序列表")
    }

    func createFormatMenu() {
        let menuFormat = menuBar().addMenu("格式(&O)")
        menuFormat.addAction(actionBold)
        menuFormat.addAction(actionItalic)
        menuFormat.addAction(actionUnderline)
    }

    func createViewMenu() {
        let menuView = menuBar().addMenu("视图(&V)")
        menuView.addAction("隐藏/显示侧边栏")
        menuView.addAction("大纲")
        menuView.addAction("文件列表")
        menuView.addAction("搜索")
    }

    func createThemeMenu() {
        let menuTheme = menuBar().addMenu("主题(&T)")
        menuTheme.addAction("默认主题")
    }

    func createHelpMenu() {
        let menuHelp = menuBar().addMenu("帮助(&H)")
        menuHelp.addAction("检测更新···")
        menuHelp.addAction("更新日志")
        menuHelp.addSeparator()
        let aboutClose = menuHelp.addAction(QIcon("./images/info.png"), "关于")
        aboutClose.triggered.connect(about)
    }

    func createToolBar() {
        let toolBar = QToolBar(parent: this)
        addToolBar(toolBar)
        let actionNew = toolBar.addAction(QIcon("./images/new.png"), "新建")
        actionNew.triggered.connect(newDocument)
        let actionOpen = toolBar.addAction(QIcon("./images/open.png"), "打开")
        actionOpen.triggered.connect(openFile)
        let actionSave = toolBar.addAction(QIcon("./images/save.png"), "保存")
        actionSave.triggered.connect(saveFile)
        let actionSaveAs = toolBar.addAction(QIcon("./images/save_as.png"), "另存为···")
        actionSaveAs.triggered.connect(saveFileAs)
        toolBar.addAction(QIcon("./images/print.png"), "打印")

        toolBar.addSeparator()
        let actionCopy = toolBar.addAction(QIcon("./images/copy.png"), "复制")
        actionCopy.triggered.connect(editCopy)
        let actionCut = toolBar.addAction(QIcon("./images/cut.png"), "剪切")
        actionCut.triggered.connect(editCut)
        let actionPaste = toolBar.addAction(QIcon("./images/paste.png"), "粘贴")
        actionPaste.triggered.connect(editPaste)
        let actionUndo = toolBar.addAction(QIcon("./images/edit_undo.png"), "撤销")
        actionUndo.triggered.connect(editUndo)
        let actionRedo = toolBar.addAction(QIcon("./images/edit_redo.png"), "恢复")
        actionRedo.triggered.connect(editRedo)

        toolBar.addSeparator()
        let actionFont = toolBar.addAction(QIcon("./images/font.png"), "字体")
        actionFont.triggered.connect(setFont)

        toolBar.addAction(actionBold)
        toolBar.addAction(actionItalic)
        toolBar.addAction(actionUnderline)

        toolBar.addSeparator()
        let actionAbout = toolBar.addAction(QIcon("./images/info.png"), "关于")
        actionAbout.triggered.connect(about)

        toolBar.addSeparator()
        let actionClose = toolBar.addAction(QIcon("./images/exit.png"), "退出")
        actionClose.triggered.connect(exitApp)
    }

    func newDocument(bool: Bool) {
        currentFile = ""
        textEdit.setText("")
    }

    func openFile(bool: Bool) {
        let fileName = QFileDialog.getOpenFileName(
            parent: this,
            caption: "打开文档",
            dir: ".",
            filter: "文本文件(*txt)"
        )
        if (fileName.isEmpty()) {
            return
        }
        currentFile = fileName
        setWindowTitle(fileName)

        var file: File = File(fileName, OpenOption.Open(true, false))
        if (File.exists(fileName)) {
            let data = String.fromUtf8(file.readToEnd())
            textEdit.setText(data)
            file.close()
        }
    }

    func saveFile(bool: Bool) {
        if (currentFile.isEmpty()) {
            let fileName = QFileDialog.getSaveFileName(
                parent: this,
                caption: "保存文档",
                dir: ".",
                filter: "文本文件(*txt)"
            )
            if (fileName.isEmpty()) {
                return
            }
            currentFile = fileName
            setWindowTitle(fileName)
        }

        var file: File = File(currentFile, OpenOption.Create(false))
        if (File.exists(currentFile)) {
            file.write(textEdit.toPlainText().toUtf8Array())
            file.flush()
            file.close()
        }
    }

    func saveFileAs(bool: Bool) {
        let fileName = QFileDialog.getSaveFileName(
            parent: this,
            caption: "文档另存为",
            dir: ".",
            filter: "文本文件(*txt)"
        )
        if (fileName.isEmpty()) {
            return
        }
        currentFile = fileName
        setWindowTitle(fileName)
        
        var file: File = File(currentFile, OpenOption.Create(false))
        if (File.exists(currentFile)) {
            file.write(textEdit.toPlainText().toUtf8Array())
            file.flush()
            file.close()
        }
    }

    func exitApp(bool: Bool) {
        QApplication.quit()
    }

    func editCopy(bool: Bool) {
        textEdit.copy()
    }

    func editCut(bool: Bool) {
        textEdit.cut()
    }

    func editPaste(bool: Bool) {
        textEdit.paste()
    }

    func editUndo(bool: Bool) {
        textEdit.undo()
    }

    func editRedo(bool: Bool) {
        textEdit.redo()
    }

    func setFont(bool: Bool){
        let font = QFontDialog.getFont(parent: this)
        if (font.ptr != 0){
            textEdit.setFont(font)
        }
    }

    func setFontUnderline(underline: Bool) {
        textEdit.setFontUnderline(underline)
    }

    func setFontItalic(italic: Bool) {
        textEdit.setFontItalic(italic)
    }

    func setFontBold(bold: Bool) {
        if (bold) {
            textEdit.setFontWeight(FontWeight.Bold)
        } else {
            textEdit.setFontWeight(FontWeight.Normal)
        }
    }

    func about(bool: Bool) {
        QMessageBox.about(this, "CJQT记事本", "基于QT仓颉语言绑定版本构建的记事本示例")
    }
}
