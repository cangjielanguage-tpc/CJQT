package cjqt.widgets

foreign func nativeTreeWidgetCreate(parentPtr: Int64): Int64
foreign func nativeTreeWidgetDelete(ptr: Int64): Unit
foreign func nativeTreeWidgetTopLevelItemCount(ptr: Int64): Int32
foreign func nativeTreeWidgetTopLevelItem(ptr: Int64, index: Int32): Int64
foreign func nativeTreeWidgetAddTopLevelItem(ptr: Int64, itemPtr: Int64): Unit
foreign func nativeTreeWidgetCurrentItem(ptr: Int64): Int64
foreign func nativeTreeWidgetClear(ptr: Int64): Unit
foreign func nativeTreeWidgetItemCreate(text: CString): Int64
foreign func nativeTreeWidgetItemDelete(ptr: Int64): Unit
foreign func nativeTreeWidgetItemGetText(ptr: Int64): CString
foreign func nativeTreeWidgetItemSetText(ptr: Int64, text: CString): Unit
foreign func nativeTreeWidgetItemAddChild(ptr: Int64, childPtr: Int64): Unit
foreign func nativeTreeWidgetItemChildCount(ptr: Int64): Int32

public class QTreeWidgetItem {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(text: String) {
        this.ptr = unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeTreeWidgetItemCreate(t)
            LibC.free(t)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeTreeWidgetItemDelete(ptr) }
    }

    public func text(): String {
        return unsafe { nativeTreeWidgetItemGetText(ptr).toString() }
    }

    public func setText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeTreeWidgetItemSetText(ptr, t)
            LibC.free(t)
        }
    }

    public func addChild(child: QTreeWidgetItem) {
        unsafe { nativeTreeWidgetItemAddChild(ptr, child.ptr) }
    }

    public func childCount(): Int64 {
        return Int64(unsafe { nativeTreeWidgetItemChildCount(ptr) })
    }
}

public class QTreeWidget <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeTreeWidgetCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeTreeWidgetDelete(ptr)
        }
    }

    public func topLevelItemCount(): Int64 {
        return Int64(unsafe { nativeTreeWidgetTopLevelItemCount(ptr) })
    }

    public func topLevelItem(index: Int64): QTreeWidgetItem {
        return QTreeWidgetItem(unsafe { nativeTreeWidgetTopLevelItem(ptr, Int32(index)) })
    }

    public func addTopLevelItem(item: QTreeWidgetItem) {
        unsafe { nativeTreeWidgetAddTopLevelItem(ptr, item.ptr) }
    }

    public func currentItem(): QTreeWidgetItem {
        return QTreeWidgetItem(unsafe { nativeTreeWidgetCurrentItem(ptr) })
    }

    public func clear() {
        unsafe { nativeTreeWidgetClear(ptr) }
    }
}
