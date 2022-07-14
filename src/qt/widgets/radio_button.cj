package qt.widgets

foreign func nativeRadioButtonCreate(parentPtr: Int64): Int64
foreign func nativeRadioButtonSetText(ptr: Int64, text: CString): Unit
foreign func nativeRadioButtonText(ptr: Int64): CString
foreign func nativeRadioButtonSetChecked(ptr: Int64, checked: Bool): Unit
foreign func nativeRadioButtonIsChecked(ptr: Int64): Bool
foreign func nativeRadioButtonDelete(ptr: Int64): Unit

public class QRadioButton <: QWidget {
    public init(text!: String = "", parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeRadioButtonCreate(parent.ptr)
            }
        )
        if (!text.isEmpty()){
            setText(text)
        }
    }

    public func setText(text: String) {
        unsafe {
            nativeRadioButtonSetText(ptr, CString(text))
        }
    }

    public func text(): String {
        let text = unsafe {
            nativeRadioButtonText(ptr)
        }
        return text.toString()
    }

    public func setChecked(checked: Bool) {
        unsafe {
            nativeRadioButtonSetChecked(ptr, checked)
        }
    }

    public func isChecked(): Bool {
        let checked = unsafe {
            nativeRadioButtonIsChecked(ptr)
        }
        return checked
    }

    public override func delete() {
        unsafe {
            nativeRadioButtonDelete(ptr)
        }
    }
}
