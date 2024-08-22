package cjqt.qt.core

foreign func nativeStringListCreate(): Int64
foreign func nativeStringListDelete(ptr: Int64): Unit
foreign func nativeStringListAppend(ptr: Int64, data: CString): Unit

public class QStringList {
    public let ptr: Int64

    public init(ptr!: Int64 = 0) {
        if (ptr == 0) {
            this.ptr = unsafe {
                nativeStringListCreate()
            }
        } else {
            this.ptr = ptr
        }
    }

    protected func delete() {
        unsafe {
            nativeStringListDelete(ptr)
        }
    }

    public func append(data: String) {
        unsafe {
            nativeStringListAppend(ptr, LibC.mallocCString(data))
        }
    }
}
