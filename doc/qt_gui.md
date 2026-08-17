# QGui 封装进度

> 适配版本：Cangjie 1.0.5 / Qt 5.14.2
>
> 统计说明：`▓` 表示已完成（满格 10 格为 100%），`░` 表示尚未移植。
> 每类均包含 native C 绑定（`native/src/gui/`）、仓颉封装（`src/gui/`）与单元测试。
> 注：`QPainter` 为 QtGui 类，其仓颉封装位于 `cjqt.widgets` 包（`src/widgets/painter.cj`）。

## 进度总览

| 分类 | 数量 |
| :--- | :--- |
| 已完成 | 72 |
| 未移植 | 50+（多为平台图形/无障碍等内部类） |

## 已完成

```
QGui:

QBrush                    ▓▓▓▓▓▓▓▓▓▓         QClipboard                ▓▓▓▓▓▓▓▓▓▓
QCloseEvent               ▓▓▓▓▓▓▓▓▓▓         QColor                    ▓▓▓▓▓▓▓▓▓▓
QColorSpace               ▓▓▓▓▓▓▓▓▓▓         QConicalGradient          ▓▓▓▓▓▓▓▓▓▓
QContextMenuEvent         ▓▓▓▓▓▓▓▓▓▓         QCursor                   ▓▓▓▓▓▓▓▓▓▓
QDesktopServices          ▓▓▓▓▓▓▓▓▓▓         QDoubleValidator          ▓▓▓▓▓▓▓▓▓▓
QDrag                     ▓▓▓▓▓▓▓▓▓▓         QDragEnterEvent           ▓▓▓▓▓▓▓▓▓▓
QDragLeaveEvent           ▓▓▓▓▓▓▓▓▓▓         QDragMoveEvent            ▓▓▓▓▓▓▓▓▓▓
QDropEvent                ▓▓▓▓▓▓▓▓▓▓         QFocusEvent               ▓▓▓▓▓▓▓▓▓▓
QFont                     ▓▓▓▓▓▓▓▓▓▓         QFontDatabase             ▓▓▓▓▓▓▓▓▓▓
QFontInfo                 ▓▓▓▓▓▓▓▓▓▓         QFontMetrics              ▓▓▓▓▓▓▓▓▓▓
QFontMetricsF             ▓▓▓▓▓▓▓▓▓▓         QGradient                 ▓▓▓▓▓▓▓▓▓▓
QGuiApplication           ▓▓▓▓▓▓▓▓▓▓         QHideEvent                ▓▓▓▓▓▓▓▓▓▓
QHoverEvent               ▓▓▓▓▓▓▓▓▓▓         QIcon                     ▓▓▓▓▓▓▓▓▓▓
QImage                    ▓▓▓▓▓▓▓▓▓▓         QImageReader              ▓▓▓▓▓▓▓▓▓▓
QImageWriter              ▓▓▓▓▓▓▓▓▓▓         QInputMethod              ▓▓▓▓▓▓▓▓▓▓
QInputMethodEvent         ▓▓▓▓▓▓▓▓▓▓         QIntValidator             ▓▓▓▓▓▓▓▓▓▓
QKeyEvent                 ▓▓▓▓▓▓▓▓▓▓         QKeySequence              ▓▓▓▓▓▓▓▓▓▓
QLinearGradient           ▓▓▓▓▓▓▓▓▓▓         QMouseEvent               ▓▓▓▓▓▓▓▓▓▓
QMoveEvent                ▓▓▓▓▓▓▓▓▓▓         QMovie                    ▓▓▓▓▓▓▓▓▓▓
QPainterPath              ▓▓▓▓▓▓▓▓▓▓         QPainterPathStroker       ▓▓▓▓▓▓▓▓▓▓
QPaintersEvent            ▓▓▓▓▓▓▓▓▓▓         QPalette                  ▓▓▓▓▓▓▓▓▓▓
QPdfWriter                ▓▓▓▓▓▓▓▓▓▓         QPen                      ▓▓▓▓▓▓▓▓▓▓
QPicture                  ▓▓▓▓▓▓▓▓▓▓         QPixmap                   ▓▓▓▓▓▓▓▓▓▓
QPixmapCache              ▓▓▓▓▓▓▓▓▓▓         QPolygon                  ▓▓▓▓▓▓▓▓▓▓
QPolygonF                 ▓▓▓▓▓▓▓▓▓▓         QRadialGradient           ▓▓▓▓▓▓▓▓▓▓
QRegion                   ▓▓▓▓▓▓▓▓▓▓         QRegularExpressionValidator▓▓▓▓▓▓▓▓▓▓
QResizeEvent              ▓▓▓▓▓▓▓▓▓▓         QScreen                   ▓▓▓▓▓▓▓▓▓▓
QShowEvent                ▓▓▓▓▓▓▓▓▓▓         QStandardItem             ▓▓▓▓▓▓▓▓▓▓
QStandardItemModel        ▓▓▓▓▓▓▓▓▓▓         QStaticText               ▓▓▓▓▓▓▓▓▓▓
QSurfaceFormat            ▓▓▓▓▓▓▓▓▓▓         QTextBlock                ▓▓▓▓▓▓▓▓▓▓
QTextBlockFormat          ▓▓▓▓▓▓▓▓▓▓         QTextCharFormat           ▓▓▓▓▓▓▓▓▓▓
QTextCursor               ▓▓▓▓▓▓▓▓▓▓         QTextDocument             ▓▓▓▓▓▓▓▓▓▓
QTextDocumentFragment     ▓▓▓▓▓▓▓▓▓▓         QTextFormat               ▓▓▓▓▓▓▓▓▓▓
QTextLayout               ▓▓▓▓▓▓▓▓▓▓         QTextOption               ▓▓▓▓▓▓▓▓▓▓
QTransform                ▓▓▓▓▓▓▓▓▓▓         QValidator                ▓▓▓▓▓▓▓▓▓▓
QWheelEvent               ▓▓▓▓▓▓▓▓▓▓         QWindow                   ▓▓▓▓▓▓▓▓▓▓
```

