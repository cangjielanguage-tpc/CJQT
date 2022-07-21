### QWidgets封装进度

#### 常用控件

- `QCheckBox` 复选框控件(进行中)
- `QRadioButton` 单选按钮控件(进行中)
- `QComboBox` 单击按钮
- `QTimeEdit` 编辑或显示时间的控件
- `QDateEdit` 编辑或显示日期的控件
- `QDateTimeEdit` 编辑或显示时间和日期的控件
- `QPushButton` 普通按钮控件(进行中)
- `QLabel` 显示文本或图片的控件(进行中)
- `QLineEdit` 单行文本框控件
- `QTextEdit` 文本编辑控件(进行中)
- `QStatusBar` 状态栏控件(进行中)
- `QToolBar` 工具栏控件(进行中)
- `QMenuBar` 菜单栏控件(进行中)
- `QMenu` 菜单控件(进行中)
- `QProgressBar` 水平与垂直进度条
- `QScrollBar` 水平与垂直滚动条
- `QSizeGrip` 可以改变最上层视窗的大小
- `QSlider` 水平与垂直滑块
- `QTabWidget` Tab控件
- `QToolBox` 成列的Tab控件
- `QToolButton` 基于选项或命令可以快速访问的按钮控件
- `QButtonGroup` 按钮控件的组合容器
- `QGroupBox` 分组框控件(已完成)
- `QBoxLayout` 线性布局控件(进行中)
- `QHBoxLayout` 水平布局控件(进行中)
- `QVBoxLayout` 垂直布局控件(进行中)
- `QSplitter` 具有分割功能的控件
- `QSplitterHandle` 控制分割功能的控件
- `QMessageBox` 消息框控件(进行中)
- `QStackedWidget` 堆叠布局控件
- `QTabWidget` Tab控件
- `QFileDialog` 对话窗口的基类(进行中)
- `QDialog` 对话窗口的基类
- `QFrame` 框架控件的基类
- `QListView` 列表布局控件
- `QTableView` 表格布局控件
- `QGridLayout` 网格布局控件(进行中)

