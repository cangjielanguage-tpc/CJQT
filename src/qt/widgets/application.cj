package qt.widgets

foreign func nativeApplicationCreate(): Int64
foreign func nativeApplicationExec(ptr: Int64): Bool
foreign func nativeApplicationDelete(ptr: Int64): Unit

public class QApplication {
    static public var ptr: Int64 = 0
    static public func create() {
        ptr = unsafe {
            nativeApplicationCreate()
        }
    }

    static public func exec(): Bool {
        if (ptr != 0) {
            return unsafe {
                nativeApplicationExec(ptr)
            }
        }
        return false
    }

    static public func delete() {
        if (ptr != 0) {
            unsafe {
                nativeApplicationDelete(ptr)
            }
        }
    }
}
