package cjqt.qt.core

foreign func nativeStringListModelCreate(listPtr: Int64): Int64
foreign func nativeStringListModelDelete(ptr: Int64): Unit
foreign func nativeStringListModelSetStringList(ptr: Int64, listPtr: Int64): Unit
foreign func nativeStringListModelStringList(ptr: Int64): Int64
foreign func nativeStringListModelRowCount(ptr: Int64, listPtr: Int64): Int32
foreign func nativeStringListModelData(ptr: Int64, listPtr: Int64, role: Int32): CPointer<Unit>

public open class QStringListModel <: QAbstractListModel {
    public init(list: QStringList) {
        super(
            unsafe {
                nativeStringListModelCreate(list.ptr)
            }
        )
    }

    public override func delete() {
        unsafe {
            nativeStringListModelDelete(ptr)
        }
    }

    public func setStringList(list: QStringList) {
        unsafe {
            nativeStringListModelSetStringList(ptr, list.ptr)
        }
    }

    public func stringList(): QStringList {
        let listPtr = unsafe {
            nativeStringListModelStringList(ptr)
        }
        return QStringList(ptr: listPtr)
    }

    public open func rowCount(parent: QModelIndex): Int32 {
        return unsafe {
            nativeStringListModelRowCount(ptr, parent.ptr)
        }
    }

    public open func data(index: QModelIndex, role: Int32): QVariant {
        let result = unsafe {
            nativeStringListModelData(ptr, index.ptr, role)
        }
        return QVariant(result)
    }
}
