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
| 已完成 | 60 |
| 进行中 | 29 |
| 未移植 | 101+ |

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
- `QComboBox` 下拉选择框
- `QSlider` 滑块控件
- `QProgressBar` 进度条
- `QSpinBox` 数字调节控件
- `QStackedWidget` 堆叠布局控件
- `QToolBox` 成列的 Tab 控件
- `QButtonGroup` 按钮组合容器
- `QPlainTextEdit` 纯文本编辑器
- `QToolButton` 工具按钮
- `QTimeEdit` / `QDateEdit` / `QDateTimeEdit` 时间日期编辑控件
- `QDoubleSpinBox` 浮点数字调节控件
- `QLCDNumber` LCD 数字显示
- `QFormLayout` 表单布局
- `QColorDialog` 颜色选择对话框
- `QDial` 旋钮控件
- `QCalendarWidget` 日历控件
- `QInputDialog` 输入对话框
- `QListWidget` / `QTableWidget` / `QTreeWidget` 项视图控件
- `QSplashScreen` 启动画面
- `QProgressDialog` 进度对话框
- `QTextBrowser` 富文本浏览器
- `QItemDelegate` 项委托
- `QSystemTrayIcon` 系统托盘图标
- `QToolTip` 工具提示
- `QStackedLayout` 堆叠布局
- `QRubberBand` 橡皮筋选区
- `QShortcut` 快捷键

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
- `QSizeGrip` 视窗缩放控件
- `QCalendarWidget` / `QDial` 等
## 全部类进度

### 已完成

```
QWidgets:

QAction                   ▓▓▓▓▓▓▓▓░░         QAbstractItemView        ▓▓▓▓▓▓░░░░
QApplication              ▓▓▓▓▓▓▓▓░░         QBoxLayout               ▓▓▓▓▓▓░░░░
QButtonGroup              ▓▓▓▓▓▓▓▓░░         QComboBox                ▓▓▓▓▓▓▓▓░░
QDialog                   ▓▓▓▓▓▓░░░░         QDialogButtonBox         ▓▓▓▓▓▓░░░░
QFileDialog               ▓▓▓▓▓▓░░░░         QFrame                   ▓▓▓▓▓▓▓▓▓░
QGraphicsScene            ▓▓▓▓▓▓▓▓▓░         QGraphicsView            ▓▓▓▓▓▓▓▓▓░
QGridLayout               ▓▓▓▓▓▓▓░░░         QGroupBox                ▓▓▓▓▓▓▓▓░░
QHBoxLayout               ▓▓▓▓▓▓░░░░         QLineEdit                ▓▓▓▓▓▓▓▓▓░
QMainWindow               ▓▓▓▓▓▓▓░░░         QMenu                    ▓▓▓▓▓▓▓░░░
QMenuBar                  ▓▓▓▓▓▓▓░░░         QPainter                 ▓▓▓▓▓▓▓▓▓░
QProgressBar              ▓▓▓▓▓▓▓▓░░         QScrollArea              ▓▓▓▓▓▓▓░░░
QScrollBar                ▓▓▓▓▓▓░░░░         QSlider                  ▓▓▓▓▓▓▓▓░░
QSpinBox                  ▓▓▓▓▓▓▓▓░░         QSplitter                ▓▓▓▓▓▓▓▓▓░
QStackedLayout            ▓▓▓▓▓▓▓▓░░
QSplitterHandle           ▓▓▓▓▓▓░░░░         QStackedWidget           ▓▓▓▓▓▓▓▓░░
QStatusBar                ▓▓▓▓▓▓▓░░░         QSystemTrayIcon          ▓▓▓▓▓▓▓▓░░
QTabBar                   ▓▓▓▓▓▓▓▓▓░
QCalendarWidget           ▓▓▓▓▓▓▓▓░░         QColorDialog              ▓▓▓▓▓▓▓▓░░
QDateEdit                 ▓▓▓▓▓▓▓▓░░         QDateTimeEdit             ▓▓▓▓▓▓▓▓░░
QDial                     ▓▓▓▓▓▓▓▓░░         QDoubleSpinBox           ▓▓▓▓▓▓▓▓░░
QFormLayout               ▓▓▓▓▓▓▓▓░░         QInputDialog              ▓▓▓▓▓▓▓▓░░
QLCDNumber                ▓▓▓▓▓▓▓▓░░         QListWidget               ▓▓▓▓▓▓▓▓░░
QTableWidget              ▓▓▓▓▓▓▓▓░░         QTreeWidget               ▓▓▓▓▓▓▓▓░░
QItemDelegate             ▓▓▓▓▓▓▓▓░░         QPlainTextEdit            ▓▓▓▓▓▓▓▓░░
QProgressDialog           ▓▓▓▓▓▓▓▓░░         QSplashScreen             ▓▓▓▓▓▓▓▓░░
QTabWidget                ▓▓▓▓▓▓▓▓▓░
QTextBrowser              ▓▓▓▓▓▓▓▓░░         QTextEdit                 ▓▓▓▓▓▓▓▓░░
QToolTip                  ▓▓▓▓▓▓▓▓░░
QTimeEdit                 ▓▓▓▓▓▓▓▓░░
QToolBar                  ▓▓▓▓▓▓▓░░░         QToolBox                 ▓▓▓▓▓▓▓▓░░
QToolButton               ▓▓▓▓▓▓▓▓░░         QVBoxLayout              ▓▓▓▓▓▓░░░░
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
QRubberBand               ▓▓▓▓▓▓▓▓░░         QShortcut                ▓▓▓▓▓▓▓▓░░
QStyledItemDelegate       ▓▓▓▓░░░░░░         QTableView               ▓▓▓▓░░░░░░
QTreeView                 ▓▓▓░░░░░░░
```

