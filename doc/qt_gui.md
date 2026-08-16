# QGui 封装进度

> 适配版本：Cangjie 1.0.5 / Qt 5.14.2
>
> 统计说明：`▓` 表示已完成比例（满格 10 格为 100%），`░` 表示尚未完成。
>
> - 已完成（▓▓▓▓▓▓▓▓░░ 及以上）：类主体及常用接口已封装，可在示例/测试中直接使用
> - 进行中（▓▓░░░░░░░░ ~ ▓▓▓▓▓▓░░░░）：已完成创建/删除等基础接口，常用接口封装不完整
> - 未移植（░░░░░░░░░░）：尚无对应封装代码
>
> 注：`QPainter` 为 QtGui 模块类，其仓颉封装位于 `cjqt.widgets` 包（`src/widgets/painter.cj`）。

## 进度总览

| 分类 | 数量 |
| :--- | :--- |
| 已完成 | 24 |
| 进行中 | 22 |
| 未移植 | 67+ |

## 已完成

```
QGui:

QBrush                    ▓▓▓▓▓▓▓░░░         QClipboard                ▓▓▓▓▓▓▓▓▓░
QColor                    ▓▓▓▓▓▓▓▓░░         QCursor                   ▓▓▓▓▓▓▓▓░░
QDoubleValidator          ▓▓▓▓▓▓▓▓▓░         QFont                     ▓▓▓▓▓▓▓░░░
QFontDatabase             ▓▓▓▓▓▓▓▓░░         QFontInfo                 ▓▓▓▓▓▓▓▓░░
QFontMetrics              ▓▓▓▓▓▓▓▓░░         QImage                    ▓▓▓▓▓▓▓▓░░
QIntValidator             ▓▓▓▓▓▓▓▓░░         QKeySequence              ▓▓▓▓▓▓▓▓░░
QMovie                    ▓▓▓▓▓▓▓▓░░         QPainter                  ▓▓▓▓▓▓▓▓▓░
QRegularExpressionValidator ▓▓▓▓▓▓▓▓░░       QTextCursor               ▓▓▓▓▓▓▓▓░░
QTextDocument             ▓▓▓▓▓▓▓▓░░
QPainterPath              ▓▓▓▓▓▓▓▓░░         QPalette                  ▓▓▓▓▓▓▓░░░
QPen                      ▓▓▓▓▓▓▓░░░         QPixmap                   ▓▓▓▓▓▓▓░░░
QPixmapCache              ▓▓▓▓▓▓▓▓░░         QStandardItemModel        ▓▓▓▓▓▓▓▓░░
QDesktopServices          ▓▓▓▓▓▓▓▓░░
```

## 进行中

```
QGui:

QConicalGradient          ▓▓░░░░░░░░         QContextMenuEvent         ▓▓▓░░░░░░░
QFocusEvent               ▓▓▓░░░░░░░         QGradient                 ▓▓░░░░░░░░
QGuiApplication           ▓▓▓▓░░░░░░         QHideEvent                ▓▓▓░░░░░░░
QIcon                     ▓▓▓▓▓▓░░░░         QInputMethodEvent         ▓▓▓░░░░░░░
QKeyEvent                 ▓▓▓▓▓▓░░░░         QLinearGradient           ▓▓░░░░░░░░
QMouseEvent               ▓▓▓▓▓░░░░░         QPaintDevice              ▓▓▓░░░░░░░
QPaintersEvent            ▓▓▓░░░░░░░         QPolygon                  ▓▓▓░░░░░░░
QPolygonF                 ▓▓▓░░░░░░░         QRadialGradient           ▓▓░░░░░░░░
QScreen                   ▓▓▓░░░░░░░         QStandardItem             ▓▓▓░░░░░░░
QTextOption               ▓▓▓░░░░░░░         QTransform                ▓▓▓░░░░░░░
QValidator                ▓▓▓▓▓▓░░░░         QWheelEvent               ▓▓▓░░░░░░░
```

