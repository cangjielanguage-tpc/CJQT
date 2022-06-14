package qt

foreign func nativeApplicationCreate(): Int64
foreign func nativeApplicationExec(ptr: Int64): Bool
foreign func nativeApplicationDelete(ptr: Int64): Unit

public class QApplication {
    static var ptr: Int64 = 0
    public init() {
        ptr = unsafe {
            nativeApplicationCreate()
        }
    }

    public static func exec(): Bool {
        return unsafe {
            nativeApplicationExec(ptr)
        }
    }

    public static func delete() {
        unsafe {
            nativeApplicationDelete(ptr)
        }
    }
}
