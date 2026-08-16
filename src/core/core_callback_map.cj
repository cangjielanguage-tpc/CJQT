package cjqt.core

import std.collection.*
import cjqt.tools.QCallbackMap

public class QCoreCallbackMap <: QCallbackMap {
    /* let member rowCountCallback */
    public static let rowCountCallback = HashMap<Int64, (QModelIndex) -> Int32>()
    /* let member columnCountCallback */
    public static let columnCountCallback = HashMap<Int64, (QModelIndex) -> Int32>()
    /* let member dataCallback */
    public static let dataCallback = HashMap<Int64, (QModelIndex, Int32) -> QVariant>()
}