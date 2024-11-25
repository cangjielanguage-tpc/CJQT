/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.gui
import cjqt.tools.*

@C
func connectUnitCallback(code: Int64): Unit {
    try {
        QCallbackMap.connect[code]()
    } catch (e: Exception) {
        println(e)
    }
}

@C
func connectInt64Callback(code: Int64, data: Int32): Unit {
    try {
        QCallbackMap.connectInt64[code](Int64(data))
    } catch (e: Exception) {
        println(e)
    }
}

@C
func connectBoolCallback(code: Int64, data: Bool): Unit {
    try {
        QCallbackMap.connectBool[code](data)
    } catch (e: Exception) {
        println(e)
    }
}

@C
func connectCStringCallback(code: Int64, data: CString): Unit {
    try {
        QCallbackMap.connectString[code](data.toString())
    } catch (e: Exception) {
        println(e)
    }
}

@C
func connectInt32Int32Callback(code: Int64, data1: Int32, data2: Int32): Unit {
    try {
        QCallbackMap.connectInt64Int64[code](Int64(data1), Int64(data2))
    } catch (e: Exception) {
        println(e)
    }
}

@C
func connectFloat64Callback(code: Int64, data: Float64): Unit {
    try {
        QCallbackMap.connectFloat64[code](data)
    } catch (e: Exception) {
        println(e)
    }
}

/**
 * The class is QSignal
 * @author wathinst
 */
public open class QSignal {
    /* let member ptr type is Int64 */
    protected let ptr: Int64
    /* let member ptr type is Int64 */

    /* let member signalType type is String */
    protected let signalType: String

    /**
     * The Function is init constructor
     *
     * @param signalType of String
     * @param ptr of Int64
     */
    public init(signalType: String, ptr: Int64) {
        this.ptr = ptr
        this.signalType = signalType
    }

    /**
     * The Function is remove
     *
     */
    public open func remove() {}
}

/**
 * The class is QSignalUnit inherited from QSignal
 * @author wathinst
 */
public open class QSignalUnit <: QSignal {
    /**
     * The Function is init constructor
     *
     * @param signalType of String
     * @param ptr of Int64
     */
    public init(signalType: String, ptr: Int64) {
        super(signalType, ptr)
    }

    /**
     * The Function is remove
     *
     */
    public open override func remove() {
        QCallbackMap.connect.remove(QMapKey(signalType, ptr.toString()).hashCode())
        return
    }

    /**
     * The Function is connect
     *
     * @param callback of ()->Unit
     */
    public func connect(callback: () -> Unit) {
        QCallbackMap.connect.put(QMapKey(signalType, ptr.toString()).hashCode(), callback)
        nativeConnect(QMapKey(signalType, ptr.toString()).hashCode(), connectUnitCallback)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64)->Unit>
     */
    public open func nativeConnect(code: Int64, cb: CFunc<(Int64) -> Unit>) {}
}

/**
 * The class is QSignalInt64 inherited from QSignal
 * @author wathinst
 */
public open class QSignalInt64 <: QSignal {
    /**
     * The Function is init constructor
     *
     * @param signalType of String
     * @param ptr of Int64
     */
    public init(signalType: String, ptr: Int64) {
        super(signalType, ptr)
    }

    /**
     * The Function is remove
     *
     */
    public open override func remove() {
        QCallbackMap.connect.remove(QMapKey(signalType, ptr.toString()).hashCode())
        return
    }

    /**
     * The Function is connect
     *
     * @param callback of (Int64)->Unit
     */
    public func connect(callback: (Int64) -> Unit) {
        QCallbackMap.connectInt64.put(QMapKey(signalType, ptr.toString()).hashCode(), callback)
        nativeConnect(QMapKey(signalType, ptr.toString()).hashCode(), connectInt64Callback)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,Int32)->Unit>
     */
    public open func nativeConnect(code: Int64, cb: CFunc<(Int64, Int32) -> Unit>) {}
}

/**
 * The class is QSignalBool inherited from QSignal
 * @author wathinst
 */
