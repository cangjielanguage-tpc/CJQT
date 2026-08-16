package cjqt.widgets

import cjqt.core.Orientation

foreign func nativeSliderCreate(parentPtr: Int64): Int64
foreign func nativeSliderCreateWithOrientation(orientation: Int16, parentPtr: Int64): Int64
foreign func nativeSliderDelete(ptr: Int64): Unit
foreign func nativeSliderValue(ptr: Int64): Int32
foreign func nativeSliderSetValue(ptr: Int64, value: Int32): Unit
foreign func nativeSliderMinimum(ptr: Int64): Int32
foreign func nativeSliderMaximum(ptr: Int64): Int32
foreign func nativeSliderSetRange(ptr: Int64, min: Int32, max: Int32): Unit
foreign func nativeSliderOrientation(ptr: Int64): Int32
foreign func nativeSliderSetOrientation(ptr: Int64, orientation: Int32): Unit
foreign func nativeSliderSetTickInterval(ptr: Int64, interval: Int32): Unit
foreign func nativeSliderSetSingleStep(ptr: Int64, step: Int32): Unit

public class QSlider <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeSliderCreate(parent.ptr)
            }
        )
    }

    public init(orientation: Orientation, parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeSliderCreateWithOrientation(orientation.value(), parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeSliderDelete(ptr)
        }
    }

    public func value(): Int64 {
        return Int64(unsafe {
            nativeSliderValue(ptr)
        })
    }

    public func setValue(value: Int64) {
        unsafe {
            nativeSliderSetValue(ptr, Int32(value))
        }
    }

    public func minimum(): Int64 {
        return Int64(unsafe {
            nativeSliderMinimum(ptr)
        })
    }

    public func maximum(): Int64 {
        return Int64(unsafe {
            nativeSliderMaximum(ptr)
        })
    }

    public func setRange(min: Int64, max: Int64) {
        unsafe {
            nativeSliderSetRange(ptr, Int32(min), Int32(max))
        }
    }

    public func setTickInterval(interval: Int64) {
        unsafe {
            nativeSliderSetTickInterval(ptr, Int32(interval))
        }
    }

    public func setSingleStep(step: Int64) {
        unsafe {
            nativeSliderSetSingleStep(ptr, Int32(step))
        }
    }
}
