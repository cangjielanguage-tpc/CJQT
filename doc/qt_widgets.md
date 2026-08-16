# QWidgets 封装进度

> 适配版本：Cangjie 1.0.5 / Qt 5.14.2
>
> 统计说明：`▓` 表示已完成比例（满格 10 格为 100%），`░` 表示尚未完成。
>
> - 已完成（▓▓▓▓▓▓▓▓░░ 及以上）：类主体及常用接口已封装，可在示例/测试中直接使用
> - 进行中（▓▓░░░░░░░░ ~ ▓▓▓▓▓▓░░░░）：已完成创建/删除等基础接口，常用接口封装不完整
> - 未移植（░░░░░░░░░░）：尚无对应封装代码

## 进度总览

| 分类 | 数量 |
| :--- | :--- |
| 已完成 | 29 |
| 进行中 | 29 |
| 未移植 | 130+ |

## 常用控件

### 已完成

- `QLabel` 显示文本或图片的控件
- `QLineEdit` 单行文本框控件
- `QTextEdit` 文本编辑控件
- `QPushButton` 普通按钮控件
- `QCheckBox` 复选框控件
- `QRadioButton` 单选按钮控件
- `QGroupBox` 分组框控件
- `QFrame` 框架控件的基类
- `QBoxLayout` / `QHBoxLayout` / `QVBoxLayout` 布局控件
- `QGridLayout` 网格布局控件
- `QSplitter` / `QSplitterHandle` 分割控件
- `QStatusBar` 状态栏控件
- `QToolBar` 工具栏控件
- `QMenuBar` / `QMenu` 菜单栏、菜单控件
- `QTabWidget` / `QTabBar` Tab 控件
- `QScrollBar` 水平与垂直滚动条
- `QScrollArea` 滚动区域控件
- `QMessageBox` 消息框控件
- `QDialog` / `QDialogButtonBox` / `QFileDialog` 对话框类
- `QMainWindow` 主窗口控件
- `QGraphicsView` / `QGraphicsScene` 图形视图/场景
- `QPainter` 绘图（QtGui 类，封装于 widgets 包）

### 进行中

- `QListView` 列表布局控件
- `QTableView` 表格布局控件
- `QTreeView` 树形布局控件
- `QHeaderView` 表头控件
- `QAbstractItemView` 项目视图抽象基类
- `QAbstractItemDelegate` / `QStyledItemDelegate` 项委托
- `QMdiArea` MDI 区域控件
- `QDockWidget` 停靠窗口控件
- `QFontDialog` 字体对话框

### 未移植

- `QComboBox` 下拉选择框
- `QTimeEdit` / `QDateEdit` / `QDateTimeEdit` 时间日期编辑控件
- `QProgressBar` 进度条
- `QSlider` 滑块（仅封装抽象基类 `QAbstractSlider`）
- `QSizeGrip` 视窗缩放控件
- `QToolBox` 成列的 Tab 控件
- `QToolButton` 快速访问按钮控件
- `QButtonGroup` 按钮组合容器
- `QStackedWidget` 堆叠布局控件
- `QSpinBox` / `QDoubleSpinBox` 数字调节控件
- `QListWidget` / `QTableWidget` / `QTreeWidget` 项控件
- `QCalendarWidget` / `QLCDNumber` / `QDial` 等

## 全部类进度

### 已完成

