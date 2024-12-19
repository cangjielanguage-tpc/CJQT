package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

//foreign function
foreign func nativeGraphicsViewCreateWithScene(scenePtr: Int64, parentPtr: Int64): Int64
foreign func nativeGraphicsViewCreate(parentPtr: Int64): Int64
foreign func nativeGraphicsViewDelete(ptr: Int64): Unit
foreign func nativeGraphicsViewAlignment(ptr: Int64): Int16
foreign func nativeGraphicsViewSetAlignment(ptr: Int64, lag: Int16): Unit
foreign func nativeGraphicsViewBackgroundBrush(ptr: Int64): Int64
foreign func nativeGraphicsViewSetBackgroundBrush(ptr: Int64, brushPtr: Int64): Unit
foreign func nativeGraphicsViewCacheMode(ptr: Int64): Int16
foreign func nativeGraphicsViewSetCacheMode(ptr: Int64, chcheMode: Int16): Unit
foreign func nativeGraphicsViewCenterOn(ptr: Int64, posPtr: Int64): Unit
foreign func nativeGraphicsViewCenterOnWithXY(ptr: Int64, x: Float64, y: Float64): Unit
foreign func nativeGraphicsViewCenterOnWithItem(ptr: Int64, itemPtr: Int64): Unit
foreign func nativeGraphicsViewDragMode(ptr: Int64): Int32
foreign func nativeGraphicsViewSetDragMode(ptr: Int64, dragMode: Int32): Unit
foreign func nativeGraphicsViewEnsureVisibleWithRect(ptr: Int64, rectPtr: Int64, xmargin: Int32, ymargin: Int32): Unit
foreign func nativeGraphicsViewEnsureVisible(
    ptr: Int64,
    x: Float64,
    y: Float64,
    w: Float64,
    h: Float64,
    xmargin: Int32,
    ymargin: Int32
): Unit
foreign func nativeGraphicsViewEnsureVisibleWithItem(ptr: Int64, itemPtr: Int64, xmargin: Int32, ymargin: Int32): Unit
foreign func nativeGraphicsViewFitlnViewWithRect(ptr: Int64, rectPtr: Int64, aspectRatioMode: Int32): Unit
foreign func nativeGraphicsViewFitlnView(
    ptr: Int64,
    x: Float64,
    y: Float64,
    w: Float64,
    h: Float64,
    aspectRatioMode: Int32
): Unit
foreign func nativeGraphicsViewFitlnViewWithItem(ptr: Int64, itemPtr: Int64, aspectRatioMode: Int32): Unit
foreign func nativeGraphicsViewForegroundBrush(ptr: Int64): Int64
foreign func nativeGraphicsViewSetForegroundBrush(ptr: Int64, brushPtr: Int64): Unit
foreign func nativeGraphicsViewIsInteractive(ptr: Int64): Bool
foreign func nativeGraphicsViewSetInteractive(ptr: Int64, allowed: Bool): Unit
foreign func nativeGraphicsViewIsTransformed(ptr: Int64): Bool
foreign func nativeGraphicsViewSetTransform(ptr: Int64, matrixPtr: Int64, combine: Bool): Unit
foreign func nativeGraphicsViewSetTransformationAnchor(ptr: Int64, anchor: Int32): Unit
foreign func nativeGraphicsViewItemAtWithPoint(ptr: Int64, posPtr: Int64): Int64
foreign func nativeGraphicsViewItemAtWithXY(ptr: Int64, x: Int32, y: Int32): Int64
foreign func nativeGraphicsViewMapFromScene(ptr: Int64, pointFPtr: Int64): Int64
foreign func nativeGraphicsViewMapFromSceneWithRectF(ptr: Int64, rectFPt: Int64): Int64
foreign func nativeGraphicsViewMapFromSceneWithPolygonF(ptr: Int64, polygonFPtr: Int64): Int64
foreign func nativeGraphicsViewMapFromSceneWithPainterPath(ptr: Int64, painterPathPtr: Int64): Int64
foreign func nativeGraphicsViewMapFromSceneWithXY(ptr: Int64, x: Float64, y: Float64): QPoint
foreign func nativeGraphicsViewMapFromSceneWithXYWH(ptr: Int64, x: Float64, y: Float64, w: Float64, h: Float64): Int64
foreign func nativeGraphicsViewMapToScene(ptr: Int64, pointPtr: Int64): Int64
// foreign func nativeGraphicsViewMapToSceneWithRect(ptr: Int64, rectPtr: Int64): Int64
foreign func nativeGraphicsViewMapToSceneWithPolygon(ptr: Int64, polygonPtr: Int64): Int64
foreign func nativeGraphicsViewMapToSceneWithPainterPath(ptr: Int64, painterPathPtr: Int64): Int64
foreign func nativeGraphicsViewMapToSceneWithXY(ptr: Int64, x: Int32, y: Int32): QPointF
foreign func nativeGraphicsViewMapToSceneWithXYWH(ptr: Int64, x: Int32, y: Int32, w: Int32, h: Int32): Int64
foreign func nativeGraphicsViewOptimizationFlags(ptr: Int64): Int16
foreign func nativeGraphicsViewSetOptimizationFlag(ptr: Int64, flag: Int16, enabled: Bool): Unit
foreign func nativeGraphicsViewSetOptimizationFlags(ptr: Int64, flag: Int16): Unit
foreign func nativeGraphicsViewRender(
    ptr: Int64,
    painterPtr: Int64,
    targetPtr: Int64,
    sourcePtr: Int64,
    aspectRatioMode: Int32
): Unit
foreign func nativeGraphicsViewRenderHints(ptr: Int64): Int16
foreign func nativeGraphicsViewSetRenderHint(ptr: Int64, hint: Int16, enabled: Bool): Unit
foreign func nativeGraphicsViewSetRenderHints(ptr: Int64, hint: Int16): Unit
foreign func nativeGraphicsViewResetCachedContent(ptr: Int64): Unit
foreign func nativeGraphicsViewResetTransform(ptr: Int64): Unit
foreign func nativeGraphicsViewResizeAnchor(ptr: Int64): Int16
foreign func nativeGraphicsViewSetResizeAnchor(ptr: Int64, anchor: Int32): Unit
foreign func nativeGraphicsViewRotate(ptr: Int64, angle: Float64): Unit
foreign func nativeGraphicsViewRubberBandRect(ptr: Int64): Int64
foreign func nativeGraphicsViewRubberBandSelectionMode(ptr: Int64): Int16
foreign func nativeGraphicsViewSetRubberBandSelectionMode(ptr: Int64, selectionMode: Int16): Unit
foreign func nativeGraphicsViewScale(ptr: Int64, sx: Float64, sy: Float64): Unit
foreign func nativeGraphicsViewScene(ptr: Int64): Int64
foreign func nativeGraphicsViewSetScene(ptr: Int64, scenePtr: Int64): Unit
foreign func nativeGraphicsViewSceneRect(ptr: Int64): QRectF
foreign func nativeGraphicsViewSetSceneRectWithRect(ptr: Int64, rectFPtr: Int64): Unit
foreign func nativeGraphicsViewSetSceneRect(ptr: Int64, x: Float64, y: Float64, w: Float64, h: Float64): Unit
foreign func nativeGraphicsViewSetViewportUpdateMode(ptr: Int64, updateMode: Int32): Unit
foreign func nativeGraphicsViewShear(ptr: Int64, sh: Float64, sv: Float64): Unit
foreign func nativeGraphicsViewTransform(ptr: Int64): Int64
foreign func nativeGraphicsViewTransformationAnchor(ptr: Int64): Int32
foreign func nativeGraphicsViewTranslate(ptr: Int64, dx: Float64, dy: Float64): Unit
foreign func nativeGraphicsViewViewportTransform(ptr: Int64): Int64
foreign func nativeGraphicsViewViewportUpdateMode(ptr: Int64): Int32

