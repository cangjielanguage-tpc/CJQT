package qt

foreign func nativeApplicationCreate(): Int64
foreign func nativeApplicationExec(ptr: Int64): Bool
foreign func nativeApplicationDelete(ptr: Int64): Unit

public class QApplication {
    let ptr: Int64
    public init() {
        ptr = unsafe {
            nativeApplicationCreate()
        }
    }

    public func exec(): Bool {
        return unsafe {
            nativeApplicationExec(ptr)
        }
    }

    public func delete() {
        unsafe {
            nativeApplicationDelete(ptr)
        }
    }
}