```
QWidgets:

QAction                   ▓▓▓▓▓▓▓▓░░         QAbstractItemView        ▓▓▓▓▓▓░░░░
QApplication              ▓▓▓▓▓▓▓▓░░         QBoxLayout               ▓▓▓▓▓▓░░░░
QDialog                   ▓▓▓▓▓▓░░░░         QDialogButtonBox         ▓▓▓▓▓▓░░░░
QFileDialog               ▓▓▓▓▓▓░░░░         QFrame                   ▓▓▓▓▓▓▓▓▓░
QGraphicsScene            ▓▓▓▓▓▓▓▓▓░         QGraphicsView            ▓▓▓▓▓▓▓▓▓░
QGridLayout               ▓▓▓▓▓▓▓░░░         QGroupBox                ▓▓▓▓▓▓▓▓░░
QHBoxLayout               ▓▓▓▓▓▓░░░░         QLineEdit                ▓▓▓▓▓▓▓▓▓░
QMainWindow               ▓▓▓▓▓▓▓░░░         QMenu                    ▓▓▓▓▓▓▓░░░
QMenuBar                  ▓▓▓▓▓▓▓░░░         QPainter                 ▓▓▓▓▓▓▓▓▓░
QScrollArea               ▓▓▓▓▓▓▓░░░         QScrollBar               ▓▓▓▓▓▓░░░░
QSplitter                 ▓▓▓▓▓▓▓▓▓░         QSplitterHandle          ▓▓▓▓▓▓░░░░
QStatusBar                ▓▓▓▓▓▓▓░░░         QTabBar                  ▓▓▓▓▓▓▓▓▓░
QTabWidget                ▓▓▓▓▓▓▓▓▓░         QTextEdit                ▓▓▓▓▓▓▓▓░░
QToolBar                  ▓▓▓▓▓▓▓░░░         QVBoxLayout              ▓▓▓▓▓▓░░░░
QWidget                   ▓▓▓▓▓▓▓▓▓░
```

### 进行中

```
QWidgets:

QAbstractGraphicsShapeItem ▓▓▓▓▓░░░░░        QAbstractItemDelegate     ▓▓▓▓░░░░░░
QAbstractScrollArea       ▓▓▓▓▓░░░░░         QAbstractSlider           ▓▓░░░░░░░░
QActionGroup              ▓▓▓░░░░░░░         QCheckBox                ▓▓▓▓▓░░░░░
QDockWidget               ▓▓▓▓░░░░░░         QFontDialog              ▓▓▓░░░░░░░
QGraphicsEllipseItem      ▓▓▓▓░░░░░░         QGraphicsItem             ▓▓▓░░░░░░░
QGraphicsLineItem         ▓▓▓▓▓░░░░░         QGraphicsRectItem         ▓▓▓▓░░░░░░
QGraphicsSceneContextMenuEvent ▓▓░░░░░░      QGraphicsSceneDragDropEvent ▓▓░░░░░░
QGraphicsSceneEvent       ▓▓░░░░░░░░         QGraphicsSceneHelpEvent   ▓▓░░░░░░░░
QGraphicsSceneMouseEvent  ▓▓▓▓░░░░░░         QGraphicsSceneWheelEvent  ▓▓░░░░░░░░
QHeaderView               ▓▓▓▓░░░░░░         QLabel                   ▓▓▓▓▓░░░░░
QLayout                   ▓▓▓░░░░░░░         QListView                ▓▓▓░░░░░░░
QMdiArea                  ▓▓▓░░░░░░░         QMessageBox              ▓▓▓▓▓░░░░░
QPushButton               ▓▓▓▓▓░░░░░         QRadioButton             ▓▓▓▓▓░░░░░
QStyledItemDelegate       ▓▓▓▓░░░░░░         QTableView               ▓▓▓▓░░░░░░
QTreeView                 ▓▓▓░░░░░░░
```

### 未移植

以下 QtWidgets 类尚无封装（仅列常用类）：

