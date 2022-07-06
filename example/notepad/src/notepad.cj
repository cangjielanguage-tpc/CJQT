from cjqt import qt.gui.*
from cjqt import qt.code.*
from cjqt import qt.widgets.*

public class NotepadWindow <: QMainWindow {
    public init() {
        setFixedSize(800, 600)
        setWindowTitle("Notepad")

        setPalette(QPalette(QColor.White))
        setAutoFillBackground(true)

        createMenu()
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
        let actionNew = menuFile.addAction("新建")
        actionNew.triggered.connect() {
            let url = QFileDialog.getOpenFileUrl(this, "文件选择框", QUrl("./"), "MD文件(*md);;文本文件(*txt)")
            println("url: ${url.toString()}")
        }
        menuFile.addAction("新建文件夹")
        menuFile.addSeparator()
        let actionOpen = menuFile.addAction("打开···")
        actionOpen.triggered.connect() {
            println("actionOpen triggered")
        }
        menuFile.addAction("打开文件夹···")
        menuFile.addSeparator()
        let actionSave = menuFile.addAction("保存")
        menuFile.addAction("另存为···")
        menuFile.addSeparator()
        let actionClose = menuFile.addAction("关闭")
    }

    func createEditMenu() {
        let menuEdit = menuBar().addMenu("编辑(&E)")
        menuEdit.addAction("撤销")
        menuEdit.addAction("重做")
        menuEdit.addSeparator()
        menuEdit.addAction("剪切")
        menuEdit.addAction("复制")
        menuEdit.addAction("粘贴")
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
        menuFormat.addAction("加粗")
        menuFormat.addAction("斜体")
        menuFormat.addAction("下划线")
        menuFormat.addAction("代码")
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
        menuHelp.addAction("关于")
    }
}
