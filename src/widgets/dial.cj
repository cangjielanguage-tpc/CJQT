package cjqt.widgets

foreign func nativeDialCreate(parentPtr: Int64): Int64
foreign func nativeDialDelete(ptr: Int64): Unit
foreign func nativeDialValue(ptr: Int64): Int32
foreign func nativeDialSetValue(ptr: Int64, value: Int32): Unit
foreign func nativeDialMinimum(ptr: Int64): Int32
foreign func nativeDialMaximum(ptr: Int64): Int32
foreign func nativeDialSetRange(ptr: Int64, min: Int32, max: Int32): Unit
foreign func nativeDialSetNotchesVisible(ptr: Int64, b: Bool): Unit
foreign func nativeDialNotchesVisible(ptr: Int64): Bool

public class QDial <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeDialCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeDialDelete(ptr)
        }
    }

    public func value(): Int64 {
        return Int64(unsafe { nativeDialValue(ptr) })
    }

    public func setValue(value: Int64) {
        unsafe { nativeDialSetValue(ptr, Int32(value)) }
    }

    public func minimum(): Int64 {
        return Int64(unsafe { nativeDialMinimum(ptr) })
    }

    public func maximum(): Int64 {
        return Int64(unsafe { nativeDialMaximum(ptr) })
    }

    public func setRange(min: Int64, max: Int64) {
        unsafe { nativeDialSetRange(ptr, Int32(min), Int32(max)) }
    }

    public func setNotchesVisible(b: Bool) {
        unsafe { nativeDialSetNotchesVisible(ptr, b) }
    }

    public func notchesVisible(): Bool {
        return unsafe { nativeDialNotchesVisible(ptr) }
    }
}
