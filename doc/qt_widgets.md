# QWidgets 封装进度

> 适配版本：Cangjie 1.0.5 / Qt 5.14.2
>
> 统计说明：`▓` 表示已完成（满格 10 格为 100%），`░` 表示尚未移植。
> 每类均包含 native C 绑定（`native/src/widgets/`）、仓颉封装（`src/widgets/`）与单元测试。

## 进度总览

| 分类 | 数量 |
| :--- | :--- |
| 已完成 | 106 |
| 未移植 | 50+（多为样式系统/内部类） |

## 已完成

```
QWidgets:

QAbstractGraphicsShapeItem ▓▓▓▓▓▓▓▓▓▓        QAbstractItemDelegate     ▓▓▓▓▓▓▓▓▓▓
QAbstractItemView         ▓▓▓▓▓▓▓▓▓▓         QAbstractScrollArea       ▓▓▓▓▓▓▓▓▓▓
QAbstractSlider           ▓▓▓▓▓▓▓▓▓▓         QAbstractSpinBox          ▓▓▓▓▓▓▓▓▓▓
QAction                   ▓▓▓▓▓▓▓▓▓▓         QActionGroup              ▓▓▓▓▓▓▓▓▓▓
QApplication              ▓▓▓▓▓▓▓▓▓▓         QBoxLayout                ▓▓▓▓▓▓▓▓▓▓
QButtonGroup              ▓▓▓▓▓▓▓▓▓▓         QCalendarWidget           ▓▓▓▓▓▓▓▓▓▓
QCheckBox                 ▓▓▓▓▓▓▓▓▓▓         QColorDialog              ▓▓▓▓▓▓▓▓▓▓
QColumnView               ▓▓▓▓▓▓▓▓▓▓         QComboBox                 ▓▓▓▓▓▓▓▓▓▓
QCommandLinkButton        ▓▓▓▓▓▓▓▓▓▓         QDateEdit                 ▓▓▓▓▓▓▓▓▓▓
QDateTimeEdit             ▓▓▓▓▓▓▓▓▓▓         QDial                     ▓▓▓▓▓▓▓▓▓▓
QDialog                   ▓▓▓▓▓▓▓▓▓▓         QDialogButtonBox          ▓▓▓▓▓▓▓▓▓▓
QDockWidget               ▓▓▓▓▓▓▓▓▓▓         QDoubleSpinBox            ▓▓▓▓▓▓▓▓▓▓
QErrorMessage             ▓▓▓▓▓▓▓▓▓▓         QFileDialog               ▓▓▓▓▓▓▓▓▓▓
QFileIconProvider         ▓▓▓▓▓▓▓▓▓▓         QFileSystemModel          ▓▓▓▓▓▓▓▓▓▓
QFontComboBox             ▓▓▓▓▓▓▓▓▓▓         QFontDialog               ▓▓▓▓▓▓▓▓▓▓
QFormLayout               ▓▓▓▓▓▓▓▓▓▓         QFrame                    ▓▓▓▓▓▓▓▓▓▓
QGraphicsEllipseItem      ▓▓▓▓▓▓▓▓▓▓         QGraphicsItem             ▓▓▓▓▓▓▓▓▓▓
QGraphicsLineItem         ▓▓▓▓▓▓▓▓▓▓         QGraphicsRectItem         ▓▓▓▓▓▓▓▓▓▓
QGraphicsScene            ▓▓▓▓▓▓▓▓▓▓         QGraphicsSceneContextMenuEvent ▓▓▓▓▓▓▓▓▓▓
QGraphicsSceneDragDropEvent ▓▓▓▓▓▓▓▓▓▓       QGraphicsSceneEvent       ▓▓▓▓▓▓▓▓▓▓
QGraphicsSceneHelpEvent   ▓▓▓▓▓▓▓▓▓▓         QGraphicsSceneMouseEvent  ▓▓▓▓▓▓▓▓▓▓
QGraphicsSceneWheelEvent  ▓▓▓▓▓▓▓▓▓▓         QGraphicsView             ▓▓▓▓▓▓▓▓▓▓         QGridLayout               ▓▓▓▓▓▓▓▓▓▓
QGroupBox                 ▓▓▓▓▓▓▓▓▓▓         QHBoxLayout               ▓▓▓▓▓▓▓▓▓▓
QHeaderView               ▓▓▓▓▓▓▓▓▓▓         QInputDialog              ▓▓▓▓▓▓▓▓▓▓
QItemDelegate             ▓▓▓▓▓▓▓▓▓▓         QItemEditorFactory        ▓▓▓▓▓▓▓▓▓▓
QLCDNumber                ▓▓▓▓▓▓▓▓▓▓         QLabel                    ▓▓▓▓▓▓▓▓▓▓
QLayout                   ▓▓▓▓▓▓▓▓▓▓         QLineEdit                 ▓▓▓▓▓▓▓▓▓▓
QListView                 ▓▓▓▓▓▓▓▓▓▓         QListWidget               ▓▓▓▓▓▓▓▓▓▓
QListWidgetItem           ▓▓▓▓▓▓▓▓▓▓         QMainWindow               ▓▓▓▓▓▓▓▓▓▓
QMdiArea                  ▓▓▓▓▓▓▓▓▓▓         QMdiSubWindow             ▓▓▓▓▓▓▓▓▓▓
QMenu                     ▓▓▓▓▓▓▓▓▓▓         QMenuBar                  ▓▓▓▓▓▓▓▓▓▓
QMessageBox               ▓▓▓▓▓▓▓▓▓▓         QPainter                  ▓▓▓▓▓▓▓▓▓▓
QPlainTextEdit            ▓▓▓▓▓▓▓▓▓▓         QProgressBar              ▓▓▓▓▓▓▓▓▓▓
QProgressDialog           ▓▓▓▓▓▓▓▓▓▓         QPushButton               ▓▓▓▓▓▓▓▓▓▓
QRadioButton              ▓▓▓▓▓▓▓▓▓▓         QRubberBand               ▓▓▓▓▓▓▓▓▓▓
QScrollArea               ▓▓▓▓▓▓▓▓▓▓         QScrollBar                ▓▓▓▓▓▓▓▓▓▓
QShortcut                 ▓▓▓▓▓▓▓▓▓▓         QSizeGrip                 ▓▓▓▓▓▓▓▓▓▓
QSlider                   ▓▓▓▓▓▓▓▓▓▓         QSpinBox                  ▓▓▓▓▓▓▓▓▓▓
QSplashScreen             ▓▓▓▓▓▓▓▓▓▓         QSplitter                 ▓▓▓▓▓▓▓▓▓▓
QSplitterHandle           ▓▓▓▓▓▓▓▓▓▓         QStackedLayout            ▓▓▓▓▓▓▓▓▓▓
QStackedWidget            ▓▓▓▓▓▓▓▓▓▓         QStatusBar                ▓▓▓▓▓▓▓▓▓▓
QStyledItemDelegate       ▓▓▓▓▓▓▓▓▓▓         QSystemTrayIcon           ▓▓▓▓▓▓▓▓▓▓
QTabBar                   ▓▓▓▓▓▓▓▓▓▓         QTabWidget                ▓▓▓▓▓▓▓▓▓▓
QTableView                ▓▓▓▓▓▓▓▓▓▓         QTableWidget              ▓▓▓▓▓▓▓▓▓▓
QTableWidgetItem          ▓▓▓▓▓▓▓▓▓▓         QTextBrowser              ▓▓▓▓▓▓▓▓▓▓
QTextEdit                 ▓▓▓▓▓▓▓▓▓▓         QTimeEdit                 ▓▓▓▓▓▓▓▓▓▓
QToolBar                  ▓▓▓▓▓▓▓▓▓▓         QToolBox                  ▓▓▓▓▓▓▓▓▓▓
QToolButton               ▓▓▓▓▓▓▓▓▓▓         QToolTip                  ▓▓▓▓▓▓▓▓▓▓
QTreeView                 ▓▓▓▓▓▓▓▓▓▓         QTreeWidget               ▓▓▓▓▓▓▓▓▓▓
QTreeWidgetItem           ▓▓▓▓▓▓▓▓▓▓         QUndoCommand              ▓▓▓▓▓▓▓▓▓▓
QUndoStack                ▓▓▓▓▓▓▓▓▓▓         QVBoxLayout               ▓▓▓▓▓▓▓▓▓▓
QWidget                   ▓▓▓▓▓▓▓▓▓▓         QWizard                   ▓▓▓▓▓▓▓▓▓▓
QWizardPage               ▓▓▓▓▓▓▓▓▓▓
```

