package qt.widgets

foreign func nativeApplicationInit(): Unit
foreign func nativeApplicationExec(): Bool
foreign func nativeApplicationIsCreate(): Bool
foreign func nativeApplicationQuit(): Unit
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

    static public func isCreate(): Bool {
        return unsafe {
            nativeApplicationIsCreate()
        }
    }

    static public func quit() {
        unsafe {
            nativeApplicationQuit()
        }
    }

    static public func delete() {
        unsafe {
            nativeApplicationDelete()
        }
    }
}
