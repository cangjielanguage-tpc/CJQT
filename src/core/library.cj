package cjqt.core

foreign func nativeLibraryCreate(fileName: CString): Int64
foreign func nativeLibraryDelete(ptr: Int64): Unit
foreign func nativeLibraryLoad(ptr: Int64): Bool
foreign func nativeLibraryUnload(ptr: Int64): Bool
foreign func nativeLibraryIsLoaded(ptr: Int64): Bool
foreign func nativeLibraryFileName(ptr: Int64): CString
foreign func nativeLibrarySetFileName(ptr: Int64, fileName: CString): Unit

public class QLibrary {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(fileName: String) {
        this.ptr = unsafe {
            let f = LibC.mallocCString(fileName)
            let r = nativeLibraryCreate(f)
            LibC.free(f)
            r
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeLibraryDelete(ptr)
        }
    }

    public func load(): Bool {
        return unsafe {
            nativeLibraryLoad(ptr)
        }
    }

    public func unload(): Bool {
        return unsafe {
            nativeLibraryUnload(ptr)
        }
    }

    public func isLoaded(): Bool {
        return unsafe {
            nativeLibraryIsLoaded(ptr)
        }
    }

    public func fileName(): String {
        return unsafe {
            nativeLibraryFileName(ptr).toString()
        }
    }

    public func setFileName(fileName: String): Unit {
        unsafe {
            let f = LibC.mallocCString(fileName)
            nativeLibrarySetFileName(ptr, f)
            LibC.free(f)
        }
    }
}
