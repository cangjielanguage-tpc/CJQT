package draw
import cjqt.core.*
import cjqt.core.QPointF
import cjqt.core.QRectF
import cjqt.widgets.*
import cjqt.widgets.QGraphicsItem
import cjqt.widgets.QGraphicsRectItem
import cjqt.widgets.QGraphicsSceneMouseEvent
import cjqt.widgets.QPainter
import cjqt.gui.QPolygonF
import cjqt.gui.QColor
import cjqt.gui.QPixmap
import cjqt.gui.QBrush
import cjqt.gui.QPen

public enum DrawShapeState {
    selection | line | rectangle | ellipse | polygon | polyLine | none
}
public class DrawScene <: QGraphicsScene {
    public var m_drawShapeState: DrawShapeState = none
    public var m_penColor: QColor = QColor(0, 0, 255)
    public var m_downPoint: QPointF = QPointF(0.0, 0.0)
    public var m_selectRectItem: QGraphicsRectItem = QGraphicsRectItem(0.0, 0.0, 0.0, 0.0)
    public var m_addItem: QGraphicsItem = QGraphicsItem()

    public init(parent: QObject) {
        super(parent: parent)
        setMouseMoveEvent()
        setMousePressEvent()
        setMouseReleaseEvent()
    }

    public override func delete() {
        super.delete()
    }

    public func drawBackShape() {
        var myPolygon1: QPolygonF = QPolygonF()
        myPolygon1 << QPointF(0.0, 5.0) << QPointF(10.0, 5.0)

        var myPolygon2: QPolygonF = QPolygonF()
        myPolygon2 << QPointF(5.0, 0.0) << QPointF(5.0, 10.0)

        var pix=QPixmap(10,10)
        pix.fill(QColor.White)
        var painter=QPainter(pix)
        var pen=QPen(DashLine)
        pen.setColor(QColor.Cyan)
        pen.setWidthF(0.5)
        painter.setPen(pen)
        painter.translate(0.0,0.0)
        painter.drawPolyline(myPolygon1)
        painter.drawPolyline(myPolygon2)
        setBackgroundBrush(QBrush(pix))
    }

    protected override func mousePressEvent(mouseEvent: QGraphicsSceneMouseEvent): Unit {
        m_downPoint = mouseEvent.scenePos()
        var penColor = QColor(0, 0, 255)
        match (m_drawShapeState) {
            case none => super.mousePressEvent(mouseEvent)
            case selection =>
                m_selectRectItem = QGraphicsRectItem(m_downPoint.x(), m_downPoint.y(), 0.0, 0.0)
                m_selectRectItem.setPen(QPen(penColor))
                addItem(m_selectRectItem)
            case rectangle =>
                var item = QGraphicsRectItem(m_downPoint.x(), m_downPoint.y(), 0.0, 0.0)
                item.setPen(QPen(penColor))
                addItem(item)
                m_addItem = item
            case ellipse => 
                var item = QGraphicsEllipseItem(m_downPoint.x(), m_downPoint.y(), 0.0, 0.0)
                item.setPen(QPen(penColor))
                addItem(item)
                m_addItem = item
                
            case line => 
                var item = QGraphicsLineItem(m_downPoint.x(), m_downPoint.y(), 0.0, 0.0)
                item.setPen(QPen(penColor))
                addItem(item)
                m_addItem = item
            
            case _ => super.mousePressEvent(mouseEvent)
        }
        m_downPoint.delete()
    }
    protected override func mouseMoveEvent(mouseEvent: QGraphicsSceneMouseEvent): Unit {
        var Qd = mouseEvent.scenePos()
        var penColor = QColor(0, 0, 255)
        var x1 = match (Qd.x() > m_downPoint.x()) {
            case true => m_downPoint.x()
            case _ => Qd.x()
        }
        var y1 = match (Qd.y() > m_downPoint.y()) {
            case true => m_downPoint.y()
            case _ => Qd.y()
        }
        var x2 = match ((Qd.x() - m_downPoint.x()) >= 0.0) {
            case true => Qd.x() - m_downPoint.x()
            case _ => -(Qd.x() - m_downPoint.x())
        }
        var y2 = match ((Qd.y() - m_downPoint.y()) >= 0.0) {
            case true => Qd.y() - m_downPoint.y()
            case _ => -(Qd.y() - m_downPoint.y())
        }
        match (m_drawShapeState) {
            case none => super.mousePressEvent(mouseEvent)
            case selection => m_selectRectItem.setRect(QRectF(x1, y1, x2, y2))
            case rectangle =>
                if (m_addItem is QGraphicsRectItem) {
                    var rect = (m_addItem as QGraphicsRectItem).getOrThrow()
                    rect.setRect(QRectF(x1, y1, x2, y2))
                }
            case ellipse =>
                if (m_addItem is QGraphicsEllipseItem) {
                    var rect = (m_addItem as QGraphicsEllipseItem).getOrThrow()
                    rect.setRect(QRectF(x1, y1, x2, y2))
                }
            case line =>
                if (m_addItem is QGraphicsLineItem) {
                    var line = (m_addItem as QGraphicsLineItem).getOrThrow()
                    line.setLine(QLineF(x1, y1, x2, y2))
                }
            case _ => super.mousePressEvent(mouseEvent)
        }
        Qd.delete()
        // penColor.delete()
    }
    protected override func mouseReleaseEvent(mouseEvent: QGraphicsSceneMouseEvent): Unit {}
}
