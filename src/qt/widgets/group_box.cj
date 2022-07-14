package qt.widgets

foreign func nativeGroupBoxCreate(parentPtr: Int64): Int64
foreign func nativeGroupBoxSetTitle(ptr: Int64, title: CString): Unit
foreign func nativeGroupBoxTitle(ptr: Int64): CString
foreign func nativeGroupBoxSetAlignment(ptr: Int64, alignment: Int32): Unit
foreign func nativeGroupBoxAlignment(ptr: Int64): Int32
foreign func nativeGroupBoxSetFlat(ptr: Int64, flat: Bool): Unit
foreign func nativeGroupBoxIsFlat(ptr: Int64): Bool
foreign func nativeGroupBoxSetCheckable(ptr: Int64, checkable: Bool): Unit
foreign func nativeGroupBoxIsCheckable(ptr: Int64): Bool
foreign func nativeGroupBoxSetChecked(ptr: Int64, checked: Bool): Unit
foreign func nativeGroupBoxIsChecked(ptr: Int64): Bool
foreign func nativeGroupBoxClickedConnect(ptr: Int64, code: Int64, callback: CFunc<(Int64) -> Unit>): Unit
foreign func nativeGroupBoxToggledConnect(ptr: Int64, code: Int64, callback: CFunc<(Int64) -> Unit>): Unit
foreign func nativeGroupBoxDelete(ptr: Int64): Unit

public class QGroupBox <: QWidget {
    public let clicked: QGroupBoxClickedSignal 
    public let toggled: QGroupBoxToggledSignal 

    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeGroupBoxCreate(parent.ptr)
            }
        )
        clicked = QGroupBoxClickedSignal(ptr)
        toggled = QGroupBoxToggledSignal(ptr)
    }

    public func setTitle(title: String) {
        unsafe {
            nativeGroupBoxSetTitle(ptr, CString(title))
        }
    }

    public func title(): String {
        let title = unsafe {
            nativeGroupBoxTitle(ptr)
        }
        return title.toString()
    }

    public func setAlignment(alignment: Int64) {
        unsafe {
            nativeGroupBoxSetAlignment(ptr, Int32(alignment))
        }
    }

    public func alignment(): Int64 {
        let alignment = unsafe {
            nativeGroupBoxAlignment(ptr)
        }
        return Int64(alignment)
    }

    public func setFlat(flat: Bool) {
        unsafe {
            nativeGroupBoxSetFlat(ptr, flat)
        }
    }

    public func isFlat(): Bool {
        let flat = unsafe {
            nativeGroupBoxIsFlat(ptr)
        }
        return flat
    }

    public func setCheckable(checkable: Bool) {
        unsafe {
            nativeGroupBoxSetCheckable(ptr, checkable)
        }
    }

    public func isCheckable(): Bool {
        let checkable = unsafe {
            nativeGroupBoxIsCheckable(ptr)
        }
        return checkable
    }

    public func setChecked(checked: Bool) {
        unsafe {
            nativeGroupBoxSetChecked(ptr, checked)
        }
    }

    public func isChecked(): Bool {
        let checked = unsafe {
            nativeGroupBoxIsChecked(ptr)
        }
        return checked
    }

    public override func delete() {
        unsafe {
            nativeGroupBoxDelete(ptr)
        }
    }

}

public class QGroupBoxClickedSignal <: QSignal {
    init(ptr: Int64){
        super("clicked", ptr)
    }

    override func nativeConnect(code: Int64, cb: CFunc<(Int64) -> Unit>){
        unsafe {
            nativeGroupBoxClickedConnect(ptr, code, cb)
        }
    }
}

public class QGroupBoxToggledSignal <: QSignal {
    init(ptr: Int64){
        super("toggled", ptr)
    }

    override func nativeConnect(code: Int64, cb: CFunc<(Int64) -> Unit>){
        unsafe {
            nativeGroupBoxToggledConnect(ptr, code, cb)
        }
    }
}