//Enum 
public enum QGraphicsViewCacheMode {
    CacheNone | CacheBackground

    public func value(): Int16 {
        match (this) {
            case CacheNone => 0x0
            case CacheBackground => 0x1
        }
    }

    public static func convert(value: Int16): QGraphicsViewCacheMode {
        match (value) {
            case 0x0 => CacheNone
            case 0x1 => CacheBackground
            case _ => CacheNone
        }
    }
}
public enum QGraphicsViewDragMode {
    NoDrag | ScrollHandOrag | RubberBandDrag

    public func value(): Int32 {
        match (this) {
            case NoDrag => 0
            case ScrollHandOrag => 1
            case RubberBandDrag => 2
        }
    }

    public static func convert(value: Int32): QGraphicsViewDragMode {
        match (value) {
            case 0 => NoDrag
            case 1 => ScrollHandOrag
            case 2 => RubberBandDrag
            case _ => NoDrag
        }
    }
}

public enum QGraphicsViewViewportAnchor {
    NoAnchor | AnchorViewCenter | AnchorUnderMouse

    public func value(): Int32 {
        match (this) {
            case NoAnchor => 0
            case AnchorViewCenter => 1
            case AnchorUnderMouse => 2
        }
    }

    public static func convert(value: Int32): QGraphicsViewViewportAnchor {
        match (value) {
            case 0 => NoAnchor
            case 1 => AnchorViewCenter
            case 2 => AnchorUnderMouse
            case _ => NoAnchor
        }
    }
}

