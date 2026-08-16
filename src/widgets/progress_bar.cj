package cjqt.widgets

foreign func nativeProgressBarCreate(parentPtr: Int64): Int64
foreign func nativeProgressBarDelete(ptr: Int64): Unit
foreign func nativeProgressBarValue(ptr: Int64): Int32
foreign func nativeProgressBarSetValue(ptr: Int64, value: Int32): Unit
foreign func nativeProgressBarMinimum(ptr: Int64): Int32
foreign func nativeProgressBarMaximum(ptr: Int64): Int32
foreign func nativeProgressBarSetRange(ptr: Int64, min: Int32, max: Int32): Unit
foreign func nativeProgressBarText(ptr: Int64): CString
foreign func nativeProgressBarSetFormat(ptr: Int64, format: CString): Unit
foreign func nativeProgressBarSetTextVisible(ptr: Int64, visible: Bool): Unit
foreign func nativeProgressBarIsTextVisible(ptr: Int64): Bool

public class QProgressBar <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeProgressBarCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeProgressBarDelete(ptr)
        }
    }

    public func value(): Int64 {
        return Int64(unsafe {
            nativeProgressBarValue(ptr)
        })
    }

    public func setValue(value: Int64) {
        unsafe {
            nativeProgressBarSetValue(ptr, Int32(value))
        }
    }

    public func minimum(): Int64 {
        return Int64(unsafe {
            nativeProgressBarMinimum(ptr)
        })
    }

    public func maximum(): Int64 {
        return Int64(unsafe {
            nativeProgressBarMaximum(ptr)
        })
    }

    public func setRange(min: Int64, max: Int64) {
        unsafe {
            nativeProgressBarSetRange(ptr, Int32(min), Int32(max))
        }
    }

    public func text(): String {
        return unsafe {
            nativeProgressBarText(ptr).toString()
        }
    }

    public func setFormat(format: String) {
        unsafe {
            let f = LibC.mallocCString(format)
            nativeProgressBarSetFormat(ptr, f)
            LibC.free(f)
        }
    }

    public func setTextVisible(visible: Bool) {
        unsafe {
            nativeProgressBarSetTextVisible(ptr, visible)
        }
    }

    public func isTextVisible(): Bool {
        return unsafe {
            nativeProgressBarIsTextVisible(ptr)
        }
    }
}
