package cjqt.widgets

foreign func nativeProgressDialogCreate(label: CString, cancelText: CString, min: Int32, max: Int32, parentPtr: Int64): Int64
foreign func nativeProgressDialogDelete(ptr: Int64): Unit
foreign func nativeProgressDialogSetValue(ptr: Int64, value: Int32): Unit
foreign func nativeProgressDialogValue(ptr: Int64): Int32
foreign func nativeProgressDialogSetRange(ptr: Int64, min: Int32, max: Int32): Unit
foreign func nativeProgressDialogMinimum(ptr: Int64): Int32
foreign func nativeProgressDialogMaximum(ptr: Int64): Int32
foreign func nativeProgressDialogSetLabelText(ptr: Int64, text: CString): Unit
foreign func nativeProgressDialogLabelText(ptr: Int64): CString
foreign func nativeProgressDialogWasCanceled(ptr: Int64): Bool

public class QProgressDialog <: QWidget {
    public init(label: String, cancelText: String, min: Int64, max: Int64) {
        super(
            unsafe {
                let l = LibC.mallocCString(label)
                let c = LibC.mallocCString(cancelText)
                let r = nativeProgressDialogCreate(l, c, Int32(min), Int32(max), 0)
                LibC.free(l)
                LibC.free(c)
                r
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeProgressDialogDelete(ptr)
        }
    }

    public func setValue(value: Int64) {
        unsafe { nativeProgressDialogSetValue(ptr, Int32(value)) }
    }

    public func value(): Int64 {
        return Int64(unsafe { nativeProgressDialogValue(ptr) })
    }

    public func setRange(min: Int64, max: Int64) {
        unsafe { nativeProgressDialogSetRange(ptr, Int32(min), Int32(max)) }
    }

    public func minimum(): Int64 {
        return Int64(unsafe { nativeProgressDialogMinimum(ptr) })
    }

    public func maximum(): Int64 {
        return Int64(unsafe { nativeProgressDialogMaximum(ptr) })
    }

    public func setLabelText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeProgressDialogSetLabelText(ptr, t)
            LibC.free(t)
        }
    }

    public func labelText(): String {
        return unsafe { nativeProgressDialogLabelText(ptr).toString() }
    }

    public func wasCanceled(): Bool {
        return unsafe { nativeProgressDialogWasCanceled(ptr) }
    }
}
