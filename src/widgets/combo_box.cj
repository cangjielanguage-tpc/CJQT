package cjqt.widgets

import cjqt.gui.*

foreign func nativeComboBoxCreate(parentPtr: Int64): Int64
foreign func nativeComboBoxDelete(ptr: Int64): Unit
foreign func nativeComboBoxAddItem(ptr: Int64, text: CString): Unit
foreign func nativeComboBoxAddItemWithIcon(ptr: Int64, iconPtr: Int64, text: CString): Unit
foreign func nativeComboBoxInsertItem(ptr: Int64, index: Int32, text: CString): Unit
foreign func nativeComboBoxCount(ptr: Int64): Int32
foreign func nativeComboBoxCurrentIndex(ptr: Int64): Int32
foreign func nativeComboBoxSetCurrentIndex(ptr: Int64, index: Int32): Unit
foreign func nativeComboBoxCurrentText(ptr: Int64): CString
foreign func nativeComboBoxSetCurrentText(ptr: Int64, text: CString): Unit
foreign func nativeComboBoxItemText(ptr: Int64, index: Int32): CString
foreign func nativeComboBoxSetEditable(ptr: Int64, editable: Bool): Unit
foreign func nativeComboBoxIsEditable(ptr: Int64): Bool
foreign func nativeComboBoxClear(ptr: Int64): Unit
foreign func nativeComboBoxRemoveItem(ptr: Int64, index: Int32): Unit

public class QComboBox <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeComboBoxCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeComboBoxDelete(ptr)
        }
    }

    public func addItem(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeComboBoxAddItem(ptr, t)
            LibC.free(t)
        }
    }

    public func addItem(icon: QIcon, text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeComboBoxAddItemWithIcon(ptr, icon.ptr, t)
            LibC.free(t)
        }
    }

    public func insertItem(index: Int64, text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeComboBoxInsertItem(ptr, Int32(index), t)
            LibC.free(t)
        }
    }

    public func count(): Int64 {
        return Int64(unsafe {
            nativeComboBoxCount(ptr)
        })
    }

    public func currentIndex(): Int64 {
        return Int64(unsafe {
            nativeComboBoxCurrentIndex(ptr)
        })
    }

    public func setCurrentIndex(index: Int64) {
        unsafe {
            nativeComboBoxSetCurrentIndex(ptr, Int32(index))
        }
    }

    public func currentText(): String {
        return unsafe {
            nativeComboBoxCurrentText(ptr).toString()
        }
    }

    public func setCurrentText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeComboBoxSetCurrentText(ptr, t)
            LibC.free(t)
        }
    }

    public func itemText(index: Int64): String {
        return unsafe {
            nativeComboBoxItemText(ptr, Int32(index)).toString()
        }
    }

    public func setEditable(editable: Bool) {
        unsafe {
            nativeComboBoxSetEditable(ptr, editable)
        }
    }

    public func isEditable(): Bool {
        return unsafe {
            nativeComboBoxIsEditable(ptr)
        }
    }

    public func clear() {
        unsafe {
            nativeComboBoxClear(ptr)
        }
    }

    public func removeItem(index: Int64) {
        unsafe {
            nativeComboBoxRemoveItem(ptr, Int32(index))
        }
    }
}
