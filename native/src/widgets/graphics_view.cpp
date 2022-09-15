#include "graphics_view.h"

extern "C"
{
    long nativeGraphicsViewCreateWithScene(long scenePtr, long parentPtr)
    {

        CjGraphicsView *viewObj;
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(scenePtr));
        if (parentPtr == 0L)
        {
            viewObj = new CjGraphicsView(scene);
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            viewObj = new CjGraphicsView(scene, parent);
        }
        return reinterpret_cast<long>(viewObj);
    }
    long nativeGraphicsViewCreate(long parentPtr)
    {
        CjGraphicsView *viewObj;
        if (parentPtr == 0L)
        {
            viewObj = new CjGraphicsView();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            viewObj = new CjGraphicsView(parent);
        }
        return reinterpret_cast<long>(viewObj);
    }
    void nativeGraphicsViewDelete(long ptr)
    {
        CjGraphicsView *instance = reinterpret_cast<CjGraphicsView *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    short nativeGraphicsViewAlignment(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->alignment();
    }
    void nativeGraphicsViewSetAlignment(long ptr, short flag)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->setAlignment(Qt::Alignment(flag));
    }

    long nativeGraphicsViewBackgroundBrush(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QBrush brush = instance->backgroundBrush();
        QBrush *p = new QBrush(brush);
        return reinterpret_cast<long>(p);
    }
    void nativeGraphicsViewSetBackgroundBrush(long ptr, const long brushPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        instance->setBackgroundBrush(*brush);
    }
    short nativeGraphicsViewCacheMode(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->cacheMode();
    }
    void nativeGraphicsViewSetCacheMode(long ptr, short mode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setCacheMode(QGraphicsView::CacheMode(mode));
    }

    void nativeGraphicsViewCenterOn(long ptr, const long posPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPointF *pos = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(posPtr));
        instance->centerOn(*pos);
    }
    void nativeGraphicsViewCenterOnWithXY(long ptr, double x, double y)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->centerOn(x, y);
    }
    void nativeGraphicsViewCenterOnWithItem(long ptr, const long itemPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsItem *item = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(itemPtr));
        instance->centerOn(item);
    }
    int nativeGraphicsViewDragMode(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->dragMode();
    }
    void nativeGraphicsViewSetDragMode(long ptr, int mode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->setDragMode(QGraphicsView::DragMode(mode));
    }
    void nativeGraphicsViewEnsureVisibleWithRect(long ptr, const long rectPtr, int xmargin, int ymargin)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRectF *rect = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectPtr));
        instance->ensureVisible(*rect, xmargin, ymargin);
    }
    void nativeGraphicsViewEnsureVisible(long ptr, double x, double y, double w, double h, int xmargin, int ymargin)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->ensureVisible(x, y, w, h, xmargin, ymargin);
    }
    void nativeGraphicsViewEnsureVisibleWithItem(long ptr, const long itemPtr, int xmargin, int ymargin)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsItem *item = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(itemPtr));
        instance->ensureVisible(item, xmargin, ymargin);
    }
    void nativeGraphicsViewFitlnViewWithRect(long ptr, const long rectPtr, int aspectRatioMode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRectF *rect = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectPtr));
        instance->ensureVisible(*rect, Qt::AspectRatioMode(aspectRatioMode));
    }
    void nativeGraphicsViewFitlnView(long ptr, double x, double y, double w, double h, int aspectRatioMode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->ensureVisible(x, y, w, h, Qt::AspectRatioMode(aspectRatioMode));
    }
    void nativeGraphicsViewFitlnViewWithItem(long ptr, const long itemPtr, int aspectRatioMode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsItem *item = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(itemPtr));
        instance->ensureVisible(item, Qt::AspectRatioMode(aspectRatioMode));
    }
    long nativeGraphicsViewForegroundBrush(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QBrush brush = instance->foregroundBrush();
        QBrush *p = new QBrush(brush);
        return reinterpret_cast<long>(p);
    }
    void nativeGraphicsViewSetForegroundBrush(long ptr, const long brushPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        instance->setForegroundBrush(*brush);
    }
    bool nativeGraphicsViewIsInteractive(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->isInteractive();
    }
    void nativeGraphicsViewSetInteractive(long ptr, bool allowed)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->setInteractive(allowed);
    }
    bool nativeGraphicsViewIsTransformed(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->isTransformed();
    }
    void nativeGraphicsViewSetTransform(long ptr, const long matrixPtr, bool combine)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QTransform *matrix = reinterpret_cast<QTransform *>(static_cast<uintptr_t>(matrixPtr));
        instance->setTransform(*matrix, combine);
    }
    void nativeGraphicsViewSetTransformationAnchor(long ptr, int anchor)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setTransformationAnchor(QGraphicsView::ViewportAnchor(anchor));
    }
    long nativeGraphicsViewItemAtWithPoint(long ptr, const long posPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPoint *pos = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(posPtr));
        QGraphicsItem *item = instance->itemAt(*pos);
        return reinterpret_cast<long>(item);
    }
    long nativeGraphicsViewItemAtWithXY(long ptr, int x, int y)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsItem *item = instance->itemAt(x, y);
        return reinterpret_cast<long>(item);
    }
    long nativeGraphicsViewMapFromScene(long ptr, const long pointFPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPointF *pointF = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(pointFPtr));
        QPoint point = instance->mapFromScene(*pointF);
        QPoint *p = new QPoint(point);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsViewMapFromSceneWithRectF(long ptr, const long rectFPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRectF *rectF = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectFPtr));
        QPolygon polygon = instance->mapFromScene(*rectF);
        QPolygon *p = new QPolygon(polygon);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsViewMapFromSceneWithPolygonF(long ptr, const long polygonFPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPolygonF *polygonF = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(polygonFPtr));
        QPolygon polygon = instance->mapFromScene(*polygonF);
        QPolygon *p = new QPolygon(polygon);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsViewMapFromSceneWithPainterPath(long ptr, const long painterPathPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPainterPath *painterPath = reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(painterPathPtr));
        QPainterPath pPainterPath = instance->mapFromScene(*painterPath);
        QPainterPath *p = new QPainterPath(pPainterPath);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsViewMapFromSceneWithXY(long ptr, double x, double y)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPoint point = instance->mapFromScene(x, y);
        QPoint *p = new QPoint(point);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsViewMapFromSceneWithXYWH(long ptr, double x, double y, double w, double h)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPolygon polygon = instance->mapFromScene(x, y, w, h);
        QPolygon *p = new QPolygon(polygon);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsViewMapToScene(long ptr, const long pointPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPoint *point = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(pointPtr));
        QPointF pointF = instance->mapToScene(*point);
        QPointF *p = new QPointF(pointF);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsViewMapToSceneWithRect(long ptr, const long rectPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRect *rect = reinterpret_cast<QRect *>(static_cast<uintptr_t>(rectPtr));
        QPolygonF polygonF = instance->mapToScene(*rect);
        QPolygonF *p = new QPolygonF(polygonF);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsViewMapToSceneWithPolygon(long ptr, const long polygonPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPolygon *polygon = reinterpret_cast<QPolygon *>(static_cast<uintptr_t>(polygonPtr));
        QPolygonF polygonF = instance->mapToScene(*polygon);
        QPolygonF *p = new QPolygonF(polygonF);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsViewMapToSceneWithPainterPath(long ptr, const long painterPathPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPainterPath *painterPath = reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(painterPathPtr));
        QPainterPath pPainterPath = instance->mapToScene(*painterPath);
        QPainterPath *p = new QPainterPath(pPainterPath);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsViewMapToSceneWithXY(long ptr, int x, int y)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPointF pointF = instance->mapToScene(x, y);
        QPointF *p = new QPointF(pointF);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsViewMapToSceneWithXYWH(long ptr, int x, int y, int w, int h)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPolygonF polygonF = instance->mapToScene(x, y, w, h);
        QPolygonF *p = new QPolygonF(polygonF);
        return reinterpret_cast<long>(p);
    }
    short nativeGraphicsViewOptimizationFlags(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->optimizationFlags();
    }
    void nativeGraphicsViewSetOptimizationFlag(long ptr, short flag, bool enabled = true)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setOptimizationFlag(QGraphicsView::OptimizationFlag(flag), enabled);
    }
    void nativeGraphicsViewSetOptimizationFlags(long ptr, short flag)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setOptimizationFlags(QGraphicsView::OptimizationFlag(flag));
    }
    void nativeGraphicsViewRender(long ptr, long painterPtr, const long targetPtr, const long sourcePtr, int aspectRatioMode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(painterPtr));
        QRectF *target = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(targetPtr));
        QRect *source = reinterpret_cast<QRect *>(static_cast<uintptr_t>(sourcePtr));
        instance->render(painter, *target, *source, Qt::AspectRatioMode(aspectRatioMode));
    }
    short nativeGraphicsViewRenderHints(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->renderHints();
    }
    void nativeGraphicsViewSetRenderHint(long ptr, short hint, bool enabled)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setRenderHint(QPainter::RenderHint(hint), enabled);
    }
    void nativeGraphicsViewSetRenderHints(long ptr, short hint)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setRenderHints(QPainter::RenderHint(hint));
    }
    void nativeGraphicsViewResetCachedContent(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->resetCachedContent();
    }
    void nativeGraphicsViewResetTransform(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->resetTransform();
    }
    short nativeGraphicsViewResizeAnchor(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->resizeAnchor();
    }
    void nativeGraphicsViewSetResizeAnchor(long ptr, int anchor)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setResizeAnchor(QGraphicsView::ViewportAnchor(anchor));
    }
    void nativeGraphicsViewRotate(long ptr, double angle)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->rotate(angle);
    }
    long nativeGraphicsViewRubberBandRect(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRect rect = instance->rubberBandRect();
        QRect *p = new QRect(rect);
        return reinterpret_cast<long>(p);
    }
    short nativeGraphicsViewRubberBandSelectionMode(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->rubberBandSelectionMode();
    }
    void nativeGraphicsViewSetRubberBandSelectionMode(long ptr, short mode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setRubberBandSelectionMode(Qt::ItemSelectionMode(mode));
    }
    void nativeGraphicsViewScale(long ptr, double sx, double sy)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->scale(sx, sy);
    }
    long nativeGraphicsViewScene(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsScene *scene = instance->scene();
        return reinterpret_cast<long>(scene);
    }
    void nativeGraphicsViewSetScene(long ptr, long scenePtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(scenePtr));
        instance->setScene(scene);
    }
    long nativeGraphicsViewSceneRect(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRectF rectF = instance->sceneRect();
        QRectF *p = new QRectF(rectF);
        return reinterpret_cast<long>(p);
    }
    void nativeGraphicsViewSetSceneRectWithRect(long ptr, const long rectFPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRectF *rectF = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectFPtr));
        instance->setSceneRect(*rectF);
    }
    void nativeGraphicsViewSetSceneRect(long ptr, double x, double y, double w, double h)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setSceneRect(x, y, w, h);
    }
    void nativeGraphicsViewSetViewportUpdateMode(long ptr, int mode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setViewportUpdateMode(QGraphicsView::ViewportUpdateMode(mode));
    }
    void nativeGraphicsViewShear(long ptr, double sh, double sv)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->shear(sh, sv);
    }
    long nativeGraphicsViewTransform(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QTransform transform = instance->transform();
        QTransform *p = new QTransform(transform);
        return reinterpret_cast<long>(p);
    }
    int nativeGraphicsViewTransformationAnchor(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->transformationAnchor();
    }
    void nativeGraphicsViewTranslate(long ptr, double dx, double dy)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->translate(dx, dy);
    }
    long nativeGraphicsViewViewportTransform(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QTransform transform = instance->viewportTransform();
        QTransform *p = new QTransform(transform);
        return reinterpret_cast<long>(p);
    }
    int nativeGraphicsViewViewportUpdateMode(long ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->viewportUpdateMode();
    }
}