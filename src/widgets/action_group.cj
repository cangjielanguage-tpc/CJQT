package cjqt.widgets

import cjqt.core.QObject

//foreign function 
foreign func nativeActionGroupCreate(parentPtr: Int64): Int64
foreign func nativeActionGroupDelete(ptr: Int64): Unit
foreign func nativeActionGroupAddAction(ptr: Int64, actionPtr: Int64): Int64

public open class QActionGroup <: QObject {
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(parent: QObject) {
        super(unsafe { nativeActionGroupCreate(parent.ptr) })
    }

    public open func delete(): Unit {
        unsafe { nativeActionGroupDelete(this.ptr) }
    }

    public func addAction(action: QAction): QAction {
        let actionPtr = unsafe {
            nativeActionGroupAddAction(this.ptr, action.ptr)
        }
        return QAction(actionPtr)
    }
}
