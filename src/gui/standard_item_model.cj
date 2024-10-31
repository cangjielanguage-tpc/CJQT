package cjqt.gui

internal import cjqt.core.*

//foreign function
foreign func nativeStandardItemModelCreate(ptr: Int64): Int64
foreign func nativeStandardItemModelCreateRC(rows:Int32,columns:Int32,ptr: Int64): Int64
foreign func nativeStandardItemModelDelete(ptr: Int64): Unit
foreign func nativeStandardItemModelSetItem(ptr: Int64,rows:Int32,columns:Int32,itemPtr: Int64): Unit
foreign func nativeStandardItemModelItem(ptr: Int64,row:Int32,column:Int32): Int64

foreign func nativeStandardItemModelSetHorizontalHeaderLabels(ptr:Int64,labelsPtr:Int64): Unit
foreign func nativeStandardItemModelSetVerticalHeaderLabels(ptr:Int64,labelsPtr:Int64): Unit


foreign func nativeStandardItemModelRemoveColumn(ptr: Int64, column: Int32): Unit
foreign func nativeStandardItemModelRemoveColumns(ptr: Int64, column: Int32, count: Int32): Unit
foreign func nativeStandardItemModelRemoveRow(ptr: Int64,row: Int32): Unit
foreign func nativeStandardItemModelRemoveRows(ptr: Int64,row: Int32, count: Int32): Unit

foreign func nativeStandardItemModelAppendRow(ptr:Int64,itemsPtr:Int64): Unit
foreign func nativeStandardItemModelAppendRowItems(ptr:Int64,itemsPtr:Int64): Unit
foreign func nativeStandardItemModelAppendColumn(ptr:Int64,itemsPtr:Int64): Unit
foreign func nativeStandardItemModelInsertRow(ptr:Int64,row:Int32,itemsPtr:Int64): Unit
foreign func nativeStandardItemModelInsertColumn(ptr:Int64,column:Int32,itemsPtr:Int64): Unit

foreign func nativeStandardItemModelItemFromIndex(ptr:Int64,indexPtr:Int64):Int64

public open class QStandardItemModel<:QAbstractItemModel {    
    public init(parent:QObject) {
        super(
            unsafe {
                nativeStandardItemModelCreate(parent.ptr)
            }
        )
    }   
    public init() {
        super(
            unsafe {
                nativeStandardItemModelCreate(0)
            }
        )
    }  

    public init(ptr:Int64) {
        super(ptr)
    }   

    public init(rows:Int32,columns:Int32) {
        super(
            unsafe {
                nativeStandardItemModelCreateRC(rows,columns,0)
            }
        )
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

    public func item(row:Int32,column:Int32) {
        unsafe {
            nativeStandardItemModelItem(this.ptr,row,column)
        }
    }

    public func setItem(row:Int32,column:Int32,item:QStandardItem) {
        unsafe {
            nativeStandardItemModelSetItem(this.ptr,row,column,item.ptr)
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
    public func appendRow(items:QStringList){
        return unsafe {
            nativeStandardItemModelAppendRowItems(this.ptr,items.ptr)
        }
    }
    
    public func appendRow(item:QStandardItem){
        return unsafe {
            nativeStandardItemModelAppendRow(this.ptr,item.ptr)
        }
    }
    public func appendColumn(items:QStringList){
        return unsafe {
            nativeStandardItemModelAppendColumn(this.ptr,items.ptr)
        }
    }
    public func insertRow(row:Int32, items:QStringList){
        return unsafe {
            nativeStandardItemModelInsertRow(this.ptr,row,items.ptr)
        }
    }

    public func insertColumn(column:Int32, items:QStringList){
        return unsafe {
            nativeStandardItemModelInsertColumn(this.ptr,column,items.ptr)
        }
    }
    public func itemFromIndex(index:QModelIndex):QStandardItem{
        let itemPtr= unsafe {
            nativeStandardItemModelItemFromIndex(this.ptr,index.ptr)
        }
        return QStandardItem(itemPtr)
    }


}
