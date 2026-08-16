package cjqt.core

foreign func nativeTranslatorCreate(): Int64
foreign func nativeTranslatorDelete(ptr: Int64): Unit
foreign func nativeTranslatorLoad(ptr: Int64, fileName: CString): Bool
foreign func nativeTranslatorIsEmpty(ptr: Int64): Bool

public class QTranslator {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeTranslatorCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeTranslatorDelete(ptr) }
    }

    public func load(fileName: String): Bool {
        return unsafe {
            let f = LibC.mallocCString(fileName)
            let r = nativeTranslatorLoad(ptr, f)
            LibC.free(f)
            r
        }
    }

    public func isEmpty(): Bool {
        return unsafe { nativeTranslatorIsEmpty(ptr) }
    }
}
