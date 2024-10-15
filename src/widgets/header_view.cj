package cjqt.widgets

foreign func nativeHeaderViewCreate(orientation:Int16,parentPtr: Int64): Int64
foreign func nativeHeaderViewDelete(ptr: Int64): Unit
foreign func nativeHeaderViewSetSectionResizeMode(ptr: Int64,index:Int32,resizeMode:Int32): Unit
foreign func nativeHeaderViewResizeSection(ptr: Int64,index:Int32,size:Int32): Unit


public enum ResizeMode {
    Interactive | Fixed | Stretch | ResizeToContents

    /**
     * The Function is value
     *
     * @return Type  of  Int32
     */
    public func value(): Int32 {
        match (this) {
            case Interactive => 0
            case Fixed => 1
            case Stretch => 2
            case ResizeToContents => 3
        }
    }

    /**
     * The Function is conver
     *
     * @param echoMode of Int32
     *
     * @return Type  of   Enum EchoMode
     */
    public static func convert(resizeMode: Int32): ResizeMode {
        match (resizeMode) {
            case 0 => Interactive
            case 1 => Fixed
            case 2 => Stretch
            case 3 => ResizeToContents
            case _ => Interactive
        }
    }
}


public open class QHeaderView <: QAbstractItemView {
    
    
    public init(ptr:Int64) {
        super(ptr)
    }
    
    public init(orientation:Orientation,parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeHeaderViewCreate(orientation.value(),parent.ptr)
            }
        )
    }

    public override func delete() {
        unsafe {
            nativeHeaderViewDelete(ptr)
        }
    }

    public  func setSectionResizeMode(index:Int32,resizeMode:ResizeMode) {
        unsafe {
            nativeHeaderViewSetSectionResizeMode(this.ptr,index,resizeMode.value())
        }
    }
    
    public  func resizeSection(index:Int32,size:Int32) {
        unsafe {
            nativeHeaderViewResizeSection(this.ptr,index,size)
        }
    }

}