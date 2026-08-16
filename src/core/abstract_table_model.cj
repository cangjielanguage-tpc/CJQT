package cjqt.core

import cjqt.tools.QConversion

foreign func nativeAbstractTableModelCreate(ptr: Int64): Int64
foreign func nativeAbstractTableModelDelete(ptr: Int64): Unit
foreign func nativeAbstractTableModelBeginInsertRows(ptr: Int64, parentPtr: Int64, first: Int32, last: Int32): Unit
foreign func nativeAbstractTableModelEndInsertRows(ptr: Int64): Unit
foreign func nativeAbstractTableModelBeginRemoveRows(ptr: Int64, parentPtr: Int64, first: Int32, last: Int32): Unit
foreign func nativeAbstractTableModelEndRemoveRows(ptr: Int64): Unit
foreign func nativeAbstractTableModelBeginInsertColumns(ptr: Int64, parentPtr: Int64, first: Int32, last: Int32): Unit
foreign func nativeAbstractTableModelEndInsertColumns(ptr: Int64): Unit
foreign func nativeAbstractTableModelBeginRemoveColumns(ptr: Int64, parentPtr: Int64, first: Int32, last: Int32): Unit
foreign func nativeAbstractTableModelEndRemoveColumns(ptr: Int64): Unit
foreign func nativeAbstractTableModelSetRowCountCallback(ptr: Int64, callback: CFunc<(Int64, Int64) -> Int32>): Unit
foreign func nativeAbstractTableModelSetColumnCountCallback(ptr: Int64, callback: CFunc<(Int64, Int64) -> Int32>): Unit
foreign func nativeAbstractTableModelSetDataCallback(ptr: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> CPointer<Unit>>): Unit

@C
func tableRowCountCallback(ptr: Int64, parentPtr: Int64): Int32 {
    let parent = QModelIndex(parentPtr)
    try {
        return QCoreCallbackMap.rowCountCallback[ptr](parent)
    } catch (e: Exception) {
        println(e)
    }
    return 0
}

@C
func tableColumnCountCallback(ptr: Int64, parentPtr: Int64): Int32 {
    let parent = QModelIndex(parentPtr)
    try {
        return QCoreCallbackMap.columnCountCallback[ptr](parent)
    } catch (e: Exception) {
        println(e)
    }
    return 0
}

@C
func tableDataCallback(ptr: Int64, dataPtr: CPointer<Unit>): CPointer<Unit> {
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

public abstract class QAbstractTableModel <: QAbstractItemModel {
    public init(ptr: Int64) {
        super(
            unsafe {
                nativeAbstractTableModelCreate(ptr)
            }
        )
    }

    public open override func delete(): Unit {
        QCoreCallbackMap.rowCountCallback.remove(ptr)
        QCoreCallbackMap.columnCountCallback.remove(ptr)
        QCoreCallbackMap.dataCallback.remove(ptr)
        return unsafe {
            nativeAbstractTableModelDelete(this.ptr)
        }
    }

    public func beginInsertRows(parent: QModelIndex, first: Int64, last: Int64): Unit {
        return unsafe {
            nativeAbstractTableModelBeginInsertRows(this.ptr, parent.ptr, Int32(first), Int32(last))
        }
    }

    public func endInsertRows(): Unit {
        return unsafe {
            nativeAbstractTableModelEndInsertRows(this.ptr)
        }
    }

    public func beginRemoveRows(parent: QModelIndex, first: Int64, last: Int64): Unit {
        return unsafe {
            nativeAbstractTableModelBeginRemoveRows(this.ptr, parent.ptr, Int32(first), Int32(last))
        }
    }

    public func endRemoveRows(): Unit {
        return unsafe {
            nativeAbstractTableModelEndRemoveRows(this.ptr)
        }
    }

    public func beginInsertColumns(parent: QModelIndex, first: Int64, last: Int64): Unit {
        return unsafe {
            nativeAbstractTableModelBeginInsertColumns(this.ptr, parent.ptr, Int32(first), Int32(last))
        }
    }

    public func endInsertColumns(): Unit {
        return unsafe {
            nativeAbstractTableModelEndInsertColumns(this.ptr)
        }
    }

    public func beginRemoveColumns(parent: QModelIndex, first: Int64, last: Int64): Unit {
        return unsafe {
            nativeAbstractTableModelBeginRemoveColumns(this.ptr, parent.ptr, Int32(first), Int32(last))
        }
    }

    public func endRemoveColumns(): Unit {
        return unsafe {
            nativeAbstractTableModelEndRemoveColumns(this.ptr)
        }
    }

    protected func setRowCountCallback() {
        QCoreCallbackMap.rowCountCallback.add(ptr, rowCount)
        unsafe {
            nativeAbstractTableModelSetRowCountCallback(ptr, tableRowCountCallback)
        }
    }

    protected func setColumnCountCallback() {
        QCoreCallbackMap.columnCountCallback.add(ptr, columnCount)
        unsafe {
            nativeAbstractTableModelSetColumnCountCallback(ptr, tableColumnCountCallback)
        }
    }

    protected func setDataCallback() {
        QCoreCallbackMap.dataCallback.add(ptr, data)
        unsafe {
            nativeAbstractTableModelSetDataCallback(ptr, tableDataCallback)
        }
    }

    public func rowCount(parent: QModelIndex): Int32

    public func columnCount(parent: QModelIndex): Int32

    public func data(index: QModelIndex, role: Int32): QVariant
}
