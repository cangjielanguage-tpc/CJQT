package cjqt.widgets

foreign func nativeDoubleSpinBoxCreate(parentPtr: Int64): Int64
foreign func nativeDoubleSpinBoxDelete(ptr: Int64): Unit
foreign func nativeDoubleSpinBoxValue(ptr: Int64): Float64
foreign func nativeDoubleSpinBoxSetValue(ptr: Int64, value: Float64): Unit
foreign func nativeDoubleSpinBoxMinimum(ptr: Int64): Float64
foreign func nativeDoubleSpinBoxMaximum(ptr: Int64): Float64
foreign func nativeDoubleSpinBoxSetRange(ptr: Int64, min: Float64, max: Float64): Unit
foreign func nativeDoubleSpinBoxSetDecimals(ptr: Int64, decimals: Int32): Unit
foreign func nativeDoubleSpinBoxDecimals(ptr: Int64): Int32
foreign func nativeDoubleSpinBoxText(ptr: Int64): CString
foreign func nativeDoubleSpinBoxSetPrefix(ptr: Int64, prefix: CString): Unit

public class QDoubleSpinBox <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeDoubleSpinBoxCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeDoubleSpinBoxDelete(ptr)
        }
    }

    public func value(): Float64 {
        return unsafe {
            nativeDoubleSpinBoxValue(ptr)
        }
    }

    public func setValue(value: Float64) {
        unsafe {
            nativeDoubleSpinBoxSetValue(ptr, value)
        }
    }

    public func minimum(): Float64 {
        return unsafe {
            nativeDoubleSpinBoxMinimum(ptr)
        }
    }

    public func maximum(): Float64 {
        return unsafe {
            nativeDoubleSpinBoxMaximum(ptr)
        }
    }

    public func setRange(min: Float64, max: Float64) {
        unsafe {
            nativeDoubleSpinBoxSetRange(ptr, min, max)
        }
    }

    public func setDecimals(decimals: Int64) {
        unsafe {
            nativeDoubleSpinBoxSetDecimals(ptr, Int32(decimals))
        }
    }

    public func decimals(): Int64 {
        return Int64(unsafe {
            nativeDoubleSpinBoxDecimals(ptr)
        })
    }

    public func text(): String {
        return unsafe {
            nativeDoubleSpinBoxText(ptr).toString()
        }
    }

    public func setPrefix(prefix: String) {
        unsafe {
            let p = LibC.mallocCString(prefix)
            nativeDoubleSpinBoxSetPrefix(ptr, p)
            LibC.free(p)
        }
    }
}
