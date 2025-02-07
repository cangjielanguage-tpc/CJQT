package cjqt.gui

//foreign function
foreign func nativeStandardItemCreate(): Int64
foreign func nativeStandardItemCreateText(text: CString): Int64
foreign func nativeStandardItemCreateIcon(iconPtr: Int64,text:CString): Int64
foreign func nativeStandardItemCreateRC(rows:Int32,columns:Int32): Int64
foreign func nativeStandardItemDelete(ptr: Int64): Unit
foreign func nativeStandardItemAppendRow(ptr:Int64,itemsPtr:Int64): Unit

public open class QStandardItem {    
    public let ptr: Int64

    public init() {
        this.ptr = unsafe {
            nativeStandardItemCreate()
        }
    }
    
    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(text:String) {
         unsafe {
            let t =LibC.mallocCString(text)
            this.ptr =nativeStandardItemCreateText(t)
            LibC.free(t)
        }
    }    
    
    public init(icon:QIcon,text:String) {
         unsafe {
            let t =LibC.mallocCString(text)
            this.ptr = nativeStandardItemCreateIcon(icon.ptr,t)
            LibC.free(t)
        }
    }

    public init(rows:Int32,columns:Int32) {
        this.ptr = unsafe {
            nativeStandardItemCreateRC(rows,columns)
        }
    }

    public func delete() {
        unsafe {
            nativeStandardItemDelete(this.ptr)
        }
    }
    
    public func appendRow(item:QStandardItem){
        return unsafe {
            nativeStandardItemAppendRow(this.ptr,item.ptr)
        }
    }

}