## 未移植

以下 QtGui 类尚未移植（多为平台图形/无障碍等内部类）：

```
QAbstractTextDocumentLayout ░░░░░░░░░░      QAccessible               ░░░░░░░░░░
QBackingStore             ░░░░░░░░░░         QBitmap                   ░░░░░░░░░░
QColorTransform           ░░░░░░░░░░         QEnterEvent               ░░░░░░░░░░
QEventPoint               ░░░░░░░░░░
QExposeEvent              ░░░░░░░░░░         QFileOpenEvent            ░░░░░░░░░░
QGenericMatrix            ░░░░░░░░░░         QGlyphRun                 ░░░░░░░░░░
QIconEngine               ░░░░░░░░░░         QImageIOHandler           ░░░░░░░░░░
QInputMethodQueryEvent    ░░░░░░░░░░         QNativeGestureEvent       ░░░░░░░░░░
QOffscreenSurface         ░░░░░░░░░░         QOpenGLContext            ░░░░░░░░░░
QOpenGLFunctions          ░░░░░░░░░░         QOpenGLTexture            ░░░░░░░░░░
QPageLayout               ░░░░░░░░░░         QPageRanges               ░░░░░░░░░░
QPageSize                 ░░░░░░░░░░         QPagedPaintDevice         ░░░░░░░░░░
QPaintEngine              ░░░░░░░░░░         QPaintEngineState         ░░░░░░░░░░
QPointerEvent             ░░░░░░░░░░         QPointingDevice           ░░░░░░░░░░
QQuality                  ░░░░░░░░░░         QQuaternion                ░░░░░░░░░░
QRasterWindow             ░░░░░░░░░░         QRawFont                   ░░░░░░░░░░
QRgba64                   ░░░░░░░░░░         QScrollEvent               ░░░░░░░░░░
QSessionManager           ░░░░░░░░░░         QSinglePointEvent          ░░░░░░░░░░
QSurface                  ░░░░░░░░░░         QSyntaxHighlighter         ░░░░░░░░░░
QTabletEvent              ░░░░░░░░░░         QTextFrame                 ░░░░░░░░░░
QTextList                 ░░░░░░░░░░         QTextLine                  ░░░░░░░░░░
QTextObject               ░░░░░░░░░░         QTextTable                 ░░░░░░░░░░
QTouchEvent               ░░░░░░░░░░         QVulkanInstance            ░░░░░░░░░░
QVulkanWindow             ░░░░░░░░░░         QWhatsThisClickedEvent     ░░░░░░░░░░
QWindowStateChangeEvent   ░░░░░░░░░░
```

## 说明

- 信号基类（`QSignal` 及派生类）位于 `src/gui/signals.cj`，作为各组件信号封装基础。
- 渐变类（`QGradient` 及 QLinearGradient/QRadialGradient/QConicalGradient）已移植。
- 事件类（QKeyEvent/QMouseEvent/QWheelEvent/拖拽事件/窗口事件等）以事件透传为主。
- `QOpenGL*`/`QVulkan*` 为平台图形 API，需结合具体平台适配；`QAccessible*` 为无障碍框架；`QPaintEngine*` 为光栅渲染内部实现。此类类在仓颉 GUI 应用中不常用。
