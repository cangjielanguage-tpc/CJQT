package qt.core

//foreign function
foreign func nativeObjectCreate(parentPtr: Int64): Int64
foreign func nativeObjectDelete(ptr: Int64): Unit

public open class QObject {
    public let ptr: Int64
    public init(ptr: Int64) {
        unsafe {
            this.ptr = ptr
        }
    }
    public init(parent!: QObject=QObject(0)) {
        unsafe {
            this.ptr = if (parent.ptr != 0) {
                unsafe { nativeObjectCreate(0) }
            } else {
                unsafe { nativeObjectCreate(parent.ptr) }
            }
        }
    }
    public open func delete(): Unit {
        unsafe { nativeObjectDelete(this.ptr) }
    }
}
