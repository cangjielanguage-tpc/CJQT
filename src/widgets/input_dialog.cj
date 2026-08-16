package cjqt.widgets

foreign func nativeInputDialogGetText(parentPtr: Int64, title: CString, label: CString, text: CString): CString
foreign func nativeInputDialogGetInt(parentPtr: Int64, title: CString, label: CString, value: Int32, min: Int32, max: Int32): Int32
foreign func nativeInputDialogGetDouble(parentPtr: Int64, title: CString, label: CString, value: Float64, min: Float64, max: Float64): Float64

public class QInputDialog {
    public static func getText(
        parent: QWidget,
        title: String,
        label: String,
        text!: String = ""
    ): String {
        return unsafe {
            let t = LibC.mallocCString(title)
            let l = LibC.mallocCString(label)
            let s = LibC.mallocCString(text)
            let r = nativeInputDialogGetText(parent.ptr, t, l, s).toString()
            LibC.free(t)
            LibC.free(l)
            LibC.free(s)
            r
        }
    }

    public static func getInt(
        parent: QWidget,
        title: String,
        label: String,
        value: Int64,
        min: Int64,
        max: Int64
    ): Int64 {
        return Int64(unsafe {
            let t = LibC.mallocCString(title)
            let l = LibC.mallocCString(label)
            let r = nativeInputDialogGetInt(parent.ptr, t, l, Int32(value), Int32(min), Int32(max))
            LibC.free(t)
            LibC.free(l)
            r
        })
    }

    public static func getDouble(
        parent: QWidget,
        title: String,
        label: String,
        value: Float64,
        min: Float64,
        max: Float64
    ): Float64 {
        return unsafe {
            let t = LibC.mallocCString(title)
            let l = LibC.mallocCString(label)
            let r = nativeInputDialogGetDouble(parent.ptr, t, l, value, min, max)
            LibC.free(t)
            LibC.free(l)
            r
        }
    }
}
