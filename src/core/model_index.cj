package cjqt.core


foreign func nativeModelIndexCreate(): Int64
foreign func nativeModelIndexDelete(ptr: Int64): Unit
foreign func nativeModelIndexRow(ptr: Int64): Int32
foreign func nativeModelIndexColumn(ptr: Int64): Int32
foreign func nativeModelIndexIsValid(ptr: Int64): Bool
foreign func nativeModelIndexModel(ptr: Int64): Int64
foreign func nativeModelIndexData(ptr: Int64): CString


public open class QModelIndex {
    public let ptr: Int64

    private var irow:Int32=-1

    private var icol:Int32=-1

    public init() {
        this.ptr = unsafe {
            nativeModelIndexCreate()
        }
    }

    public init(ptr:Int64){
        this.ptr=ptr
    }

    public open func delete(): Unit {
        return unsafe {
            nativeModelIndexDelete(this.ptr)
        }
    }

    public func row(): Int32 {
        if(irow>-1){
            return irow;
        }
        return unsafe {
            nativeModelIndexRow(this.ptr)
        }
    }

    public func column(): Int32 {
        if(icol>-1){
            return icol;
        }
        return unsafe {
            nativeModelIndexColumn(this.ptr)
        }
    }
    public func setIrow(irow:Int32){
        this.irow=irow
    }
    
    public func setIcol(icol:Int32){
        this.icol=icol
    }

    public func isValid(): Bool {
        return unsafe {
            nativeModelIndexIsValid(this.ptr)
        }
    }
    public func model(): QAbstractItemModel {
        let modelPtr=unsafe {
            nativeModelIndexModel(this.ptr)
        }
        return QAbstractItemModel(modelPtr)
    }

    public func data(): String {
        println("data:"+this.ptr.toString())
        let str=unsafe {
            nativeModelIndexData(this.ptr)
        }   
        println("str:${str}")     
        // return QVariant(QConversion.intToCPointer(dataPtr))
        return str.toString()
    }
}