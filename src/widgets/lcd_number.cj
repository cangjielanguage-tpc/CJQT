package cjqt.widgets

foreign func nativeLcdNumberCreate(parentPtr: Int64): Int64
foreign func nativeLcdNumberDelete(ptr: Int64): Unit
foreign func nativeLcdNumberDisplay(ptr: Int64, number: Int32): Unit
foreign func nativeLcdNumberValue(ptr: Int64): Int32
foreign func nativeLcdNumberSetDigitCount(ptr: Int64, count: Int32): Unit
foreign func nativeLcdNumberDigitCount(ptr: Int64): Int32

public class QLCDNumber <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeLcdNumberCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeLcdNumberDelete(ptr)
        }
    }

    public func display(number: Int64) {
        unsafe {
            nativeLcdNumberDisplay(ptr, Int32(number))
        }
    }

    public func value(): Int64 {
        return Int64(unsafe {
            nativeLcdNumberValue(ptr)
        })
    }

    public func setDigitCount(count: Int64) {
        unsafe {
            nativeLcdNumberSetDigitCount(ptr, Int32(count))
        }
    }

    public func digitCount(): Int64 {
        return Int64(unsafe {
            nativeLcdNumberDigitCount(ptr)
        })
    }
}
