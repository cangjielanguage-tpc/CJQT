package widgets

from cjqt import qt.widgets.*
from cjqt import qt.gui.*
from cjqt import qt.core.*
from cjqt import qt.tools.*
from std import collection.*

public class TextlistModel <: QAbstractListModel {
    let items = ArrayList<Int64>()

    public init() {
        setRowCountCallback()
        setDataCallback()
    }

    public func add(item: Int64) {
        let start = items.size
        let end = start + 1
        beginInsertRows(QModelIndex(), start, end)
        items.append(item)
        endInsertRows()
    }

    public func remove(index: Int64) {
        let row = index
        beginRemoveRows(QModelIndex(), row, row + 1)
        items.remove(index)
        endRemoveRows()
    }

    public func clear() {
        let totalLength = items.size
        beginRemoveRows(QModelIndex(), 0, totalLength - 1)
        items.clear()
        endRemoveRows()
    }

    public func rowCount(parent: QModelIndex): Int32 {
        return Int32(items.size)
    }

    public func data(index: QModelIndex, role: Int32): Int64 {
        if (!index.isValid()) {
            return 0
        }
        if (role == 0x0100) {
            let row = index.row()
            return items[Int64(row)]
        }
        return 0
    }
}

public class TextlistView <: QListView {
    init(parent: QWidget) {
        super(parent: parent)

        //setAttribute(0, false)
        setAttribute(WidgetAttribute.WA_MacShowFocusRect, false)
        setHorizontalScrollBarPolicy(ScrollBarPolicy.ScrollBarAlwaysOff)
        setVerticalScrollBarPolicy(ScrollBarPolicy.ScrollBarAlwaysOff)
    }
}
