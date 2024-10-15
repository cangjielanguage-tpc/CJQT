package cjqt.gui

internal import cjqt.core.*

//foreign function
foreign func nativeStandardItemModelCreate(ptr: Int64): Int64
foreign func nativeStandardItemModelCreateRC(rows:Int32,columns:Int32,ptr: Int64): Int64
foreign func nativeStandardItemModelDelete(ptr: Int64): Unit
foreign func nativeStandardItemModelSetItem(rows:Int32,columns:Int32,ptr: Int64,itemPtr: Int64): Unit

foreign func nativeStandardItemModelSetHorizontalHeaderLabels(ptr:Int64,labelsPtr:Int64): Unit
foreign func nativeStandardItemModelSetVerticalHeaderLabels(ptr:Int64,labelsPtr:Int64): Unit


foreign func nativeStandardItemModelRemoveColumn(ptr: Int64, column: Int32): Unit
foreign func nativeStandardItemModelRemoveColumns(ptr: Int64, column: Int32, count: Int32): Unit
foreign func nativeStandardItemModelRemoveRow(ptr: Int64,row: Int32): Unit
foreign func nativeStandardItemModelRemoveRows(ptr: Int64,row: Int32, count: Int32): Unit

public open class QStandardItemModel<:QAbstractItemModel {    
    public init(parent:QObject) {
        super(
            unsafe {
                nativeStandardItemModelCreate(parent.ptr)
            }
        )
    }  

    public init(ptr:Int64) {
        super(ptr)
    }   

    public init(rows:Int32,columns:Int32,parent:QObject) {
        super(
            unsafe {
                nativeStandardItemModelCreateRC(rows,columns,parent.ptr)
            }
        )
    }

    public func delete() {
        unsafe {
            nativeStandardItemModelDelete(this.ptr)
        }
    }    

    public func setItem(row:Int32,column:Int32,item:QStandardItem) {
        unsafe {
            nativeStandardItemModelSetItem(row,column,this.ptr,item.ptr)
        }
    }

    public func setHorizontalHeaderLabels(labels: QStringList){
        unsafe {
            nativeStandardItemModelSetHorizontalHeaderLabels(this.ptr,labels.ptr)
        }
    }

    public func setVerticalHeaderLabels(labels: QStringList){
        unsafe {
            nativeStandardItemModelSetVerticalHeaderLabels(this.ptr,labels.ptr)
        }
    }

    
    public func removeColumn( column: Int32): Unit {
        return unsafe {
            nativeStandardItemModelRemoveColumn(this.ptr, column)
        }
    }
    

    public func removeColumns(column: Int32, count: Int32): Unit {
        return unsafe {
            nativeStandardItemModelRemoveColumns(this.ptr, column,count)
        }
    }

    public func removeRow( row: Int32): Unit {
        return unsafe {
            nativeStandardItemModelRemoveRow(this.ptr, row)
        }
    }
    

    public func removeRows(row: Int32, count: Int32): Unit {
        return unsafe {
            nativeStandardItemModelRemoveRows(this.ptr,row,count)
        }
    }

}