## 未移植

以下 QtWidgets 类尚未移植（多为样式系统/图形特效等内部类）：

```
QAbstractButton           ░░░░░░░░░░         QFocusFrame               ░░░░░░░░░░
QGraphicsDropShadowEffect ░░░░░░░░░░         QGraphicsEffect           ░░░░░░░░░░
QGraphicsItemGroup        ░░░░░░░░░░         QGraphicsLayout           ░░░░░░░░░░
QGraphicsLinearLayout     ░░░░░░░░░░         QGraphicsObject           ░░░░░░░░░░
QGraphicsPathItem         ░░░░░░░░░░         QGraphicsPixmapItem       ░░░░░░░░░░
QGraphicsPolygonItem      ░░░░░░░░░░         QGraphicsProxyWidget      ░░░░░░░░░░
QGraphicsTextItem         ░░░░░░░░░░         QGraphicsWidget           ░░░░░░░░░░
QOpenGLWidget             ░░░░░░░░░░         QScroller                 ░░░░░░░░░░
QScrollerProperties       ░░░░░░░░░░         QSpacerItem               ░░░░░░░░░░
QStyle                    ░░░░░░░░░░         QStyleFactory             ░░░░░░░░░░
QStyleOption*             ░░░░░░░░░░         QWidgetAction             ░░░░░░░░░░
```

## 说明

- 信号封装：`QWidgetSignal<T>`（`signal.cj`）提供通用信号连接框架，各控件基于其派生具体信号。
- 事件回调映射：`QWidgetCallbackMap`、`QGraphicsSceneCallbackMap` 管理各组件事件回调。
- 常用控件（按钮、文本框、列表/表格/树、Tab、菜单、对话框、布局、图形视图等）已全部移植。
- `QStyle`/`QStyleOption*` 为 Qt 样式系统内部结构，`QGraphicsEffect` 为图形特效，`QAbstractButton` 已由 QPushButton/QCheckBox/QRadioButton 覆盖，`QSizePolicy` 以仓颉结构体提供。此类类在仓颉 GUI 应用中不常用。
