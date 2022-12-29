package gui

public class Ui {
    var mainLayout: QVBoxLayout //mainLayout

    var splitter: QSplitter 

    let app: GuiApp

    public init(app: GuiApp) {
        this.app = app

        mainLayout = QVBoxLayout(parent: app)

        splitter = QSplitter()
        splitter.setHandleWidth(0)

        let sidebar = LeftPanel(app)
        splitter.addWidget(sidebar)
        
        mainLayout.addWidget(splitter)

        app.resize(880, 600)
        app.setWindowTitle("FeelUOwn")
        app.setWindowIcon(QIcon("assets/icons/feeluown.png"))
    }
}
