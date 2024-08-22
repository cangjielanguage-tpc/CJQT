package cjqt.qt.widgets

import cjqt.qt.gui.*
import cjqt.qt.core.*
import cjqt.qt.tools.*

foreign func nativeStyledItemDelegateCreate(): Int64
foreign func nativeStyledItemDelegateDelete(ptr: Int64): Unit

foreign func nativeStyledItemDelegateSetPaintCallback(ptr: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativeStyledItemDelegateSetSizeHintCallback(ptr: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Int64>): Unit

@C
func styledItemDelegatePaintCallback(ptr: Int64, dataPtr: CPointer<Unit>): Unit {
    let data = QConversion.cPointerToCjDataLongLongLong(dataPtr)
    let painter = QPainter(ptr: data.p1)
    let index = QModelIndex(data.p3)
    try {
        QWidgetCallbackMap.paintCallback[ptr](painter, index)
    } catch (e: Exception) {
        println(e)
    }
}

@C
func styledItemDelegateSizeHintCallback(ptr: Int64, dataPtr: CPointer<Unit>): Int64 {
    let data = QConversion.cPointerToCjDataLongLong(dataPtr)
    let index = QModelIndex(data.p2)
    try {
        return QWidgetCallbackMap.sizeHintCallback[ptr](index).ptr
    } catch (e: Exception) {
        println(e)
    }
    return 0
}

public open class QStyledItemDelegate <: QAbstractItemDelegate {
    public init() {
        super(
            unsafe {
                nativeStyledItemDelegateCreate()
            }
        )
        //setPaint()
        //setSizeHint()
    }

    public init(ptr: Int64) {
        super(ptr)
        //setPaint()
        //setSizeHint()
    }

    public open func delete(): Unit {
        QWidgetCallbackMap.paintCallback.remove(ptr)
        QWidgetCallbackMap.sizeHintCallback.remove(ptr)
        return unsafe {
            nativeStyledItemDelegateDelete(this.ptr)
        }
    }

    protected func setPaint() {
        QWidgetCallbackMap.paintCallback.put(ptr, paint)
        unsafe {
            nativeStyledItemDelegateSetPaintCallback(ptr, styledItemDelegatePaintCallback)
        }
    }

    protected func setSizeHint() {
        QWidgetCallbackMap.sizeHintCallback.put(ptr, sizeHint)
        unsafe {
            nativeStyledItemDelegateSetSizeHintCallback(ptr, styledItemDelegateSizeHintCallback)
        }
    }

    public open func paint(painter: QPainter, index: QModelIndex): Unit {}

    public open func sizeHint(index: QModelIndex): QSize {
        return QSize()
    }
}
