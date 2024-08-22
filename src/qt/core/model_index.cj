package cjqt.qt.core

foreign func nativeModelIndexCreate(): Int64
foreign func nativeModelIndexDelete(ptr: Int64): Unit
foreign func nativeModelIndexRow(ptr: Int64): Int32
foreign func nativeModelIndexColumn(ptr: Int64): Int32
foreign func nativeModelIndexIsValid(ptr: Int64): Bool

public open class QModelIndex {
    public let ptr: Int64

    public init() {
        this.ptr = unsafe {
            nativeModelIndexCreate()
        }
    }

    public init(ptr:Int64){
        this.ptr=ptr
    }

    public open func delete(): Unit {
        return unsafe {
            nativeModelIndexDelete(this.ptr)
        }
    }

    public func row(): Int32 {
        return unsafe {
            nativeModelIndexRow(this.ptr)
        }
    }

    public func column(): Int32 {
        return unsafe {
            nativeModelIndexColumn(this.ptr)
        }
    }

    public func isValid(): Bool {
        return unsafe {
            nativeModelIndexIsValid(this.ptr)
        }
    }
}