package cjqt.core

foreign func nativeSortFilterProxyModelCreate(parentPtr: Int64): Int64
foreign func nativeSortFilterProxyModelDelete(ptr: Int64): Unit
foreign func nativeSortFilterProxyModelSetFilterRegExp(ptr: Int64, pattern: CString): Unit
foreign func nativeSortFilterProxyModelSetFilterKeyColumn(ptr: Int64, column: Int32): Unit
foreign func nativeSortFilterProxyModelFilterKeyColumn(ptr: Int64): Int32
foreign func nativeSortFilterProxyModelSetDynamicSortFilter(ptr: Int64, b: Bool): Unit
foreign func nativeSortFilterProxyModelSetSortRole(ptr: Int64, role: Int32): Unit
foreign func nativeSortFilterProxyModelSortRole(ptr: Int64): Int32
foreign func nativeSortFilterProxyModelSort(ptr: Int64, column: Int32, order: Int32): Unit
foreign func nativeSortFilterProxyModelSetSourceModel(ptr: Int64, sourcePtr: Int64): Unit

public enum QSortOrder {
    | AscendingOrder
    | DescendingOrder

    public func value(): Int32 {
        return match (this) {
            case AscendingOrder => 0
            case DescendingOrder => 1
        }
    }
}

public class QSortFilterProxyModel <: QAbstractItemModel {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeSortFilterProxyModelCreate(0) })
    }

    public override func delete() {
        unsafe { nativeSortFilterProxyModelDelete(ptr) }
    }

    public func setFilterRegExp(pattern: String) {
        unsafe {
            let p = LibC.mallocCString(pattern)
            nativeSortFilterProxyModelSetFilterRegExp(ptr, p)
            LibC.free(p)
        }
    }

    public func setFilterKeyColumn(column: Int64) {
        unsafe { nativeSortFilterProxyModelSetFilterKeyColumn(ptr, Int32(column)) }
    }

    public func filterKeyColumn(): Int64 {
        return Int64(unsafe { nativeSortFilterProxyModelFilterKeyColumn(ptr) })
    }

    public func setDynamicSortFilter(b: Bool) {
        unsafe { nativeSortFilterProxyModelSetDynamicSortFilter(ptr, b) }
    }

    public func setSortRole(role: Int64) {
        unsafe { nativeSortFilterProxyModelSetSortRole(ptr, Int32(role)) }
    }

    public func sortRole(): Int64 {
        return Int64(unsafe { nativeSortFilterProxyModelSortRole(ptr) })
    }

    public func sort(column: Int64, order: QSortOrder) {
        unsafe { nativeSortFilterProxyModelSort(ptr, Int32(column), order.value()) }
    }

    public func setSourceModel(source: QAbstractItemModel) {
        unsafe { nativeSortFilterProxyModelSetSourceModel(ptr, source.ptr) }
    }
}
