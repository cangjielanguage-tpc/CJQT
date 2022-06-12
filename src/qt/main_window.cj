package qt

from std import ffi.c.CString

foreign func nativeMainWindowCreate(): Int64
foreign func nativeMainWindowDelete(ptr: Int64): Unit

public class QMainWindow <: QWidget{
    public init() {
        super(unsafe {
            nativeMainWindowCreate()
        })
    }

    public override func delete() {
        unsafe {
            nativeMainWindowDelete(ptr)
        }
    }
}
