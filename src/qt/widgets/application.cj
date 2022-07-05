package qt.widgets

foreign func nativeApplicationInit(): Unit
foreign func nativeApplicationExec(): Bool
foreign func nativeApplicationDelete(): Unit

public class QApplication {
    static public func create() {
        unsafe {
            nativeApplicationInit()
        }
    }

    static public func exec(): Bool {
        return unsafe {
            nativeApplicationExec()
        }
    }

    static public func delete() {
        unsafe {
            nativeApplicationDelete()
        }
    }
}
