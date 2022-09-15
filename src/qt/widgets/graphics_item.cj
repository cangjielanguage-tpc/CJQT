package qt.widgets

//foreign function
foreign func nativeGraphicsItemCreate(parentPtr: Int64): Int64
foreign func nativeGraphicsItemDelete(ptr: Int64): Unit

public open class QGraphicsItem {
    public let ptr: Int64
    public init(ptr: Int64) {
        this.ptr = ptr
    }
    public init(parent!: QGraphicsItem = QGraphicsItem(0)) {
        this.ptr = unsafe {
            nativeGraphicsItemCreate(parent.ptr)
        }
    }
    public open func delete(): Unit {
        unsafe { nativeGraphicsItemDelete(this.ptr) }
    }
}
