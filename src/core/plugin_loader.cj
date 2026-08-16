package cjqt.core

foreign func nativePluginLoaderCreate(fileName: CString): Int64
foreign func nativePluginLoaderDelete(ptr: Int64): Unit
foreign func nativePluginLoaderLoad(ptr: Int64): Bool
foreign func nativePluginLoaderUnload(ptr: Int64): Bool
foreign func nativePluginLoaderIsLoaded(ptr: Int64): Bool
foreign func nativePluginLoaderFileName(ptr: Int64): CString
foreign func nativePluginLoaderErrorString(ptr: Int64): CString

public class QPluginLoader {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(fileName: String) {
        this.ptr = unsafe {
            let f = LibC.mallocCString(fileName)
            let r = nativePluginLoaderCreate(f)
            LibC.free(f)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativePluginLoaderDelete(ptr) }
    }

    public func load(): Bool {
        return unsafe { nativePluginLoaderLoad(ptr) }
    }

    public func unload(): Bool {
        return unsafe { nativePluginLoaderUnload(ptr) }
    }

    public func isLoaded(): Bool {
        return unsafe { nativePluginLoaderIsLoaded(ptr) }
    }

    public func fileName(): String {
        return unsafe { nativePluginLoaderFileName(ptr).toString() }
    }

    public func errorString(): String {
        return unsafe { nativePluginLoaderErrorString(ptr).toString() }
    }
}
