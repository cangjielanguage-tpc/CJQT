package cjqt.core

foreign func nativeStringListCreate(): Int64
foreign func nativeStringListDelete(ptr: Int64): Unit
foreign func nativeStringListAppend(ptr: Int64, data: CString): Unit
foreign func nativeStringListCount(ptr: Int64): Int32
foreign func nativeStringListAt(ptr: Int64, index: Int32): CString
foreign func nativeStringListIsEmpty(ptr: Int64): Bool
foreign func nativeStringListClear(ptr: Int64): Unit

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

    public func append(data: String): QStringList {
        unsafe {
            let d = LibC.mallocCString(data)
            nativeStringListAppend(ptr, d)
            LibC.free(d)
        }
        return this
    }

    public func count(): Int64 {
        return Int64(unsafe {
            nativeStringListCount(ptr)
        })
    }

    public func size(): Int64 {
        return count()
    }

    public func isEmpty(): Bool {
        return unsafe {
            nativeStringListIsEmpty(ptr)
        }
    }

    public func at(index: Int64): String {
        return unsafe {
            nativeStringListAt(ptr, Int32(index)).toString()
        }
    }

    public func clear(): Unit {
        unsafe {
            nativeStringListClear(ptr)
        }
    }
}
