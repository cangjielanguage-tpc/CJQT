package qt.widgets

public open class QLayout {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public open func delete() {}
}
