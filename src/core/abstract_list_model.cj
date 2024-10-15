package cjqt.core

import cjqt.tools.QConversion

foreign func nativeAbstractListModelCreate(ptr: Int64): Int64
foreign func nativeAbstractListModelDelete(ptr: Int64): Unit

foreign func nativeAbstractItemModelBeginInsertRows(ptr: Int64, parentPtr: Int64, first: Int32, last: Int32): Unit
foreign func nativeAbstractItemModelEndInsertRows(ptr: Int64): Unit
foreign func nativeAbstractItemModelBeginRemoveRows(ptr: Int64, parentPtr: Int64, first: Int32, last: Int32): Unit
foreign func nativeAbstractItemModelEndRemoveRows(ptr: Int64): Unit

foreign func nativeAbstractListModelSetRowCountCallback(ptr: Int64, callback: CFunc<(Int64, Int64) -> Int32>): Unit
foreign func nativeAbstractListModelSetDataCallback(ptr: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> CPointer<Unit>>): Unit

@C
func rowCountCallback(ptr: Int64, parentPtr: Int64): Int32 {
    let parent = QModelIndex(parentPtr)
    try {
        return QCoreCallbackMap.rowCountCallback[ptr](parent)
    } catch (e: Exception) {
        println(e)
    }
    return 0
}

@C
func dataCallback(ptr: Int64, dataPtr: CPointer<Unit>): CPointer<Unit> {
    let data = QConversion.cPointerToCjDataLongInt(dataPtr)
    let index = QModelIndex(data.p1)
    let role = data.p2
    try {
        return QCoreCallbackMap.dataCallback[ptr](index, role).ptr
    } catch (e: Exception) {
        println(e)
    }
    return QVariant().ptr
}

public abstract class QAbstractListModel<:QAbstractItemModel {

    public init(ptr: Int64) {
        // this.ptr = ptr
        super(
            unsafe {
                nativeAbstractListModelCreate(ptr)
            }
        )
        //setRowCountCallback()
        //setDataCallback()
    }

    public open func delete(): Unit {
        QCoreCallbackMap.rowCountCallback.remove(ptr)
        QCoreCallbackMap.dataCallback.remove(ptr)
        return unsafe {
            nativeAbstractListModelDelete(this.ptr)
        }
    }

    public func beginInsertRows(parent: QModelIndex, first: Int64, last: Int64): Unit {
        return unsafe {
            nativeAbstractItemModelBeginInsertRows(this.ptr, parent.ptr, Int32(first), Int32(last))
        }
    }

    public func endInsertRows(): Unit {
        return unsafe {
            nativeAbstractItemModelEndInsertRows(this.ptr)
        }
    }

    public func beginRemoveRows(parent: QModelIndex, first: Int64, last: Int64): Unit {
        return unsafe {
            nativeAbstractItemModelBeginRemoveRows(this.ptr, parent.ptr, Int32(first), Int32(last))
        }
    }

    public func endRemoveRows(): Unit {
        return unsafe {
            nativeAbstractItemModelEndRemoveRows(this.ptr)
        }
    }

    protected func setRowCountCallback() {
        QCoreCallbackMap.rowCountCallback.put(ptr, rowCount)
        unsafe {
            nativeAbstractListModelSetRowCountCallback(ptr, rowCountCallback)
        }
    }

    protected func setDataCallback() {
        QCoreCallbackMap.dataCallback.put(ptr, data)
        unsafe {
            nativeAbstractListModelSetDataCallback(ptr, dataCallback)
        }
    }

    public func rowCount(parent: QModelIndex): Int32

    public func data(index: QModelIndex, role: Int32): QVariant
}