public open class QGraphicsView <: QAbstractScrollArea {
    public init(parent!: QWidget = QWidget(0)) {
        super(unsafe { nativeGraphicsViewCreate(parent.ptr) })
    }
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(scene: QGraphicsScene, parent!: QWidget = QWidget(0)) {
        super(unsafe { nativeGraphicsViewCreateWithScene(scene.ptr, parent.ptr) })
    }

    public open override func delete(): Unit {
        unsafe { nativeGraphicsViewDelete(this.ptr) }
    }

    public func alignment(): Alignment {
        let alignment = unsafe {
            nativeGraphicsViewAlignment(this.ptr)
        }
        return Alignment.convert(alignment)
    }
    public func setAlignment(alignment: Alignment): Unit {
        unsafe {
            nativeGraphicsViewSetAlignment(this.ptr, alignment.value())
        }
    }
    public func backgroundBrush(): QBrush {
        let brushPtr = unsafe {
            nativeGraphicsViewBackgroundBrush(this.ptr)
        }
        return QBrush(brushPtr)
    }
    public func setBackgroundBrush(brush: QBrush): Unit {
        unsafe {
            nativeGraphicsViewSetBackgroundBrush(this.ptr, brush.ptr)
        }
    }
    public func cacheMode(): QGraphicsViewCacheMode {
        let cacheMode = unsafe {
            nativeGraphicsViewCacheMode(this.ptr)
        }
        return QGraphicsViewCacheMode.convert(cacheMode)
    }
    public func setCacheMode(cacheMode: QGraphicsViewCacheMode): Unit {
        unsafe {
            nativeGraphicsViewSetCacheMode(this.ptr, cacheMode.value())
        }
    }
    public func centerOn(pos: QPointF): Unit {
        unsafe {
            nativeGraphicsViewCenterOnWithXY(this.ptr, pos.x,pos.y)
        }
    }
    public func centerOn(x: Float64, y: Float64): Unit {
        unsafe {
            nativeGraphicsViewCenterOnWithXY(this.ptr, x, y)
        }
    }
    public func centerOn(item: QGraphicsItem): Unit {
        unsafe {
            nativeGraphicsViewCenterOnWithItem(this.ptr, item.ptr)
        }
    }
    public func dragMode(): QGraphicsViewDragMode {
        let dragMode = unsafe {
            nativeGraphicsViewDragMode(this.ptr)
        }
        return QGraphicsViewDragMode.convert(dragMode)
    }
    public func setDragMode(dragMode: QGraphicsViewDragMode): Unit {
        unsafe {
            nativeGraphicsViewSetDragMode(this.ptr, dragMode.value())
        }
    }
    public func ensureVisible(rect: QRectF, xmargin!: Int64 = 50, ymargin!: Int64 = 50): Unit {
        unsafe {
            nativeGraphicsViewEnsureVisible(this.ptr, rect.x,rect.y,rect.width,rect.height, Int32(xmargin), Int32(ymargin))
        }
    }

    public func ensureVisible(
        x: Float64,
        y: Float64,
        w: Float64,
        h: Float64,
        xmargin!: Int64 = 50,
        ymargin!: Int64 = 50
    ): Unit {
        unsafe {
            nativeGraphicsViewEnsureVisible(this.ptr, x, y, w, h, Int32(xmargin), Int32(ymargin))
        }
    }
    public func ensureVisible(
        item: QGraphicsItem,
        xmargin!: Int64 = 50,
        ymargin!: Int64 = 50
    ): Unit {
        unsafe {
            nativeGraphicsViewEnsureVisibleWithItem(this.ptr, item.ptr, Int32(xmargin), Int32(ymargin))
        }
    }