public open class QSignalBool <: QSignal {
    /**
     * The Function is init constructor
     *
     * @param signalType of String
     * @param ptr of Int64
     */
    public init(signalType: String, ptr: Int64) {
        super(signalType, ptr)
    }

    /**
     * The Function is remove
     *
     */
    public open override func remove() {
        QCallbackMap.connect.remove(QMapKey(signalType, ptr.toString()).hashCode())
        return
    }

    /**
     * The Function is connect
     *
     * @param callback of (Bool)->Unit
     */
    public func connect(callback: (Bool) -> Unit) {
        QCallbackMap.connectBool.put(QMapKey(signalType, ptr.toString()).hashCode(), callback)
        nativeConnect(QMapKey(signalType, ptr.toString()).hashCode(), connectBoolCallback)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,Bool)->Unit>
     */
    public open func nativeConnect(code: Int64, cb: CFunc<(Int64, Bool) -> Unit>) {}
}

/**
 * The class is QSignalInt64Int64 inherited from QSignal
 * @author helin
 */
public open class QSignalInt64Int64 <: QSignal {
    /**
     * The Function is init constructor
     *
     * @param signalType of String
     * @param ptr of Int64
     */
    public init(signalType: String, ptr: Int64) {
        super(signalType, ptr)
    }

    /**
     * The Function is remove
     *
     */
    public open override func remove() {
        QCallbackMap.connect.remove(QMapKey(signalType, ptr.toString()).hashCode())
        return
    }

    /**
     * The Function is connect
     *
     * @param callback of (Int64,Int64)->Unit
     */
    public func connect(callback: (Int64, Int64) -> Unit) {
        QCallbackMap.connectInt64Int64.put(QMapKey(signalType, ptr.toString()).hashCode(), callback)
        nativeConnect(QMapKey(signalType, ptr.toString()).hashCode(), connectInt32Int32Callback)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,Int32,Int32)->Unit>
     */
    public open func nativeConnect(code: Int64, cb: CFunc<(Int64, Int32, Int32) -> Unit>) {}
}

/**
 * The class is QSignalCString inherited from QSignal
 * @author helin
 */
public open class QSignalString <: QSignal {
    /**
     * The Function is init constructor
     *
     * @param signalType of String
     * @param ptr of Int64
     */
    public init(signalType: String, ptr: Int64) {
        super(signalType, ptr)
    }

    /**
     * The Function is remove
     *
     */
    public open override func remove() {
        QCallbackMap.connect.remove(QMapKey(signalType, ptr.toString()).hashCode())
        return
    }

    /**
     * The Function is connect
     *
     * @param callback of (String)->Unit
     */
    public func connect(callback: (String) -> Unit) {
        QCallbackMap.connectString.put(QMapKey(signalType, ptr.toString()).hashCode(), callback)
        nativeConnect(QMapKey(signalType, ptr.toString()).hashCode(), connectCStringCallback)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,CString)->Unit>
     */
    public open func nativeConnect(code: Int64, cb: CFunc<(Int64, CString) -> Unit>) {}
}

/**
 * The class is QSignalFloat64 inherited from QSignal
 * @author helin
 */
public open class QSignalFloat64 <: QSignal {
    /**
     * The Function is init constructor
     *
     * @param signalType of String
     * @param ptr of Int64
     */
    public init(signalType: String, ptr: Int64) {
        super(signalType, ptr)
    }

    /**
     * The Function is remove
     *
     */
    public open override func remove() {
        QCallbackMap.connect.remove(QMapKey(signalType, ptr.toString()).hashCode())
        return
    }

    /**
     * The Function is connect
     *
     * @param callback of (Float64)->Unit
     */
    public func connect(callback: (Float64) -> Unit) {
        QCallbackMap.connectFloat64.put(QMapKey(signalType, ptr.toString()).hashCode(), callback)
        nativeConnect(QMapKey(signalType, ptr.toString()).hashCode(), connectFloat64Callback)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,Float64)->Unit>
     */
    public open func nativeConnect(code: Int64, cb: CFunc<(Int64, Float64) -> Unit>) {}
}
