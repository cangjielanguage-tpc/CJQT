package cjqt.qt.widgets

import cjqt.qt.core.*

foreign func nativeAbstractItemViewSetModel(ptr: Int64, modelPtr: Int64): Unit
foreign func nativeAbstractItemViewModel(ptr: Int64): Int64
foreign func nativeAbstractItemViewSetItemDelegate(ptr: Int64, delegatePtr: Int64): Unit
foreign func nativeAbstractItemViewItemDelegate(ptr: Int64): Int64

public open class QAbstractItemView <: QAbstractScrollArea {

    protected init(ptr: Int64) {
        super(ptr)
    }

    public func setModel(model: QAbstractListModel)  {
        unsafe {
            nativeAbstractItemViewSetModel(this.ptr,  model.ptr)
        }
    }

    public func setModel(model: QStringListModel)  {
        unsafe {
            nativeAbstractItemViewSetModel(this.ptr,  model.ptr)
        }
    }

    public func model(): Int64 {
        let modelPtr = unsafe {
            nativeAbstractItemViewModel(this.ptr)
        }
        return modelPtr
    }

    public func setItemDelegate(delegate: QAbstractItemDelegate)  {
        unsafe {
            nativeAbstractItemViewSetItemDelegate(this.ptr,  delegate.ptr)
        }
    }

    public func itemDelegate(): Int64 {
        let delegatePtr = unsafe {
            nativeAbstractItemViewItemDelegate(this.ptr)
        }
        return delegatePtr
    }
}