### 未移植
以下 QtWidgets 类尚无封装（仅列常用类）：
```
QWidgets:
QAbstractButton  ░░░░░░░░░░  QAbstractSpinBox  ░░░░░░░░░░
QCalendarWidget  ░░░░░░░░░░  ░░░░░░░░░░
░░░░░░░░░░  QColumnView  ░░░░░░░░░░
QCommandLinkButton  ░░░░░░░░░░  QDateEdit  ░░░░░░░░░░
QDateEdit  ░░░░░░░░░░  QDateTimeEdit  ░░░░░░░░░░
QDial  ░░░░░░░░░░  ░░░░░░░░░░
QErrorMessage  ░░░░░░░░░░  QFileIconProvider  ░░░░░░░░░░
QFileSystemModel  ░░░░░░░░░░  QFocusFrame  ░░░░░░░░░░
QFontComboBox  ░░░░░░░░░░  ░░░░░░░░░░
QGraphicsDropShadowEffect ░░░░░░░░░░  QGraphicsEffect  ░░░░░░░░░░
QGraphicsItemGroup  ░░░░░░░░░░  QGraphicsLayout  ░░░░░░░░░░
QGraphicsLinearLayout  ░░░░░░░░░░  QGraphicsObject  ░░░░░░░░░░
QGraphicsPathItem  ░░░░░░░░░░  QGraphicsPixmapItem  ░░░░░░░░░░
QGraphicsPolygonItem  ░░░░░░░░░░  QGraphicsProxyWidget  ░░░░░░░░░░
QGraphicsTextItem  ░░░░░░░░░░  QGraphicsWidget  ░░░░░░░░░░
QInputDialog  ░░░░░░░░░░  QItemDelegate  ░░░░░░░░░░
QItemEditorFactory  ░░░░░░░░░░  ░░░░░░░░░░
QListWidget  ░░░░░░░░░░  QListWidgetItem  ░░░░░░░░░░
QMdiSubWindow  ░░░░░░░░░░  QOpenGLWidget  ░░░░░░░░░░
░░░░░░░░░░  QProgressDialog  ░░░░░░░░░░
QProgressDialog  ░░░░░░░░░░  QRubberBand  ░░░░░░░░░░
QScroller  ░░░░░░░░░░  QShortcut  ░░░░░░░░░░
QSizeGrip  ░░░░░░░░░░  QSizePolicy  ░░░░░░░░░░
QSpacerItem  ░░░░░░░░░░  QSplashScreen  ░░░░░░░░░░
QSplashScreen  ░░░░░░░░░░  QStackedLayout  ░░░░░░░░░░
QStackedLayout  ░░░░░░░░░░  QStyle  ░░░░░░░░░░
QStyle  ░░░░░░░░░░  QStyleFactory  ░░░░░░░░░░
QStyleOption*  ░░░░░░░░░░  QSystemTrayIcon  ░░░░░░░░░░
QTableWidget  ░░░░░░░░░░  QTableWidgetItem  ░░░░░░░░░░
QTextBrowser  ░░░░░░░░░░  ░░░░░░░░░░
░░░░░░░░░░  QToolTip  ░░░░░░░░░░
QToolTip  ░░░░░░░░░░  QTreeWidget  ░░░░░░░░░░
QTreeWidgetItem  ░░░░░░░░░░  QUndoCommand  ░░░░░░░░░░
QUndoStack  ░░░░░░░░░░  QWizard  ░░░░░░░░░░
QWizardPage  ░░░░░░░░░░  QWidgetAction  ░░░░░░░░░░
```
## 说明

- 信号封装：`QWidgetSignal<T>`（`signal.cj`）提供通用信号连接框架，`QLineEdit`、`QPushButton`、`QGroupBox`、`QDialogButtonBox`、`QAbstractItemView`、`QAction` 等均基于其派生具体信号。
- 事件回调映射：`QWidgetCallbackMap`（`widget_callback_map.cj`）与 `QGraphicsSceneCallbackMap`（`graphics_scene_callback_map.cj`）管理各组件事件回调。
- `QAbstractScrollArea`/`QAbstractItemView`/`QAbstractSlider` 等抽象基类已封装，为 `QScrollArea`/`QListView`、`QTableView`、`QTreeView`、`QScrollBar` 等提供继承基础。
- 高频控件（`QComboBox`、`QSlider`、`QProgressBar`、`QSpinBox`、`QStackedWidget`、`QToolBox`、`QButtonGroup`）已新增封装。未移植类中，`QTimeEdit`/`QDateEdit`/`QDateTimeEdit`、`QDoubleSpinBox`、`QToolButton`、`QListWidget`/`QTableWidget`/`QTreeWidget` 等为后续 RoadMap 重点。
