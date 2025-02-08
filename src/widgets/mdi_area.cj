package cjqt.widgets

import cjqt.gui.*

foreign func nativeMdiAreaCreate(parentPtr: Int64): Int64
foreign func nativeMdiAreaSetBackground(ptr: Int64,bgPtr: Int64):Unit

foreign func nativeMdiAreaDelete(ptr: Int64): Unit

public class QMdiArea <: QAbstractScrollArea {
    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(unsafe {
            nativeMdiAreaCreate(0)
        })
    }
    public init(parent: QWidget) {
        super(unsafe {
            nativeMdiAreaCreate(parent.ptr)
        })
    }
    public init(ptr:Int64) {
        super(ptr)
    }
    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeMdiAreaDelete(ptr)
        }
    }
    
 
    public func setBackground(bg:QBrush):Unit{
        unsafe {
            nativeMdiAreaSetBackground(this.ptr,bg.ptr)
        }

    }

}