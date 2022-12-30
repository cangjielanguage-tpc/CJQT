package qt.core

from std import collection.*

public class QCoreCallbackMap <: QCallbackMap {
    /* let member rowCountCallback */
    public static let rowCountCallback = HashMap<Int64, (QModelIndex) -> Int32>()
    /* let member dataCallback */
    public static let dataCallback = HashMap<Int64, (QModelIndex, Int32) -> Int64>()
}