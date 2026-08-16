package cjqt.widgets

foreign func nativeSpinBoxCreate(parentPtr: Int64): Int64
foreign func nativeSpinBoxDelete(ptr: Int64): Unit
foreign func nativeSpinBoxValue(ptr: Int64): Int32
foreign func nativeSpinBoxSetValue(ptr: Int64, value: Int32): Unit
foreign func nativeSpinBoxMinimum(ptr: Int64): Int32
foreign func nativeSpinBoxMaximum(ptr: Int64): Int32
foreign func nativeSpinBoxSetRange(ptr: Int64, min: Int32, max: Int32): Unit
foreign func nativeSpinBoxText(ptr: Int64): CString
foreign func nativeSpinBoxSetPrefix(ptr: Int64, prefix: CString): Unit
foreign func nativeSpinBoxSetSuffix(ptr: Int64, suffix: CString): Unit
foreign func nativeSpinBoxSetSingleStep(ptr: Int64, step: Int32): Unit

public class QSpinBox <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeSpinBoxCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeSpinBoxDelete(ptr)
        }
    }

    public func value(): Int64 {
        return Int64(unsafe {
            nativeSpinBoxValue(ptr)
        })
    }

    public func setValue(value: Int64) {
        unsafe {
            nativeSpinBoxSetValue(ptr, Int32(value))
        }
    }

    public func minimum(): Int64 {
        return Int64(unsafe {
            nativeSpinBoxMinimum(ptr)
        })
    }

    public func maximum(): Int64 {
        return Int64(unsafe {
            nativeSpinBoxMaximum(ptr)
        })
    }

    public func setRange(min: Int64, max: Int64) {
        unsafe {
            nativeSpinBoxSetRange(ptr, Int32(min), Int32(max))
        }
    }

    public func text(): String {
        return unsafe {
            nativeSpinBoxText(ptr).toString()
        }
    }

    public func setPrefix(prefix: String) {
        unsafe {
            let p = LibC.mallocCString(prefix)
            nativeSpinBoxSetPrefix(ptr, p)
            LibC.free(p)
        }
    }

    public func setSuffix(suffix: String) {
        unsafe {
            let s = LibC.mallocCString(suffix)
            nativeSpinBoxSetSuffix(ptr, s)
            LibC.free(s)
        }
    }

    public func setSingleStep(step: Int64) {
        unsafe {
            nativeSpinBoxSetSingleStep(ptr, Int32(step))
        }
    }
}
