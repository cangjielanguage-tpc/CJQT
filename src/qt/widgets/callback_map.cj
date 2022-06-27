package qt.widgets

from std import collection.*

public class QCallbackMap {
    static let connect = HashMap<Int64, () -> Unit>()
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
