/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.gui

import qt.core.*

// foreign C Functions
foreign func nativeValidatorCreate(parentPtr: Int64): Int64
foreign func nativeValidatorDelete(ptr: Int64): Unit
foreign func nativeValidatorFixup(ptr: Int64, input: CString): Unit
foreign func nativeValidatorValidate(ptr: Int64, input: CString, pos: Int32): Int32

// Signal Functions
foreign func nativeValidatorConnectChanged(ptr: Int64, code: Int64, callback: CFunc<(Int64) -> Unit>): Unit

/**
 * The enum is QValidatorState
 * @author helin
 */
public enum QValidatorState {
    Invalid | Intermediate | Acceptable

    /**
     * The Function is value
     *
     * @return Type  of  Int32
     */
    public func value(): Int32 {
        match (this) {
            case Invalid => 0
            case Intermediate => 1
            case Acceptable => 2
        }
    }

    /**
     * The Function is conver
     *
     *@param state of Int32
     *
     * @return Type  of   Enum QValidatorState
     */
     public static func convert(state: Int32): QValidatorState {
        match (state) {
            case 0 => Invalid
            case 1 => Intermediate
            case 2 => Acceptable
            case _ => Invalid
        }
    }
}

/**
 * The Class is QValidator
 * @author helin
 */
public open class QValidator {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /** let member changed type is QValidatorChangedSignal */
    public let changed: QValidatorChangedSignal

    /**
     * The Function is init constructor
     *
     *@param ptr of Int64
     */
    public init(ptr: Int64) {
        this.ptr = ptr
        changed = QValidatorChangedSignal(this.ptr)
    }

    /**
     * The Function is init constructor
     *
     */
    public init() {
        this.ptr = unsafe {
            nativeValidatorCreate(0)
        }
        changed = QValidatorChangedSignal(this.ptr)
    }

    /**
     * The Function is delete
     *
     */
    public open func delete(): Unit {
        changed.remove()
        unsafe {
            nativeValidatorDelete(this.ptr)
        }
    }

    /**
     * The Function is fixup
     *
     * @param input of String
     */
    public open func fixup(input: String) {
        unsafe {
            nativeValidatorFixup(this.ptr, CString(input))
        }
    }

    /**
     * The Function is validate
     *
     * @param input of String
     * @param pos of Int64
     *
     *@return Type of enum QValidatorState
     */
    public open func validate(input: String, pos: Int64): QValidatorState {
        let state = unsafe {
            nativeValidatorValidate(this.ptr, CString(input), Int32(pos))
        }
        return QValidatorState.convert(state)
    }
}

/**
 * The class is QValidatorChangedSignal inherited from QSignalUnit
 * @author helin
 */
public class QValidatorChangedSignal <: QSignalUnit {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("changed", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64) -> Unit>): Unit {
        unsafe {
            nativeValidatorConnectChanged(ptr, code, cb)
        }
    }
}
