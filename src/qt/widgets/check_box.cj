package qt.widgets

foreign func nativeCheckBoxCreate(parentPtr: Int64): Int64
foreign func nativeCheckBoxSetText(ptr: Int64, text: CString): Unit
foreign func nativeCheckBoxText(ptr: Int64): CString
foreign func nativeCheckBoxSetChecked(ptr: Int64, checked: Bool): Unit
foreign func nativeCheckBoxIsChecked(ptr: Int64): Bool
foreign func nativeCheckBoxDelete(ptr: Int64): Unit

public class QCheckBox <: QWidget {
    public init(text!: String = "", parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeCheckBoxCreate(parent.ptr)
            }
        )
        if (!text.isEmpty()){
            setText(text)
        }
    }

    public func setText(text: String) {
        unsafe {
            nativeCheckBoxSetText(ptr, CString(text))
        }
    }

    public func text(): String {
        let text = unsafe {
            nativeCheckBoxText(ptr)
        }
        return text.toString()
    }

    public func setChecked(checked: Bool) {
        unsafe {
            nativeCheckBoxSetChecked(ptr, checked)
        }
    }

    public func isChecked(): Bool {
        let checked = unsafe {
            nativeCheckBoxIsChecked(ptr)
        }
        return checked
    }

    public override func delete() {
        unsafe {
            nativeCheckBoxDelete(ptr)
        }
    }
}
