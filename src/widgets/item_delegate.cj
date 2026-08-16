package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

foreign func nativeItemDelegateCreate(parentPtr: Int64): Int64
foreign func nativeItemDelegateDelete(ptr: Int64): Unit

public class QItemDelegate <: QAbstractItemDelegate {
    public init() {
        super(
            unsafe {
                nativeItemDelegateCreate(0)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeItemDelegateDelete(ptr)
        }
    }

    public override func paint(painter: QPainter, index: QModelIndex) {}

    public override func sizeHint(index: QModelIndex): QSize {
        return QSize(0, 0)
    }
}
