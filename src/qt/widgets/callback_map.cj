package qt.widgets

from std import collection.*

public class QCallbackMap {
    static let connect = HashMap<Int64, () -> Unit>()
    static let connectInt64 = HashMap<Int64, (Int64) -> Unit>()
    static let connectBool = HashMap<Int64, (Bool) -> Unit>()
}

public class QMapKey {
    public var ptr: Int64
    public var mapType: String

    public init(mapType: String, ptr: Int64) {
        this.ptr = ptr
        this.mapType = mapType
    }

    public func hashCode(): Int64 {
        let hashStr = "${mapType}${ptr}"
        return hashStr.hashCode()
    }
}