```
QWidgets:

QAbstractButton           ░░░░░░░░░░         QAbstractGraphicsShapeItem   ░░░░░░░░░░
QAbstractItemDelegate     ░░░░░░░░░░         QAbstractItemView            ░░░░░░░░░░    
QAbstractScrollArea       ░░░░░░░░░░         QAbstractSlider              ░░░░░░░░░░    
QAbstractSpinBox          ░░░░░░░░░░         QAccessibleWidget            ░░░░░░░░░░
QAction                   ▓▓░░░░░░░░         QActionGroup                 ░░░░░░░░░░
QApplication              ▓▓░░░░░░░░         QBoxLayout                   ▓░░░░░░░░░
QButtonGroup              ░░░░░░░░░░         QCalendarWidget              ░░░░░░░░░░
QCheckBox                 ▓▓░░░░░░░░         QColorDialog                 ░░░░░░░░░░
QColormap                 ░░░░░░░░░░         QColumnView                  ░░░░░░░░░░
QComboBox                 ░░░░░░░░░░         QCommandLinkButton           ░░░░░░░░░░
QCommonStyle              ░░░░░░░░░░         QDateEdit                    ░░░░░░░░░░
QDateTimeEdit             ░░░░░░░░░░         QDial                        ░░░░░░░░░░
QDialog                   ░░░░░░░░░░         QDialogButtonBox             ░░░░░░░░░░
QDockWidget               ░░░░░░░░░░         QDoubleSpinBox               ░░░░░░░░░░
QErrorMessage             ░░░░░░░░░░         QFileDialog                  ▓▓░░░░░░░░
QFileIconProvider         ░░░░░░░░░░         QFileSystemModel             ░░░░░░░░░░
QFocusFrame               ░░░░░░░░░░         QFontComboBox                ░░░░░░░░░░
QFontDialog               ░░░░░░░░░░         QFormLayout                  ░░░░░░░░░░
QFrame                    ░░░░░░░░░░         QGesture                     ░░░░░░░░░░
QGestureEvent             ░░░░░░░░░░         QGestureRecognizer           ░░░░░░░░░░
QGraphicsAnchor           ░░░░░░░░░░         QGraphicsAnchorLayout        ░░░░░░░░░░
QGraphicsBlur             ░░░░░░░░░░         QGraphicsColorizeEffect      ░░░░░░░░░░
QGraphicsDropShadowEffect ░░░░░░░░░░         QGraphicsEffect              ░░░░░░░░░░
QGraphicsEllipseItem      ░░░░░░░░░░         QGraphicsGridLayout          ░░░░░░░░░░
QGraphicsItem             ░░░░░░░░░░         QGraphicsItemGroup           ░░░░░░░░░░
QGraphicsLayout           ░░░░░░░░░░         QGraphicsLayoutItem          ░░░░░░░░░░
QGraphicsLineItem         ░░░░░░░░░░         QGraphicsLinearLayout        ░░░░░░░░░░
QGraphicsObject           ░░░░░░░░░░         QGraphicsOpacityEffect       ░░░░░░░░░░
QGraphicsPathItem         ░░░░░░░░░░         QGraphicsPixmapItem          ░░░░░░░░░░
QGraphicsPolygonItem      ░░░░░░░░░░         QGraphicsProxyWidget         ░░░░░░░░░░
QGraphicsRectItem         ░░░░░░░░░░         QGraphicsRotation            ░░░░░░░░░░
QGraphicsScale            ░░░░░░░░░░         QGraphicsScene               ░░░░░░░░░░
QGraphicsSceneContextMenuEvent ░░░░░░░░░░    QGraphicsSceneDragDropEvent  ░░░░░░░░░░
QGraphicsSceneEvent       ░░░░░░░░░░         QGraphicsSceneHelpEvent      ░░░░░░░░░░
QGraphicsSceneHoverEvent  ░░░░░░░░░░         QGraphicsSceneMouseEvent     ░░░░░░░░░░
QGraphicsSceneMoveEvent   ░░░░░░░░░░         QGraphicsSceneResizeEvent    ░░░░░░░░░░
QGraphicsSceneWheelEvent  ░░░░░░░░░░         QGraphicsSceneWheelEvent     ░░░░░░░░░░
QGraphicsTextItem         ░░░░░░░░░░         QGraphicsTransform           ░░░░░░░░░░
QGraphicsView             ░░░░░░░░░░         QGraphicsWidget              ░░░░░░░░░░
QGridLayout               ▓▓░░░░░░░░         QGroupBox                    ▓▓▓▓▓▓▓▓▓▓
QHBoxLayout               ▓░░░░░░░░░         QHeaderView                  ░░░░░░░░░░
QInputDialog              ░░░░░░░░░░         QItemDelegate                ░░░░░░░░░░
QItemEditorCreator        ░░░░░░░░░░         QItemEditorCreatorBase       ░░░░░░░░░░
QItemEditorFactory        ░░░░░░░░░░         QKeyEventTransition          ░░░░░░░░░░
QKeySequenceEdit          ░░░░░░░░░░         QLCDNumber                   ░░░░░░░░░░
QLabel                    ▓▓░░░░░░░░         QLayout                      ▓░░░░░░░░░
QLayoutItem               ░░░░░░░░░░         QLineEdit                    ░░░░░░░░░░
QListView                 ░░░░░░░░░░         QListWidget                  ░░░░░░░░░░
QListWidgetItem           ░░░░░░░░░░         QMainWindow                  ▓▓░░░░░░░░
QMdiArea                  ░░░░░░░░░░         QMdiSubWindow                ░░░░░░░░░░
QMenu                     ▓▓▓░░░░░░░         QMenuBar                     ▓▓▓░░░░░░░
QMessageBox               ░░░░░░░░░░         QMouseEventTransition        ░░░░░░░░░░
QOpenGLWidget             ░░░░░░░░░░         QPanGesture                  ░░░░░░░░░░
QPinchGesture             ░░░░░░░░░░         QPlainTextDocumentLayout     ░░░░░░░░░░
QPlainTextEdit            ░░░░░░░░░░         QProgressBar                 ░░░░░░░░░░
QProgressDialog           ░░░░░░░░░░         QProxyStyle                  ░░░░░░░░░░
QPushButton               ▓▓▓░░░░░░░         QRadioButton                 ░░░░░░░░░░
QRubberBand               ░░░░░░░░░░         QScrollArea                  ░░░░░░░░░░
QScrollBar                ░░░░░░░░░░         QScroller                    ░░░░░░░░░░
QScrollerProperties       ░░░░░░░░░░         QShortcut                    ░░░░░░░░░░
QSizeGrip                 ░░░░░░░░░░         QSizePolicy                  ░░░░░░░░░░
QSlider                   ░░░░░░░░░░         QSpacerItem                  ░░░░░░░░░░
QSpinBox                  ░░░░░░░░░░         QSplashScreen                ░░░░░░░░░░
QSplitter                 ░░░░░░░░░░         QSplitterHandle              ░░░░░░░░░░
QStackedLayout            ░░░░░░░░░░         QStackedWidget               ░░░░░░░░░░
QStandardItemEditorCreator ░░░░░░░░░░        QStatusBar                   ░░░░░░░░░░
QStyle                    ░░░░░░░░░░         QStyleFactory                ░░░░░░░░░░
QStyleHintReturn          ░░░░░░░░░░         QStyleHintReturnMask         ░░░░░░░░░░
QStyleHintReturnVariant   ░░░░░░░░░░         QStyleOption                 ░░░░░░░░░░
QStyleOptionButton        ░░░░░░░░░░         QStyleOptionComboBox         ░░░░░░░░░░
QStyleOptionComplex       ░░░░░░░░░░         QStyleOptionDockWidget       ░░░░░░░░░░
QStyleOptionFocusRect     ░░░░░░░░░░         QStyleOptionFrame            ░░░░░░░░░░
QStyleOptionGraphicsItem  ░░░░░░░░░░         QStyleOptionGroupBox         ░░░░░░░░░░
QStyleOptionHeader        ░░░░░░░░░░         QStyleOptionMenuItem         ░░░░░░░░░░
QStyleOptionProgressBar   ░░░░░░░░░░         QStyleOptionRubberBand       ░░░░░░░░░░
QStyleOptionSizeGrip      ░░░░░░░░░░         QStyleOptionSlider           ░░░░░░░░░░
QStyleOptionSpinBox       ░░░░░░░░░░         QStyleOptionTab              ░░░░░░░░░░
QStyleOptionTabBarBase    ░░░░░░░░░░         QStyleOptionTabWidgetFrame   ░░░░░░░░░░
QStyleOptionTitleBar      ░░░░░░░░░░         QStyleOptionToolBar          ░░░░░░░░░░
QStyleOptionToolBox       ░░░░░░░░░░         QStyleOptionToolButton       ░░░░░░░░░░
QStyleOptionViewItem      ░░░░░░░░░░         QStylePainter                ░░░░░░░░░░
QStylePlugin              ░░░░░░░░░░         QStyledItemDelegate          ░░░░░░░░░░
QSwipeGesture             ░░░░░░░░░░         QSystemTrayIcon              ░░░░░░░░░░
QTabBar                   ░░░░░░░░░░         QTabWidget                   ░░░░░░░░░░
QTableView                ░░░░░░░░░░         QTableWidget                 ░░░░░░░░░░
QTableWidgetItem          ░░░░░░░░░░         QTableWidgetSelectionRange   ░░░░░░░░░░
QTapAndHoldGesture        ░░░░░░░░░░         QTapGesture                  ░░░░░░░░░░
QTextBrowser              ░░░░░░░░░░         QTextEdit                    ▓▓▓░░░░░░░
QTileRules                ░░░░░░░░░░         QTimeEdit                    ░░░░░░░░░░
QToolBar                  ░░░░░░░░░░         QToolBox                     ░░░░░░░░░░
QToolButton               ░░░░░░░░░░         QToolTip                     ░░░░░░░░░░
QTreeView                 ░░░░░░░░░░         QTreeWidget                  ░░░░░░░░░░
QTreeWidgetItem           ░░░░░░░░░░         QTreeWidgetItemIterator      ░░░░░░░░░░
QUndoCommand              ░░░░░░░░░░         QUndoGroup                   ░░░░░░░░░░
QUndoStack                ░░░░░░░░░░         QUndoView                    ░░░░░░░░░░
QVBoxLayout               ▓░░░░░░░░░         QWhatsThis                   ░░░░░░░░░░
QWidget                   ▓▓▓▓░░░░░░         QWidgetAction                ░░░░░░░░░░
QWidgetItem               ░░░░░░░░░░         QWizard                      ░░░░░░░░░░
QWizardPage               ░░░░░░░░░░

```