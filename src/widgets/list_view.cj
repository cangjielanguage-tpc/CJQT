package cjqt.widgets

foreign func nativeListViewCreate(parentPtr: Int64): Int64
foreign func nativeListViewDelete(ptr: Int64): Unit

public open class QListView <: QAbstractItemView {
    
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeListViewCreate(parent.ptr)
            }
        )
    }

    public override func delete() {
        unsafe {
            nativeListViewDelete(ptr)
        }
    }

}