package gui

public class TextlistModel <: QAbstractListModel {
    let items = ArrayList<Int64>()

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