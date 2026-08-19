package cjqt.widgets

import cjqt.tools.ScrollBarPolicy

foreign func nativeListWidgetCreate(parentPtr: Int64): Int64
foreign func nativeListWidgetDelete(ptr: Int64): Unit
foreign func nativeListWidgetAddItem(ptr: Int64, text: CString): Int64
foreign func nativeListWidgetCount(ptr: Int64): Int32
foreign func nativeListWidgetItem(ptr: Int64, index: Int32): Int64
foreign func nativeListWidgetSetCurrentRow(ptr: Int64, row: Int32): Unit
foreign func nativeListWidgetCurrentRow(ptr: Int64): Int32
foreign func nativeListWidgetCurrentItem(ptr: Int64): Int64
foreign func nativeListWidgetClear(ptr: Int64): Unit
foreign func nativeListWidgetSetItemText(ptr: Int64, index: Int32, text: CString): Unit
foreign func nativeListWidgetItemText(ptr: Int64, index: Int32): CString
foreign func nativeListWidgetSetItemWidget(ptr: Int64, index: Int32, widgetPtr: Int64): Unit
foreign func nativeListWidgetItemWidget(ptr: Int64, index: Int32): Int64
foreign func nativeListWidgetItemCreate(text: CString): Int64
foreign func nativeListWidgetItemDelete(ptr: Int64): Unit
foreign func nativeListWidgetItemGetText(ptr: Int64): CString
foreign func nativeListWidgetItemSetText(ptr: Int64, text: CString): Unit

public class QListWidgetItem {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(text: String) {
        this.ptr = unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeListWidgetItemCreate(t)
            LibC.free(t)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeListWidgetItemDelete(ptr) }
    }

    public func text(): String {
        return unsafe { nativeListWidgetItemGetText(ptr).toString() }
    }

    public func setText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeListWidgetItemSetText(ptr, t)
            LibC.free(t)
        }
    }
}

public class QListWidget <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeListWidgetCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeListWidgetDelete(ptr)
        }
    }

    public func addItem(text: String): QListWidgetItem {
        return QListWidgetItem(unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeListWidgetAddItem(ptr, t)
            LibC.free(t)
            r
        })
    }

    /**
     * The Function is setItemWidget
     *
     * @param index of Int64
     * @param widget of QWidget
     */
    public func setItemWidget(index: Int64, widget: QWidget) {
        unsafe {
            nativeListWidgetSetItemWidget(ptr, Int32(index), widget.ptr)
        }
    }

    /**
     * The Function is itemWidget
     *
     * @param index of Int64
     * @return Type of QWidget
     */
    public func itemWidget(index: Int64): QWidget {
        return QWidget(unsafe {
            nativeListWidgetItemWidget(ptr, Int32(index))
        })
    }

    /**
     * The Function is setVerticalScrollBarPolicy
     *
     * @param policy of ScrollBarPolicy
     */
    public func setVerticalScrollBarPolicy(policy: ScrollBarPolicy) {
        unsafe {
            nativeAbstractScrollAreaSetVerticalScrollBarPolicy(ptr, policy.value())
        }
    }

    /**
     * The Function is setHorizontalScrollBarPolicy
     *
     * @param policy of ScrollBarPolicy
     */
    public func setHorizontalScrollBarPolicy(policy: ScrollBarPolicy) {
        unsafe {
            nativeAbstractScrollAreaSetHorizontalScrollBarPolicy(ptr, policy.value())
        }
    }

    public func count(): Int64 {
        return Int64(unsafe { nativeListWidgetCount(ptr) })
    }

    public func item(index: Int64): QListWidgetItem {
        return QListWidgetItem(unsafe { nativeListWidgetItem(ptr, Int32(index)) })
    }

    public func setCurrentRow(row: Int64) {
        unsafe { nativeListWidgetSetCurrentRow(ptr, Int32(row)) }
    }

    public func currentRow(): Int64 {
        return Int64(unsafe { nativeListWidgetCurrentRow(ptr) })
    }

    public func currentItem(): QListWidgetItem {
        return QListWidgetItem(unsafe { nativeListWidgetCurrentItem(ptr) })
    }

    public func clear() {
        unsafe { nativeListWidgetClear(ptr) }
    }

    public func itemText(index: Int64): String {
        return unsafe { nativeListWidgetItemText(ptr, Int32(index)).toString() }
    }

    public func setItemText(index: Int64, text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeListWidgetSetItemText(ptr, Int32(index), t)
            LibC.free(t)
        }
    }
}
