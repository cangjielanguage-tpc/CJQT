package cjqt.core

foreign func nativeAbstractItemModelIndex(ptr: Int64,row:Int32, column:Int32, parent:Int64): Int64
foreign func nativeAbstractItemModelData(ptr: Int64,index: Int64,role:Int32): Int64

public open class QAbstractItemModel<:QObject {
    public init(ptr: Int64) {
        super(ptr)
    }
    
    public func index(row:Int32, column:Int32): QModelIndex {
        var ptr=  unsafe {
            nativeAbstractItemModelIndex(this.ptr, row, column, 0)
        }
        var model= QModelIndex(ptr)
        model.setIrow(row)
        model.setIcol(column)
        return model
    }
    
    public func index(row:Int32, column:Int32, parent:Int64): QModelIndex {
        var ptr= unsafe {
            nativeAbstractItemModelIndex(this.ptr, row, column, parent)
        }
        var model= QModelIndex(ptr)
        model.setIrow(row)
        model.setIcol(column)
        return model
    }
    
    public func data(index:Int64,role!:Int32=0):Int64{
        return unsafe {
            nativeAbstractItemModelData(this.ptr,index,role)
        }
    }

    


}
