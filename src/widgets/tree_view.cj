package cjqt.widgets

foreign func nativeTreeViewCreate(parentPtr: Int64): Int64
foreign func nativeTreeViewDelete(ptr: Int64): Unit
foreign func nativeTreeViewSetHeaderHidden(ptr: Int64,hide: Bool):Unit

public open class QTreeView <: QAbstractItemView {
    
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeTreeViewCreate(parent.ptr)
            }
        )
    }
    public init(ptr: Int64) {
        super(ptr)
        // clicked = QAbstractItemViewClickedSignal<Int64>(ptr)
    }

    public override func delete() {
        unsafe {
            nativeTreeViewDelete(ptr)
        }
    }

    public func setHeaderHidden(hide:Bool):Unit  {
        let hhPtr=unsafe {
            nativeTreeViewSetHeaderHidden(ptr,hide)
        }
        
        // return QHeaderView(hhPtr)
    }
    

}