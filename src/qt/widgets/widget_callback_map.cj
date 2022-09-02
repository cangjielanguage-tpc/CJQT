package qt.widgets

import qt.tools.*

public class QWidgetCallbackMap <: QCallbackMap {
    /* let member keyPressEvent */
    public static let keyPressEvent = HashMap<Int64, (QKeyEvent) -> Unit>()
    /* let member paintersEvent */
    public static let paintersEvent = HashMap<Int64, (QPaintersEvent) -> Unit>()
    /* let member mousePressEvent */
    public static let mousePressEvent = HashMap<Int64, (QMouseEvent) -> Unit>()
    /* let member mouseReleaseEvent */
    public static let mouseReleaseEvent = HashMap<Int64, (QMouseEvent) -> Unit>()
    /* let member mouseMoveEvent */
    public static let mouseMoveEvent = HashMap<Int64, (QMouseEvent) -> Unit>()
}