    public func fitlnView(rect: QRectF, aspectRatioMode!: AspectRatioMode = AspectRatioMode.IgnoreAspectRatio): Unit {
        unsafe { nativeGraphicsViewFitlnView(this.ptr, rect.x,rect.y,rect.width,rect.height, aspectRatioMode.value()) }
    }
    public func fitlnView(
        x: Float64,
        y: Float64,
        w: Float64,
        h: Float64,
        aspectRatioMode!: AspectRatioMode = AspectRatioMode.IgnoreAspectRatio
    ): Unit {
        unsafe { nativeGraphicsViewFitlnView(this.ptr, x, y, w, h, aspectRatioMode.value()) }
    }

    public func fitlnView(item: QGraphicsItem, aspectRatioMode!: AspectRatioMode = AspectRatioMode.IgnoreAspectRatio): Unit {
        unsafe { nativeGraphicsViewFitlnViewWithItem(this.ptr, item.ptr, aspectRatioMode.value()) }
    }

    public func foregroundBrush(): QBrush {
        let brushPtr = unsafe {
            nativeGraphicsViewForegroundBrush(this.ptr)
        }
        return QBrush(brushPtr)
    }
    public func setForegroundBrush(brush: QBrush): Unit {
        unsafe {
            nativeGraphicsViewSetForegroundBrush(this.ptr, brush.ptr)
        }
    }
    public func isInteractive(): Bool {
        return unsafe { nativeGraphicsViewIsInteractive(this.ptr) }
    }
    public func setInteractiv(allowed: Bool): Unit {
        unsafe { nativeGraphicsViewSetInteractive(this.ptr, allowed) }
    }

    public func isTransformed(): Bool {
        return unsafe { nativeGraphicsViewIsTransformed(this.ptr) }
    }
    public func setTransform(matrix: QTransform, combine!: Bool = false): Unit {
        unsafe { nativeGraphicsViewSetTransform(this.ptr, matrix.ptr, combine) }
    }
    public func setTransformationAnchor(anchor: QGraphicsViewViewportAnchor): Unit {
        unsafe { nativeGraphicsViewSetTransformationAnchor(this.ptr, anchor.value()) }
    }
    public func itemAt(pos: QPoint): QGraphicsItem {
        let itemPtr = unsafe {
            nativeGraphicsViewItemAtWithXY(this.ptr, pos.x, pos.y)
        }
        return QGraphicsItem(itemPtr)
    }
    public func itemAt(x: Int64, y: Int64): QGraphicsItem {
        let itemPtr = unsafe {
            nativeGraphicsViewItemAtWithXY(this.ptr, Int32(x), Int32(y))
        }
        return QGraphicsItem(itemPtr)
    }
    public func mapFromScene(point: QPointF): QPoint {
        let pointF = unsafe {
            nativeGraphicsViewMapFromSceneWithXY(this.ptr, point.x, point.y)
        }
        return pointF
    }
    public func mapFromScene(rect: QRectF): QPolygon {
        let polygongPtr = unsafe {
            nativeGraphicsViewMapFromSceneWithXYWH(this.ptr, rect.x, rect.y, rect.width, rect.height)
        }
        return QPolygon(polygongPtr)
    }
    public func mapFromScene(polygon: QPolygonF): QPolygon {
        let polygongPtr = unsafe {
            nativeGraphicsViewMapFromSceneWithPolygonF(this.ptr, polygon.ptr)
        }
        return QPolygon(polygongPtr)
    }
    public func mapFromScene(x: Float64, y: Float64): QPoint {
        let point= unsafe {
            nativeGraphicsViewMapFromSceneWithXY(this.ptr, x, y)
        }
        return point
    }
    public func mapFromScene(x: Float64, y: Float64, w: Float64, h: Float64): QPolygon {
        let polygongPtr = unsafe {
            nativeGraphicsViewMapFromSceneWithXYWH(this.ptr, x, y, w, h)
        }
        return QPolygon(polygongPtr)
    }