## 未移植
以下 QtGui 类尚无封装（仅列常用类）：
```
QGui:
QAbstractTextDocumentLayout ░░░░░░░░░░  QAccessible  ░░░░░░░░░░
QBackingStore  ░░░░░░░░░░  QBitmap  ░░░░░░░░░░
QCloseEvent  ░░░░░░░░░░  QColorSpace  ░░░░░░░░░░
QColorSpace  ░░░░░░░░░░  QColorTransform  ░░░░░░░░░░
░░░░░░░░░░  QDrag  ░░░░░░░░░░
QDrag  ░░░░░░░░░░  QDragEnterEvent  ░░░░░░░░░░
QDragLeaveEvent  ░░░░░░░░░░  QDragMoveEvent  ░░░░░░░░░░
QDropEvent  ░░░░░░░░░░  QEnterEvent  ░░░░░░░░░░
QEventPoint  ░░░░░░░░░░  QExposeEvent  ░░░░░░░░░░
QFileOpenEvent  ░░░░░░░░░░  QFileSystemModel  ░░░░░░░░░░
QFontMetricsF  ░░░░░░░░░░  QGenericMatrix  ░░░░░░░░░░
QGenericMatrix  ░░░░░░░░░░  QGlyphRun  ░░░░░░░░░░
QHelpEvent  ░░░░░░░░░░  QHoverEvent  ░░░░░░░░░░
QIconEngine  ░░░░░░░░░░  QImageReader  ░░░░░░░░░░
QImageReader  ░░░░░░░░░░  QImageWriter  ░░░░░░░░░░
QInputMethod  ░░░░░░░░░░  QInputMethodQueryEvent  ░░░░░░░░░░
QMoveEvent  ░░░░░░░░░░  ░░░░░░░░░░
QMoveEvent  ░░░░░░░░░░  ░░░░░░░░░░
QNativeGestureEvent  ░░░░░░░░░░  QOffscreenSurface  ░░░░░░░░░░
QOpenGLContext  ░░░░░░░░░░  QOpenGLFunctions  ░░░░░░░░░░
QOpenGLTexture  ░░░░░░░░░░  QPageLayout  ░░░░░░░░░░
QPageSize  ░░░░░░░░░░  QPagedPaintDevice  ░░░░░░░░░░
QPaintEngine  ░░░░░░░░░░  QPaintEngineState  ░░░░░░░░░░
QPainterPathStroker  ░░░░░░░░░░  QPdfWriter  ░░░░░░░░░░
QPdfWriter  ░░░░░░░░░░  QPicture  ░░░░░░░░░░
QPixelFormat  ░░░░░░░░░░  ░░░░░░░░░░
QPointerEvent  ░░░░░░░░░░  QPointingDevice  ░░░░░░░░░░
QQuaternion  ░░░░░░░░░░  QRasterWindow  ░░░░░░░░░░
QRawFont  ░░░░░░░░░░  QRegion  ░░░░░░░░░░
QRegularExpressionValidator░░░░░░░░░░  QResizeEvent  ░░░░░░░░░░
QRgba64  ░░░░░░░░░░  QRgbaFloat  ░░░░░░░░░░
QScrollEvent  ░░░░░░░░░░  QScrollPrepareEvent  ░░░░░░░░░░
QSessionManager  ░░░░░░░░░░  QShortcut  ░░░░░░░░░░
QShowEvent  ░░░░░░░░░░  QSinglePointEvent  ░░░░░░░░░░
QStaticText  ░░░░░░░░░░  QStatusTipEvent  ░░░░░░░░░░
QSurface  ░░░░░░░░░░  QSurfaceFormat  ░░░░░░░░░░
QSyntaxHighlighter  ░░░░░░░░░░  QTabletEvent  ░░░░░░░░░░
QTextBlock  ░░░░░░░░░░  QTextBlockFormat  ░░░░░░░░░░
QTextCharFormat  ░░░░░░░░░░  QTextCursor  ░░░░░░░░░░
QTextDocument  ░░░░░░░░░░  QTextDocumentFragment  ░░░░░░░░░░
QTextFormat  ░░░░░░░░░░  QTextFrame  ░░░░░░░░░░
QTextLayout  ░░░░░░░░░░  QTextLine  ░░░░░░░░░░
QTextList  ░░░░░░░░░░  QTextObject  ░░░░░░░░░░
QTextTable  ░░░░░░░░░░  QTouchEvent  ░░░░░░░░░░
QVector2D  ░░░░░░░░░░  QVector3D  ░░░░░░░░░░
QVector4D  ░░░░░░░░░░  QVulkanInstance  ░░░░░░░░░░
QVulkanWindow  ░░░░░░░░░░  QWhatsThisClickedEvent  ░░░░░░░░░░
QWindow  ░░░░░░░░░░  QWindowStateChangeEvent  ░░░░░░░░░░
```
## 说明

- 信号基类（`QSignal` 及 `QSignalUnit/Int64/Bool/Int64Int64/String/Float64`）位于 `src/gui/signals.cj`，作为各组件信号封装的基础。
- 渐变类（`QGradient` 及 `QLinearGradient/QRadialGradient/QConicalGradient`）已完成基础创建接口，颜色/停靠点等接口待补充。
- 事件类（`QKeyEvent/QMouseEvent/QWheelEvent` 等）以事件透传为主，部分取值接口待补充。
- `QValidator` 为校验器基类，`QDoubleValidator` 已完成较完整的接口（含多个信号）。
- 剩余 QtGui 类（文本排版、图像、OpenGL、打印、触控等）按后续需求优先级逐步封装。
