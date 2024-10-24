package cjqt.widgets

import cjqt.core.*

foreign func nativeAbstractItemViewSetModel(ptr: Int64, modelPtr: Int64): Unit
foreign func nativeAbstractItemViewModel(ptr: Int64): Int64
foreign func nativeAbstractItemViewSetItemDelegate(ptr: Int64, delegatePtr: Int64): Unit
foreign func nativeAbstractItemViewItemDelegate(ptr: Int64): Int64
foreign func nativeAbstractItemViewSetSelectionBehavior(ptr: Int64,behavior:Int32): Unit
foreign func nativeAbstractItemViewSelectionModel(ptr: Int64): Int64

foreign func nativeAbstractItemViewConnectClicked(ptr: Int64, code: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit

public enum SelectionBehavior {
        SelectItems|        SelectRows|        SelectColumns
        /**
     * The Function is value
     *
     * @return Type  of  Int32
     */
    public func value(): Int32 {
        match (this) {
            case SelectItems => 0
            case SelectRows => 1
            case SelectColumns => 2
            case _ => 0
        }
    }

    /**
     * The Function is conver
     *
     * @param echoMode of Int32
     *
     * @return Type  of   Enum EchoMode
     */
    public static func convert(behavior: Int32): SelectionBehavior {
        match (behavior) {
            
            case 0 => SelectItems
            case 1 => SelectRows
            case 2 => SelectColumns
            case _ => SelectItems
        }
    }
    };

public open class QAbstractItemView <: QAbstractScrollArea {

    
    public let clicked: QAbstractItemViewClickedSignal<Int64>

    protected init(ptr: Int64) {
        super(ptr)
        clicked = QAbstractItemViewClickedSignal<Int64>(ptr)
    }

    public func setModel(model: QAbstractItemModel)  {
        unsafe {
            nativeAbstractItemViewSetModel(this.ptr,  model.ptr)
        }
    }

    public func model(): Int64 {
        let modelPtr = unsafe {
            nativeAbstractItemViewModel(this.ptr)
        }
        return modelPtr
    }

    public func setItemDelegate(delegate: QAbstractItemDelegate)  {
        unsafe {
            nativeAbstractItemViewSetItemDelegate(this.ptr,  delegate.ptr)
        }
    }

    public func itemDelegate(): Int64 {
        let delegatePtr = unsafe {
            nativeAbstractItemViewItemDelegate(this.ptr)
        }
        return delegatePtr
    }    

    public func setSelectionBehavior(behavior:SelectionBehavior): Unit {
        unsafe {
            nativeAbstractItemViewSetSelectionBehavior(this.ptr,behavior.value())
        }
    }
    
    public func selectionModel(): Int64 {
        unsafe {
            nativeAbstractItemViewSelectionModel(this.ptr)
        }
    }
}


public class QAbstractItemViewClickedSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    init(ptr: Int64) {
        super("clicked", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,CPointer<Unit>)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>) {
        unsafe {
            nativeAbstractItemViewConnectClicked(ptr, code, cb)
        }
        // return index
    }
}