    public func mapToScene(point: QPoint): QPointF {
        let pointF = unsafe {
            nativeGraphicsViewMapToSceneWithXY(this.ptr, point.x,point.y)
        }
        return pointF
    }
    public func mapToScene(rect: QRect): QPolygonF {
        let polygonFPtr = unsafe {
            nativeGraphicsViewMapToSceneWithXYWH(this.ptr, rect.x,rect.y,rect.width,rect.height)
        }
        return QPolygonF(polygonFPtr)
    }
    public func mapToScene(polygon: QPolygon): QPolygonF {
        let polygonFPtr = unsafe {
            nativeGraphicsViewMapToSceneWithPolygon(this.ptr, polygon.ptr)
        }
        return QPolygonF(polygonFPtr)
    }
    public func mapToScene(x: Int64, y: Int64): QPointF {
        let pointF = unsafe {
            nativeGraphicsViewMapToSceneWithXY(this.ptr, Int32(x), Int32(y))
        }
        return pointF
    }
    public func mapToScene(x: Int64, y: Int64, w: Int64, h: Int64): QPolygonF {
        let polygonFPtr = unsafe {
            nativeGraphicsViewMapToSceneWithXYWH(this.ptr, Int32(x), Int32(y), Int32(w), Int32(h))
        }
        return QPolygonF(polygonFPtr)
    }
    public func scene(): QGraphicsScene {
        let scenePtr = unsafe { nativeGraphicsViewScene(this.ptr) }
        return QGraphicsScene(scenePtr)
    }
    public func sceneRect(): QRectF {
        let rectF = unsafe { nativeGraphicsViewSceneRect(this.ptr) }
        return rectF
    }
    public func setScene(scene: QGraphicsScene): Unit {
        unsafe { nativeGraphicsViewSetScene(this.ptr, scene.ptr) }
    }
    public func setSceneRect(rect: QRectF): Unit {
        unsafe { nativeGraphicsViewSetSceneRect(this.ptr, rect.x, rect.y, rect.width, rect.height) }
    }
    public func setSceneRect(x: Float64, y: Float64, w: Float64, h: Float64): Unit {
        unsafe { nativeGraphicsViewSetSceneRect(this.ptr, x, y, w, h) }
    }
}
//foreign func nativeGraphicsViewMapFromSceneWithPainterPath(ptr: Int64, painterPathPtr: Int64): Int64
//foreign func nativeGraphicsViewMapToSceneWithPainterPath(ptr: Int64, painterPathPtr: Int64): Int64
/***************
foreign func nativeGraphicsViewOptimizationFlags(ptr: Int64): Int16
foreign func nativeGraphicsViewSetOptimizationFlag(ptr: Int64, flag: Int16, enabled: Bool): Unit
foreign func nativeGraphicsViewSetOptimizationFlags(ptr: Int64, flag: Int16): Unit
foreign func nativeGraphicsViewRender(
    ptr: Int64,
    painterPtr: Int64,
    targetPtr: Int64,
    sourcePtr: Int64,
    aspectRatioMode: Int32
): Unit
foreign func nativeGraphicsViewRenderHints(ptr: Int64): Int16
foreign func nativeGraphicsViewSetRenderHint(ptr: Int64, hint: Int16, enabled: Bool): Unit
foreign func nativeGraphicsViewSetRenderHints(ptr: Int64, hint: Int16): Unit
foreign func nativeGraphicsViewResetCachedContent(ptr: Int64): Unit
foreign func nativeGraphicsViewResetTransform(ptr: Int64): Unit
foreign func nativeGraphicsViewResizeAnchor(ptr: Int64): Int16
foreign func nativeGraphicsViewSetResizeAnchor(ptr: Int64, anchor: Int32): Unit
foreign func nativeGraphicsViewRotate(ptr: Int64, angle: Float64): Unit
foreign func nativeGraphicsViewRubberBandRect(ptr: Int64): Int64
foreign func nativeGraphicsViewRubberBandSelectionMode(ptr: Int64): Int16
foreign func nativeGraphicsViewSetRubberBandSelectionMode(ptr: Int64, selectionMode: Int16): Unit
foreign func nativeGraphicsViewScale(ptr: Int64, sx: Float64, sy: Float64): Unit
************************/
/********************
foreign func nativeGraphicsViewSetViewportUpdateMode(ptr: Int64, updateMode: Int32): Unit
foreign func nativeGraphicsViewShear(ptr: Int64, sh: Float64, sv: Float64): Unit
foreign func nativeGraphicsViewTransform(ptr: Int64): Int64
foreign func nativeGraphicsViewTransformationAnchor(ptr: Int64): Int32
foreign func nativeGraphicsViewTranslate(ptr: Int64, dx: Float64, dy: Float64): Unit
foreign func nativeGraphicsViewViewportTransform(ptr: Int64): Int64
foreign func nativeGraphicsViewViewportUpdateMode(ptr: Int64): Int32
***********************/
