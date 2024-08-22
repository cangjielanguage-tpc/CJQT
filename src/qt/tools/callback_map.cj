/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.qt.tools

import std.collection.*

/**
 * The class is QCallbackMap
 * @author wathinst
 */
public open class QCallbackMap {
    /* let member connect */
    public static let connect = HashMap<Int64, () -> Unit>()
    /* let member connectInt64 */
    public static let connectInt64 = HashMap<Int64, (Int64) -> Unit>()
    /* let member connectInt64 */
    public static let connectInt64Int64 = HashMap<Int64, (Int64,Int64) -> Unit>()
    /* let member connectString */
    public static let connectString = HashMap<Int64, (String) -> Unit>()
    /* let member connectBool */
    public static let connectBool = HashMap<Int64, (Bool) -> Unit>()
    /* let member timer */
    public static let timer = HashMap<Int64, () -> Unit>()
    /* let member connectFloat64 */
    public static let connectFloat64 = HashMap<Int64, (Float64) -> Unit>()

    public static let connectAny = HashMap<Int64, Any>()
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
