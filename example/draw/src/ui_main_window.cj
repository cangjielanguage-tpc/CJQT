import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*

public class Ui_MainWindow {
    public let selectAct: QAction
    public let lineAct: QAction
    public let rectAct: QAction
    public let ellipseAct: QAction
    public let polylineAct: QAction
    public let action_XML: QAction
    public let action_XML_2: QAction
    public let colorAct: QAction
    public let selectRect: QAction
    public let clearAct: QAction
    public let saveImgAct: QAction
    public let addImgAct: QAction
    public let tableSolidAct: QAction
    public let centralwidget: QWidget
    public let horizontalLayout: QHBoxLayout
    public let graphicsView: QGraphicsView
    public let scene: DrawScene
    public let toolBar: QToolBar
    public let mainWindow: QMainWindow

    public init(window: QMainWindow) {
        mainWindow = window

        //selectAct
        selectAct = QAction(mainWindow)
        selectAct.setCheckable(true)
        let icon1 = QIcon(("./images/mouse.png"))
        selectAct.setIcon(icon1)

        //lineAct
        lineAct = QAction(mainWindow)
        lineAct.setCheckable(true)
        let icon2 = QIcon(("./images/lines(1).png"))
        lineAct.setIcon(icon2)

        //rectAct
        rectAct = QAction(mainWindow)
        rectAct.setCheckable(true)
        let icon3 = QIcon(("./images/square.png"))
        rectAct.setIcon(icon3)

        //ellipseAct
        ellipseAct = QAction(mainWindow)
        ellipseAct.setCheckable(true)
        let icon4 = QIcon(("./images/ellipse.png"))
        ellipseAct.setIcon(icon4)

        //polylineAct
        polylineAct = QAction(mainWindow)
        polylineAct.setCheckable(true)
        let icon5 = QIcon(("./images/polygon.png"))
        polylineAct.setIcon(icon5)

        //action_XML
        action_XML = QAction(mainWindow)
        action_XML.setCheckable(true)
        let icon6 = QIcon(("./images/XML.png"))
        action_XML.setIcon(icon6)

        //action_XML_2
        action_XML_2 = QAction(mainWindow)
        action_XML_2.setCheckable(true)
        let icon7 = QIcon(("./images/tolead.png"))
        action_XML_2.setIcon(icon7)

        //colorAct
        colorAct = QAction(mainWindow)
        colorAct.setCheckable(true)
        let icon8 = QIcon(("./images/setcolor.png"))
        colorAct.setIcon(icon8)

        //selectRect
        selectRect = QAction(mainWindow)
        selectRect.setCheckable(true)
        let icon9 = QIcon(("./images/cloose.png"))
        selectRect.setIcon(icon9)

        //clearAct
        clearAct = QAction(mainWindow)
        clearAct.setCheckable(true)
        let icon10 = QIcon(("./images/clear.png"))
        clearAct.setIcon(icon10)

        //saveImgAct
        saveImgAct = QAction(mainWindow)
        saveImgAct.setCheckable(true)
        let icon11 = QIcon(("./images/save(1).png"))
        saveImgAct.setIcon(icon11)

        //addImgAct
        addImgAct = QAction(mainWindow)
        addImgAct.setCheckable(true)
        let icon12 = QIcon(("./images/img.png"))
        addImgAct.setIcon(icon12)

        //tableSolidAct
        tableSolidAct = QAction(mainWindow)
        tableSolidAct.setCheckable(true)
        let icon13 = QIcon(("./images/tablesolid.png"))
        tableSolidAct.setIcon(icon13)

        centralwidget = QWidget(mainWindow)
        horizontalLayout = QHBoxLayout(parent: centralwidget)
        graphicsView = QGraphicsView(parent: centralwidget)
        horizontalLayout.addWidget(graphicsView)
        mainWindow.setCentralWidget(centralwidget)
        scene = DrawScene(mainWindow)
        toolBar = QToolBar(parent: centralwidget)
        mainWindow.addToolBar(toolBar)
        initGraphics()
        toolBar.addAction(selectAct)
        toolBar.addAction(lineAct)
        toolBar.addAction(rectAct)
        toolBar.addAction(ellipseAct)
        toolBar.addAction(polylineAct)
        toolBar.addAction(action_XML)
        toolBar.addAction(action_XML_2)
        toolBar.addAction(colorAct)
        toolBar.addSeparator()
        toolBar.addAction(selectRect)
        toolBar.addAction(clearAct)
        toolBar.addAction(saveImgAct)
        toolBar.addAction(addImgAct)
        toolBar.addSeparator()
        toolBar.addAction(tableSolidAct)
        addImgAct.triggered.connect(on_addImgAct_triggerd)
        selectRect.triggered.connect(on_selectRect_triggerd)
        polylineAct.triggered.connect(on_polylineAct_triggerd)
        ellipseAct.triggered.connect(on_ellipseAct_triggerd)
        rectAct.triggered.connect(on_rectAct_triggerd)
        selectAct.triggered.connect(on_selectAct_triggerd)
        lineAct.triggered.connect(on_lineAct_triggerd)
        tableSolidAct.triggered.connect(on_tableSolidAct_triggerd)
        createGroup()
    }

    public func initGraphics() {
        graphicsView.setCacheMode(QGraphicsViewCacheMode.CacheBackground)
        graphicsView.setScene(scene)
        graphicsView.setStyleSheel("padding:0px; border:0px;")
        graphicsView.setAlignment(AlignLeft)
        //graphicsView.setAlignment(AlignTop)

        var rect = graphicsView.rect()
        scene.setSceneRect(QRectF(rect))
        scene.setBackgroundBrush(QBrush(QColor(255, 255, 255)))

        selectAct.setChecked(true)
        tableSolidAct.setChecked(true)
        on_tableSolidAct_triggerd(true)
    }

    public func createGroup() {
        let drawActionGroup = QActionGroup(mainWindow)
        drawActionGroup.addAction(selectAct)
        drawActionGroup.addAction(lineAct)
        drawActionGroup.addAction(rectAct)
        drawActionGroup.addAction(ellipseAct)
        drawActionGroup.addAction(polylineAct)
        drawActionGroup.addAction(selectRect)
        drawActionGroup.addAction(addImgAct)
    }

    public func on_tableSolidAct_triggerd(checked: Bool): Unit {
        if (checked) {
            scene.drawBackShape()
        } else {
            scene.setBackgroundBrush(QBrush(QColor(255, 255, 255)))
        }
    }

    public func on_selectAct_triggerd(checked: Bool): Unit {
        scene.m_drawShapeState = DrawShapeState.selection
    }
    public func on_lineAct_triggerd(checked: Bool): Unit {
        scene.m_drawShapeState = DrawShapeState.line
    }
    public func on_rectAct_triggerd(checked: Bool): Unit {
        scene.m_drawShapeState = DrawShapeState.rectangle
    }
    public func on_ellipseAct_triggerd(checked: Bool): Unit {
        scene.m_drawShapeState = DrawShapeState.ellipse
    }
    public func on_polylineAct_triggerd(checked: Bool): Unit {
        scene.m_drawShapeState = DrawShapeState.polyLine
    }
    public func on_selectRect_triggerd(checked: Bool): Unit {

    }
    public func on_addImgAct_triggerd(checked: Bool): Unit {}
}
