package feeluown.widgets

internal import cjqt.widgets.*
internal import cjqt.gui.*
internal import cjqt.core.*
internal import cjqt.tools.*
internal import std.collection.*

public class TextlistModel <: QAbstractListModel {
    let items = ArrayList<QVariant>()

    public init() {
        setRowCountCallback()
        setDataCallback()
    }

    public func add(item: QVariant) {
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

    public func data(index: QModelIndex, role: Int32): QVariant {
        let row = index.row()
        if (row < 0 || row >= Int32(items.size)) {
            return QVariant()
        }
        if (role == ItemDataRole.DisplayRole.value() || role == ItemDataRole.EditRole.value()) {
            return items[Int64(row)]
        }
        return QVariant()
    }
}

public class TextlistDelegate <: QStyledItemDelegate {
    init() {
        setPaint()
        setSizeHint()
    }

    public func paint(painter: QPainter, index: QModelIndex) {
        super.paint(painter, index)
    }

    public func sizeHint(index: QModelIndex): QSize {
        let size = super.sizeHint(index)
        if (size.isValid()) {
            return QSize(size.width(), 25)
        }
        return QSize()
    }
}

public class TextlistView <: QListView {
    let listModel = TextlistModel()

    public init(parent: QWidget) {
        super(parent: parent)

        setAttribute(WidgetAttribute.WA_MacShowFocusRect, false)
        setHorizontalScrollBarPolicy(ScrollBarPolicy.ScrollBarAlwaysOff)
        setVerticalScrollBarPolicy(ScrollBarPolicy.ScrollBarAlwaysOff)
        setStyleSheet("QListView{border:none;background:transparent;}")

        listModel.add(QVariant("追梦赤子心"))
        listModel.add(QVariant("起风了"))
        listModel.add(QVariant("网易云音乐"))

        setModel(listModel)
        
    }
}
