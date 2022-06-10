package qt

from std import ffi.c.CString

foreign func nativeQmlApplicationAngineCreate(): Int64
foreign func nativeQmlApplicationAngineLoadData(ptr: Int64, data: CString): Unit
foreign func nativeQmlApplicationAngineLoadUrl(ptr: Int64, urlPtr: Int64): Unit
foreign func nativeQmlApplicationAngineDelete(ptr: Int64): Unit

public class QQmlApplicationAngine {
    let ptr: Int64
    public init() {
        ptr = unsafe {
            nativeQmlApplicationAngineCreate()
        }
    }

    public func loadData(data: String): Unit {
        return unsafe {
            nativeQmlApplicationAngineLoadData(ptr, CString(data))
        }
    }

    public func loadUrl(url: QUrl): Unit {
        return unsafe {
            nativeQmlApplicationAngineLoadUrl(ptr, url.ptr)
        }
    }

    public func loadUrl(url: String): Unit {
        return unsafe {
            nativeQmlApplicationAngineLoadUrl(ptr, QUrl(url).ptr)
        }
    }

    public func delete() {
        unsafe {
            nativeQmlApplicationAngineDelete(ptr)
        }
    }
}
