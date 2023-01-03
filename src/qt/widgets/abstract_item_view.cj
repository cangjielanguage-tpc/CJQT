package qt.widgets

foreign func nativeAbstractItemViewSetModel(ptr: Int64, modelPtr: Int64): Unit
foreign func nativeAbstractItemViewModel(ptr: Int64): Int64
foreign func nativeAbstractItemViewSetItemDelegate(ptr: Int64, delegatePtr: Int64): Unit
foreign func nativeAbstractItemViewItemDelegate(ptr: Int64): Int64

public open class QAbstractItemView <: QAbstractScrollArea {

    protected init(ptr: Int64) {
        super(ptr)
    }

    public func setModel(modelPtr: Int64)  {
        unsafe {
            nativeAbstractItemViewSetModel(this.ptr,  modelPtr)
        }
    }

    public func model(): Int64 {
        let modelPtr = unsafe {
            nativeAbstractItemViewModel(this.ptr)
        }
        return modelPtr
    }

    public func setItemDelegate(delegatePtr: Int64)  {
        unsafe {
            nativeAbstractItemViewSetItemDelegate(this.ptr,  delegatePtr)
        }
    }

    public func itemDelegate(): Int64 {
        let delegatePtr = unsafe {
            nativeAbstractItemViewItemDelegate(this.ptr)
        }
        return delegatePtr
    }
}