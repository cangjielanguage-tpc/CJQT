package cjqt.core

foreign func nativeItemSelectionModelHasSelection(ptr: Int64): Bool

public open class QItemSelectionModel<:QObject {
    public init(ptr: Int64) {
        super(ptr)
    }
    
    public func hasSelection(): Bool {
        return unsafe {
            nativeItemSelectionModelHasSelection(this.ptr)
        }
    }

}
