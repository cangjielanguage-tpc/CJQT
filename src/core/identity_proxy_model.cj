package cjqt.core

foreign func nativeIdentityProxyModelCreate(parentPtr: Int64): Int64
foreign func nativeIdentityProxyModelDelete(ptr: Int64): Unit
foreign func nativeIdentityProxyModelSetSourceModel(ptr: Int64, sourcePtr: Int64): Unit

public class QIdentityProxyModel <: QAbstractItemModel {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeIdentityProxyModelCreate(0) })
    }

    public override func delete() {
        unsafe { nativeIdentityProxyModelDelete(ptr) }
    }

    public func setSourceModel(source: QAbstractItemModel) {
        unsafe { nativeIdentityProxyModelSetSourceModel(ptr, source.ptr) }
    }
}