```
QWidgets:

QAbstractButton           ░░░░░░░░░░         QAbstractSpinBox          ░░░░░░░░░░
QButtonGroup              ░░░░░░░░░░         QCalendarWidget           ░░░░░░░░░░
QColorDialog              ░░░░░░░░░░         QColumnView               ░░░░░░░░░░
QComboBox                 ░░░░░░░░░░         QCommandLinkButton        ░░░░░░░░░░
QDateEdit                 ░░░░░░░░░░         QDateTimeEdit             ░░░░░░░░░░
QDial                     ░░░░░░░░░░         QDoubleSpinBox            ░░░░░░░░░░
QErrorMessage             ░░░░░░░░░░         QFileIconProvider         ░░░░░░░░░░
QFileSystemModel          ░░░░░░░░░░         QFocusFrame               ░░░░░░░░░░
QFontComboBox             ░░░░░░░░░░         QFormLayout               ░░░░░░░░░░
QGraphicsDropShadowEffect ░░░░░░░░░░         QGraphicsEffect           ░░░░░░░░░░
QGraphicsItemGroup        ░░░░░░░░░░         QGraphicsLayout           ░░░░░░░░░░
QGraphicsLinearLayout     ░░░░░░░░░░         QGraphicsObject           ░░░░░░░░░░
QGraphicsPathItem         ░░░░░░░░░░         QGraphicsPixmapItem       ░░░░░░░░░░
QGraphicsPolygonItem      ░░░░░░░░░░         QGraphicsProxyWidget      ░░░░░░░░░░
QGraphicsTextItem         ░░░░░░░░░░         QGraphicsWidget           ░░░░░░░░░░
QInputDialog              ░░░░░░░░░░         QItemDelegate             ░░░░░░░░░░
QItemEditorFactory        ░░░░░░░░░░         QLCDNumber                ░░░░░░░░░░
QListWidget               ░░░░░░░░░░         QListWidgetItem           ░░░░░░░░░░
QMdiSubWindow             ░░░░░░░░░░         QOpenGLWidget             ░░░░░░░░░░
QPlainTextEdit            ░░░░░░░░░░         QProgressBar              ░░░░░░░░░░
QProgressDialog           ░░░░░░░░░░         QRubberBand               ░░░░░░░░░░
QScroller                 ░░░░░░░░░░         QShortcut                 ░░░░░░░░░░
QSizeGrip                 ░░░░░░░░░░         QSizePolicy               ░░░░░░░░░░
QSlider                   ░░░░░░░░░░         QSpacerItem               ░░░░░░░░░░
QSpinBox                  ░░░░░░░░░░         QSplashScreen             ░░░░░░░░░░
QStackedLayout            ░░░░░░░░░░         QStackedWidget            ░░░░░░░░░░
QStyle                    ░░░░░░░░░░         QStyleFactory             ░░░░░░░░░░
QStyleOption*             ░░░░░░░░░░         QSystemTrayIcon           ░░░░░░░░░░
QTableWidget              ░░░░░░░░░░         QTableWidgetItem          ░░░░░░░░░░
QTextBrowser              ░░░░░░░░░░         QTimeEdit                 ░░░░░░░░░░
QToolBox                  ░░░░░░░░░░         QToolButton               ░░░░░░░░░░
QToolTip                  ░░░░░░░░░░         QTreeWidget               ░░░░░░░░░░
QTreeWidgetItem           ░░░░░░░░░░         QUndoCommand              ░░░░░░░░░░
QUndoStack                ░░░░░░░░░░         QWizard                   ░░░░░░░░░░
QWizardPage               ░░░░░░░░░░         QWidgetAction             ░░░░░░░░░░
```

## 说明

- 信号封装：`QWidgetSignal<T>`（`signal.cj`）提供通用信号连接框架，`QLineEdit`、`QPushButton`、`QGroupBox`、`QDialogButtonBox`、`QAbstractItemView`、`QAction` 等均基于其派生具体信号。
- 事件回调映射：`QWidgetCallbackMap`（`widget_callback_map.cj`）与 `QGraphicsSceneCallbackMap`（`graphics_scene_callback_map.cj`）管理各组件事件回调。
- `QAbstractScrollArea`/`QAbstractItemView`/`QAbstractSlider` 等抽象基类已封装，为 `QScrollArea`/`QListView`、`QTableView`、`QTreeView`、`QScrollBar` 等提供继承基础。
- 未移植类中，`QSlider` 仅有抽象基类 `QAbstractSlider`，具体控件待封装；`QProgressBar`、`QComboBox`、`QStackedWidget`、`QToolBox`、`QSpinBox` 等为后续 RoadMap 重点。
