package cjqt.widgets

foreign func nativeTableViewCreate(parentPtr: Int64): Int64
foreign func nativeTableViewDelete(ptr: Int64): Unit
foreign func nativeTableViewVerticalHeader(ptr: Int64):Int64
foreign func nativeTableViewHorizontalHeader(ptr: Int64):Int64


public open class QTableView <: QAbstractItemView {
    
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeTableViewCreate(parent.ptr)
            }
        )
    }
    public init(ptr:Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeTableViewDelete(ptr)
        }
    }

    public func verticalHeader():QHeaderView  {
        let vhPtr=unsafe {
            nativeTableViewVerticalHeader(ptr)
        }
        
        return QHeaderView(vhPtr)
    }
    public func horizontalHeader():QHeaderView  {
        let hhPtr=unsafe {
            nativeTableViewHorizontalHeader(ptr)
        }
        
        return QHeaderView(hhPtr)
    }
    

}