/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
// package honeas
package cjqt.widgets

internal import cjqt.gui.*
internal import std.collection.*
internal import cjqt.tools.*
internal import cjqt.core.*

foreign func nativeDialogButtonBoxCreate(parentPtr: Int64): Int64
foreign func nativeDialogButtonBoxDelete(ptr: Int64): Unit

foreign func nativeDialogButtonBoxConnectAccepted(ptr: Int64, code: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativeDialogButtonBoxConnectRejected(ptr: Int64, code: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit


foreign func nativeDialogButtonBoxAddButton(ptr: Int64, button: Int32): Int64


public enum StandardButton {
    Ok | Open | Save | Cancel | Close | Discard | Apply | Reset | RestoreDefaults | Help | SaveAll | Yes | YesToAll | No | NoToAll | Abort | Retry | Ignore | NoButton

    /**
     * The Function is value
     *
     * @return Type  of  Int32
     */
    public func value(): Int32 {
        match (this) {
            case Ok => 0x00000400
            case Open => 0x00002000
            case Save => 0x00000800
            case Cancel => 0x00400000
            case Close => 0x00200000
            case Discard => 0x00800000
            case Apply => 0x02000000
            case Reset => 0x04000000
            case RestoreDefaults => 0x08000000
            case Help => 0x01000000
            case SaveAll => 0x00001000
            case Yes => 0x00004000
            case YesToAll => 0x00008000
            case No => 0x00010000
            case NoToAll => 0x00020000
            case Abort => 0x00040000
            case Retry => 0x00080000
            case Ignore => 0x00100000
            case NoButton => 0x00000000
            case _ => 0x00000000
        }
    }

    /**
     * The Function is conver
     *
     * @param echoMode of Int32
     *
     * @return Type  of   Enum EchoMode
     */
    public static func convert(echoMode: Int32): StandardButton {
        match (echoMode) {
            
            case 0x00000400 => Ok
            case 0x00002000 => Open
            case 0x00000800 => Save
            case 0x00400000 => Cancel
            case 0x00200000 => Close
            case 0x00800000 => Discard
            case 0x02000000 => Apply
            case 0x04000000 => Reset
            case 0x08000000 => RestoreDefaults
            case 0x01000000 => Help
            case 0x00001000 => SaveAll
            case 0x00004000 => Yes
            case 0x00008000 => YesToAll
            case 0x00010000 => No
            case 0x00020000 => NoToAll
            case 0x00040000 => Abort
            case 0x00080000 => Retry
            case 0x00100000 => Ignore
            case 0x00000000 => NoButton
            case _ => NoButton
        }
    }
}

/**
 * The class is QWidget
 * @author wathinst
 */
public open class QDialogButtonBox <: QWidget {
    /**
     * The Function is init constructor
     *
     */
         /** 动作触发信号 */
    public let accepted: QDialogButtonBoxAcceptedSignal<Bool>
    public let rejected: QDialogButtonBoxRejectedSignal<Bool>

    public init() {
        super(
            unsafe {
                nativeDialogButtonBoxCreate(0)
            }
        )
        accepted = QDialogButtonBoxAcceptedSignal<Bool>(ptr)
        rejected = QDialogButtonBoxRejectedSignal<Bool>(ptr)
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(parent: QWidget) {
        super(
            unsafe {
                nativeDialogButtonBoxCreate(parent.ptr)
            }
        )
        
        accepted = QDialogButtonBoxAcceptedSignal<Bool>(ptr)
        rejected = QDialogButtonBoxRejectedSignal<Bool>(ptr)
    }

    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super(
	    unsafe {
                nativeDialogButtonBoxCreate(ptr)
            }
	    )
        
        accepted = QDialogButtonBoxAcceptedSignal<Bool>(ptr)
        rejected = QDialogButtonBoxRejectedSignal<Bool>(ptr)
    }


    /**
     * The Function is delete
     *
     */
    public open func delete() {
        // QWidgetCallbackMap.paintersEvent.remove(ptr)
        // QWidgetCallbackMap.mousePressEvent.remove(ptr)
        // QWidgetCallbackMap.mouseReleaseEvent.remove(ptr)
        // QWidgetCallbackMap.mouseMoveEvent.remove(ptr)
        // QWidgetCallbackMap.keyPressEvent.remove(ptr)
        unsafe {
            // nativeDialogDelete(ptr)
        }
    } /**
     * The Function is delete
     *
    //  */
   
    /**
     * The Function is setEchMod
     *
     * @param echMode of Enum EchoMode
     */
    public func addButton(button: StandardButton): Unit {
        let prt=unsafe {
            nativeDialogButtonBoxAddButton(this.ptr, button.value())
        }
        // return QPushButton(prt)
    }

}

/**
 * 动作触发的信号类
 * @author wathinst
 */
public class QDialogButtonBoxAcceptedSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    init(ptr: Int64) {
        super("accepted", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,CPointer<Unit>)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>) {
        unsafe {
            nativeDialogButtonBoxConnectAccepted(ptr, code, cb)
        }
    }
}
    
/**
 * 动作触发的信号类
 * @author wathinst
 */
public class QDialogButtonBoxRejectedSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    init(ptr: Int64) {
        super("rejected", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,CPointer<Unit>)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>) {
        unsafe {
            nativeDialogButtonBoxConnectRejected(ptr, code, cb)
        }
    }
}

