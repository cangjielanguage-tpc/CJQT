package qt.widgets

foreign func nativeAbstractItemDelegateCreate(): Int64
foreign func nativeAbstractItemDelegateDelete(ptr: Int64): Unit

foreign func nativeAbstractItemDelegateSetPaintCallback(ptr: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativeAbstractItemDelegateSetSizeHintCallback(ptr: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Int64>): Unit

@c
func abstractItemDelegatePaintCallback(ptr: Int64, dataPtr: CPointer<Unit>): Unit {
    let data = QConversion.cPointerToCjDataLongLongLong(dataPtr)
    let painter = QPainter(ptr: data.p1)
    let index = QModelIndex(data.p3)
    try {
        QWidgetCallbackMap.paintCallback[ptr](painter, index)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func abstractItemDelegateSizeHintCallback(ptr: Int64, dataPtr: CPointer<Unit>): Int64 {
    let data = QConversion.cPointerToCjDataLongLong(dataPtr)
    let index = QModelIndex(data.p2)
    try {
        return QWidgetCallbackMap.sizeHintCallback[ptr](index).ptr
    } catch (e: Exception) {
        println(e)
    }
    return 0
}

public abstract class QAbstractItemDelegate {
    public let ptr: Int64

    public init() {
        this.ptr = unsafe {
            nativeAbstractItemDelegateCreate()
        }
        //setPaint()
        //setSizeHint()
    }

    public init(ptr: Int64) {
        this.ptr = ptr
        //setPaint()
        //setSizeHint()
    }

    public open func delete(): Unit {
        QWidgetCallbackMap.paintCallback.remove(ptr)
        QWidgetCallbackMap.sizeHintCallback.remove(ptr)
        return unsafe {
            nativeAbstractItemDelegateDelete(this.ptr)
        }
    }

    protected open func setPaint() {
        QWidgetCallbackMap.paintCallback.put(ptr, paint)
        unsafe {
            nativeAbstractItemDelegateSetPaintCallback(ptr, abstractItemDelegatePaintCallback)
        }
    }

    protected open func setSizeHint() {
        QWidgetCallbackMap.sizeHintCallback.put(ptr, sizeHint)
        unsafe {
            nativeAbstractItemDelegateSetSizeHintCallback(ptr, abstractItemDelegateSizeHintCallback)
        }
    }

    public func paint(painter: QPainter, index: QModelIndex): Unit

    public func sizeHint(index: QModelIndex): QSize
}