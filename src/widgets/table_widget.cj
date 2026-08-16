package cjqt.widgets

foreign func nativeTableWidgetCreate(parentPtr: Int64): Int64
foreign func nativeTableWidgetDelete(ptr: Int64): Unit
foreign func nativeTableWidgetRowCount(ptr: Int64): Int32
foreign func nativeTableWidgetColumnCount(ptr: Int64): Int32
foreign func nativeTableWidgetSetRowCount(ptr: Int64, rows: Int32): Unit
foreign func nativeTableWidgetSetColumnCount(ptr: Int64, columns: Int32): Unit
foreign func nativeTableWidgetSetItem(ptr: Int64, row: Int32, col: Int32, itemPtr: Int64): Unit
foreign func nativeTableWidgetItem(ptr: Int64, row: Int32, col: Int32): Int64
foreign func nativeTableWidgetItemText(ptr: Int64, row: Int32, col: Int32): CString
foreign func nativeTableWidgetSetItemText(ptr: Int64, row: Int32, col: Int32, text: CString): Unit
foreign func nativeTableWidgetItemCreate(text: CString): Int64
foreign func nativeTableWidgetItemDelete(ptr: Int64): Unit
foreign func nativeTableWidgetItemGetText(ptr: Int64): CString
foreign func nativeTableWidgetItemSetText(ptr: Int64, text: CString): Unit

public class QTableWidgetItem {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(text: String) {
        this.ptr = unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeTableWidgetItemCreate(t)
            LibC.free(t)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeTableWidgetItemDelete(ptr) }
    }

    public func text(): String {
        return unsafe { nativeTableWidgetItemGetText(ptr).toString() }
    }

    public func setText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeTableWidgetItemSetText(ptr, t)
            LibC.free(t)
        }
    }
}

public class QTableWidget <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeTableWidgetCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeTableWidgetDelete(ptr)
        }
    }

    public func rowCount(): Int64 {
        return Int64(unsafe { nativeTableWidgetRowCount(ptr) })
    }

    public func columnCount(): Int64 {
        return Int64(unsafe { nativeTableWidgetColumnCount(ptr) })
    }

    public func setRowCount(rows: Int64) {
        unsafe { nativeTableWidgetSetRowCount(ptr, Int32(rows)) }
    }

    public func setColumnCount(columns: Int64) {
        unsafe { nativeTableWidgetSetColumnCount(ptr, Int32(columns)) }
    }

    public func setItem(row: Int64, column: Int64, item: QTableWidgetItem) {
        unsafe { nativeTableWidgetSetItem(ptr, Int32(row), Int32(column), item.ptr) }
    }

    public func item(row: Int64, column: Int64): QTableWidgetItem {
        return QTableWidgetItem(unsafe { nativeTableWidgetItem(ptr, Int32(row), Int32(column)) })
    }

    public func itemText(row: Int64, column: Int64): String {
        return unsafe { nativeTableWidgetItemText(ptr, Int32(row), Int32(column)).toString() }
    }

    public func setItemText(row: Int64, column: Int64, text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeTableWidgetSetItemText(ptr, Int32(row), Int32(column), t)
            LibC.free(t)
        }
    }
}
