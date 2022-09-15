package qt.widgets

//foreign func 
foreign func nativeGraphicsRectItemCreateWithXYWH(
    x: Float64,
    y: Float64,
    width: Float64,
    height: Float64,
    parentPtr: Int64
): Int64
foreign func nativeGraphicsRectItemCreateWithRect(rectPtr: Int64, parentPtr: Int64): Int64
foreign func nativeGraphicsRectItemCreate(parentPtr: Int64): Int64
foreign func nativeGraphicsRectItemDelete(ptr: Int64): Unit
foreign func nativeGraphicsRectItemRect(ptr: Int64): Int64
foreign func nativeGraphicsRectItemSetRectWithRect(ptr: Int64, rectanglePtr: Int64): Unit
foreign func nativeGraphicsRectItemSetRect(ptr: Int64, x: Float64, y: Float64, width: Float64, height: Float64): Unit

public open class QGraphicsRectItem <: QAbstractGraphicsShapeItem {
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsRectItemCreate(parent.ptr)
            }
        )
    }
    public init(x: Float64, y: Float64, width: Float64, height: Float64, parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsRectItemCreateWithXYWH(x, y, width, height, parent.ptr)
            }
        )
    }
    public init(rect: QRectF, parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsRectItemCreateWithRect(rect.ptr, parent.ptr)
            }
        )
    }
    public open override func delete() {
        unsafe { nativeGraphicsRectItemDelete(this.ptr) }
    }
    public func rect(): QRectF {
        let rectFPtr = unsafe { nativeGraphicsRectItemRect(this.ptr) }
        return QRectF(rectFPtr)
    }
    public func setRect(rectangle: QRectF): Unit {
        unsafe { nativeGraphicsRectItemSetRectWithRect(this.ptr, rectangle.ptr) }
    }
    public func setRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe { nativeGraphicsRectItemSetRect(this.ptr, x, y, width, height) }
    }
}
