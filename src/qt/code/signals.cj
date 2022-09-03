/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.code

from std import collection.*

/**
 * The class is QCallbackMap
 * @author wathinst
 */
public class QCallbackMap {
    /* let member connect */
    static let connect = HashMap<Int64, () -> Unit>()

    /* let member connectInt64 */
    static let connectInt64 = HashMap<Int64, (Int64) -> Unit>()

    /* let member connectInt64 */
    static let connectInt64Int64 = HashMap<Int64, (Int64, Int64) -> Unit>()

    /* let member connectCString */
    static let connectCString = HashMap<Int64, (CString) -> Unit>()

    /* let member connectBool */
    static let connectBool = HashMap<Int64, (Bool) -> Unit>()
}

/**
 * The class is QMapKey
 * @author wathinst
 */
public class QMapKey {
    /** var member ptr type is Int64 */
    public var ptr: Int64

    /** var member mapType type is String */
    public var mapType: String

    /**
     * The Function is init constructor
     *
     * @param mapType of String
     * @param ptr of Int64
     */
    public init(mapType: String, ptr: Int64) {
        this.ptr = ptr
        this.mapType = mapType
    }

    /**
     * The Function is hashCode
     *
     * @return Type of Int64
     */
    public func hashCode(): Int64 {
        let hashStr = "${mapType}${ptr}"
        return hashStr.hashCode()
    }
}

/**
 * The class is QSignal
 * @author wathinst
 */
public open class QSignal {
    /* let member ptr type is Int64 */
    protected let ptr: Int64

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
    public override open func remove() {
        QCallbackMap.connect.remove(QMapKey(signalType, ptr).hashCode())
        return
    }

    /**
     * The Function is connect
     *
     * @param callback of ()->Unit
     */
    public func connect(callback: () -> Unit) {
        QCallbackMap.connect.put(QMapKey(signalType, ptr).hashCode(), callback)
        let cb: CFunc<(Int64) -> Unit> = {
            code => try {
                QCallbackMap.connect[code]()
            } catch (e: Exception) {
                println(e)
            }
        }
        nativeConnect(QMapKey(signalType, ptr).hashCode(), cb)
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
    public override open func remove() {
        QCallbackMap.connect.remove(QMapKey(signalType, ptr).hashCode())
        return
    }

    /**
     * The Function is connect
     *
     * @param callback of (Int64)->Unit
     */
    public func connect(callback: (Int64) -> Unit) {
        QCallbackMap.connectInt64.put(QMapKey(signalType, ptr).hashCode(), callback)
        let cb: CFunc<(Int64, Int32) -> Unit> = {
            code, data => try {
                QCallbackMap.connectInt64[code](Int64(data))
            } catch (e: Exception) {
                println(e)
            }
        }
        nativeConnect(QMapKey(signalType, ptr).hashCode(), cb)
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
    public override open func remove() {
        QCallbackMap.connect.remove(QMapKey(signalType, ptr).hashCode())
        return
    }

    /**
     * The Function is connect
     *
     * @param callback of (Bool)->Unit
     */
    public func connect(callback: (Bool) -> Unit) {
        QCallbackMap.connectBool.put(QMapKey(signalType, ptr).hashCode(), callback)
        let cb: CFunc<(Int64, Bool) -> Unit> = {
            code, data => try {
                QCallbackMap.connectBool[code](data)
            } catch (e: Exception) {
                println(e)
            }
        }
        nativeConnect(QMapKey(signalType, ptr).hashCode(), cb)
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
    public override open func remove() {
        QCallbackMap.connect.remove(QMapKey(signalType, ptr).hashCode())
        return
    }

    /**
     * The Function is connect
     *
     * @param callback of (Int64,Int64)->Unit
     */
    public func connect(callback: (Int64, Int64) -> Unit) {
        QCallbackMap.connectInt64Int64.put(QMapKey(signalType, ptr).hashCode(), callback)
        let cb: CFunc<(Int64, Int32, Int32) -> Unit> = {
            code, data1, data2 => try {
                QCallbackMap.connectInt64Int64[code](Int64(data1), Int64(data2))
            } catch (e: Exception) {
                println(e)
            }
        }
        nativeConnect(QMapKey(signalType, ptr).hashCode(), cb)
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
public open class QSignalCString <: QSignal {
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
    public override open func remove() {
        QCallbackMap.connect.remove(QMapKey(signalType, ptr).hashCode())
        return
    }

    /**
     * The Function is connect
     *
     * @param callback of (CString)->Unit
     */
    public func connect(callback: (CString) -> Unit) {
        QCallbackMap.connectCString.put(QMapKey(signalType, ptr).hashCode(), callback)
        let cb: CFunc<(Int64, CString) -> Unit> = {
            code, data1 => try {
                QCallbackMap.connectCString[code](data1)
            } catch (e: Exception) {
                println(e)
            }
        }
        nativeConnect(QMapKey(signalType, ptr).hashCode(), cb)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,CString)->Unit>
     */
    public open func nativeConnect(code: Int64, cb: CFunc<(Int64, CString) -> Unit>) {}
}
