package qt.widgets

//C
foreign func nativeAbstractSliderCreate(parentPtr: Int64): Int64
foreign func nativeAbstractSliderDelete(ptr: Int64): Unit

public open class QAbstractSlider <: QWidget {
    public init() {
        super(unsafe { nativeAbstractSliderCreate(0) })
    }
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(parent: QWidget) {
        super(unsafe { nativeAbstractSliderCreate(parent.ptr) })
    }

    public open override func delete(): Unit {
        return unsafe {
            nativeAbstractSliderDelete(this.ptr)
        }
    }

    protected open func event(event: QEvent): Bool {
        return true
    }
}
