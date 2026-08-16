#include "graphics_view.h"

extern "C"
{
    uintptr_t nativeGraphicsViewCreateWithScene(uintptr_t scenePtr, uintptr_t parentPtr)
    {
        APPLICATION_CREATE

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
        return reinterpret_cast<uintptr_t>(viewObj);
    }
    uintptr_t nativeGraphicsViewCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
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
        return reinterpret_cast<uintptr_t>(viewObj);
    }
    void nativeGraphicsViewDelete(uintptr_t ptr)
    {
        CjGraphicsView *instance = reinterpret_cast<CjGraphicsView *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    short nativeGraphicsViewAlignment(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->alignment();
    }
    void nativeGraphicsViewSetAlignment(uintptr_t ptr, short flag)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->setAlignment(Qt::Alignment(flag));
    }

    uintptr_t nativeGraphicsViewBackgroundBrush(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QBrush brush = instance->backgroundBrush();
        QBrush *p = new QBrush(brush);
        return reinterpret_cast<uintptr_t>(p);
    }
    void nativeGraphicsViewSetBackgroundBrush(uintptr_t ptr, const uintptr_t brushPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        instance->setBackgroundBrush(*brush);
    }
    short nativeGraphicsViewCacheMode(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->cacheMode();
    }
    void nativeGraphicsViewSetCacheMode(uintptr_t ptr, short mode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setCacheMode(QGraphicsView::CacheMode(mode));
    }

    void nativeGraphicsViewCenterOn(uintptr_t ptr, const uintptr_t posPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPointF *pos = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(posPtr));
        instance->centerOn(*pos);
    }
    void nativeGraphicsViewCenterOnWithXY(uintptr_t ptr, double x, double y)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->centerOn(x, y);
    }
    void nativeGraphicsViewCenterOnWithItem(uintptr_t ptr, const uintptr_t itemPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsItem *item = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(itemPtr));
        instance->centerOn(item);
    }
    int nativeGraphicsViewDragMode(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->dragMode();
    }
    void nativeGraphicsViewSetDragMode(uintptr_t ptr, int mode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->setDragMode(QGraphicsView::DragMode(mode));
    }
    void nativeGraphicsViewEnsureVisibleWithRect(uintptr_t ptr, const uintptr_t rectPtr, int xmargin, int ymargin)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRectF *rect = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectPtr));
        instance->ensureVisible(*rect, xmargin, ymargin);
    }
    void nativeGraphicsViewEnsureVisible(uintptr_t ptr, double x, double y, double w, double h, int xmargin, int ymargin)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->ensureVisible(x, y, w, h, xmargin, ymargin);
    }
    void nativeGraphicsViewEnsureVisibleWithItem(uintptr_t ptr, const uintptr_t itemPtr, int xmargin, int ymargin)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsItem *item = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(itemPtr));
        instance->ensureVisible(item, xmargin, ymargin);
    }
    void nativeGraphicsViewFitlnViewWithRect(uintptr_t ptr, const uintptr_t rectPtr, int aspectRatioMode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRectF *rect = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectPtr));
        instance->ensureVisible(*rect, Qt::AspectRatioMode(aspectRatioMode));
    }
    void nativeGraphicsViewFitlnView(uintptr_t ptr, double x, double y, double w, double h, int aspectRatioMode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->ensureVisible(x, y, w, h, Qt::AspectRatioMode(aspectRatioMode));
    }
    void nativeGraphicsViewFitlnViewWithItem(uintptr_t ptr, const uintptr_t itemPtr, int aspectRatioMode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsItem *item = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(itemPtr));
        instance->ensureVisible(item, Qt::AspectRatioMode(aspectRatioMode));
    }
    uintptr_t nativeGraphicsViewForegroundBrush(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QBrush brush = instance->foregroundBrush();
        QBrush *p = new QBrush(brush);
        return reinterpret_cast<uintptr_t>(p);
    }
    void nativeGraphicsViewSetForegroundBrush(uintptr_t ptr, const uintptr_t brushPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        instance->setForegroundBrush(*brush);
    }
    bool nativeGraphicsViewIsInteractive(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->isInteractive();
    }
    void nativeGraphicsViewSetInteractive(uintptr_t ptr, bool allowed)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->setInteractive(allowed);
    }
    bool nativeGraphicsViewIsTransformed(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->isTransformed();
    }
    void nativeGraphicsViewSetTransform(uintptr_t ptr, const uintptr_t matrixPtr, bool combine)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QTransform *matrix = reinterpret_cast<QTransform *>(static_cast<uintptr_t>(matrixPtr));
        instance->setTransform(*matrix, combine);
    }
    void nativeGraphicsViewSetTransformationAnchor(uintptr_t ptr, int anchor)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setTransformationAnchor(QGraphicsView::ViewportAnchor(anchor));
    }
    uintptr_t nativeGraphicsViewItemAtWithPoint(uintptr_t ptr, const uintptr_t posPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPoint *pos = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(posPtr));
        QGraphicsItem *item = instance->itemAt(*pos);
        return reinterpret_cast<uintptr_t>(item);
    }
    uintptr_t nativeGraphicsViewItemAtWithXY(uintptr_t ptr, int x, int y)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsItem *item = instance->itemAt(x, y);
        return reinterpret_cast<uintptr_t>(item);
    }
    uintptr_t nativeGraphicsViewMapFromScene(uintptr_t ptr, const uintptr_t pointFPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPointF *pointF = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(pointFPtr));
        QPoint point = instance->mapFromScene(*pointF);
        QPoint *p = new QPoint(point);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativeGraphicsViewMapFromSceneWithRectF(uintptr_t ptr, const uintptr_t rectFPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRectF *rectF = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectFPtr));
        QPolygon polygon = instance->mapFromScene(*rectF);
        QPolygon *p = new QPolygon(polygon);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativeGraphicsViewMapFromSceneWithPolygonF(uintptr_t ptr, const uintptr_t polygonFPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPolygonF *polygonF = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(polygonFPtr));
        QPolygon polygon = instance->mapFromScene(*polygonF);
        QPolygon *p = new QPolygon(polygon);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativeGraphicsViewMapFromSceneWithPainterPath(uintptr_t ptr, const uintptr_t painterPathPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPainterPath *painterPath = reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(painterPathPtr));
        QPainterPath pPainterPath = instance->mapFromScene(*painterPath);
        QPainterPath *p = new QPainterPath(pPainterPath);
        return reinterpret_cast<uintptr_t>(p);
    }
    QPoint nativeGraphicsViewMapFromSceneWithXY(uintptr_t ptr, double x, double y)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
      //  QPoint point = instance->mapFromScene(x, y);
        // QPoint *p = new QPoint(point);
        return instance->mapFromScene(x, y);
    }
    uintptr_t nativeGraphicsViewMapFromSceneWithXYWH(uintptr_t ptr, double x, double y, double w, double h)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPolygon polygon = instance->mapFromScene(x, y, w, h);
        QPolygon *p = new QPolygon(polygon);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativeGraphicsViewMapToScene(uintptr_t ptr, const uintptr_t pointPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPoint *point = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(pointPtr));
        QPointF pointF = instance->mapToScene(*point);
        QPointF *p = new QPointF(pointF);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativeGraphicsViewMapToSceneWithRect(uintptr_t ptr, const uintptr_t rectPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRect *rect = reinterpret_cast<QRect *>(static_cast<uintptr_t>(rectPtr));
        QPolygonF polygonF = instance->mapToScene(*rect);
        QPolygonF *p = new QPolygonF(polygonF);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativeGraphicsViewMapToSceneWithPolygon(uintptr_t ptr, const uintptr_t polygonPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPolygon *polygon = reinterpret_cast<QPolygon *>(static_cast<uintptr_t>(polygonPtr));
        QPolygonF polygonF = instance->mapToScene(*polygon);
        QPolygonF *p = new QPolygonF(polygonF);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativeGraphicsViewMapToSceneWithPainterPath(uintptr_t ptr, const uintptr_t painterPathPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPainterPath *painterPath = reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(painterPathPtr));
        QPainterPath pPainterPath = instance->mapToScene(*painterPath);
        QPainterPath *p = new QPainterPath(pPainterPath);
        return reinterpret_cast<uintptr_t>(p);
    }
    QPointF nativeGraphicsViewMapToSceneWithXY(uintptr_t ptr, int x, int y)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
      //  QPointF pointF = instance->mapToScene(x, y);
       // QPointF *p = new QPointF(pointF);
        return instance->mapToScene(x, y);
    }
    uintptr_t nativeGraphicsViewMapToSceneWithXYWH(uintptr_t ptr, int x, int y, int w, int h)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPolygonF polygonF = instance->mapToScene(x, y, w, h);
        QPolygonF *p = new QPolygonF(polygonF);
        return reinterpret_cast<uintptr_t>(p);
    }
    short nativeGraphicsViewOptimizationFlags(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->optimizationFlags();
    }
    void nativeGraphicsViewSetOptimizationFlag(uintptr_t ptr, short flag, bool enabled = true)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setOptimizationFlag(QGraphicsView::OptimizationFlag(flag), enabled);
    }
    void nativeGraphicsViewSetOptimizationFlags(uintptr_t ptr, short flag)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setOptimizationFlags(QGraphicsView::OptimizationFlag(flag));
    }
    void nativeGraphicsViewRender(uintptr_t ptr, uintptr_t painterPtr, const uintptr_t targetPtr, const uintptr_t sourcePtr, int aspectRatioMode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(painterPtr));
        QRectF *target = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(targetPtr));
        QRect *source = reinterpret_cast<QRect *>(static_cast<uintptr_t>(sourcePtr));
        instance->render(painter, *target, *source, Qt::AspectRatioMode(aspectRatioMode));
    }
    short nativeGraphicsViewRenderHints(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->renderHints();
    }
    void nativeGraphicsViewSetRenderHint(uintptr_t ptr, short hint, bool enabled)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setRenderHint(QPainter::RenderHint(hint), enabled);
    }
    void nativeGraphicsViewSetRenderHints(uintptr_t ptr, short hint)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setRenderHints(QPainter::RenderHint(hint));
    }
    void nativeGraphicsViewResetCachedContent(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->resetCachedContent();
    }
    void nativeGraphicsViewResetTransform(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->resetTransform();
    }
    short nativeGraphicsViewResizeAnchor(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->resizeAnchor();
    }
    void nativeGraphicsViewSetResizeAnchor(uintptr_t ptr, int anchor)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setResizeAnchor(QGraphicsView::ViewportAnchor(anchor));
    }
    void nativeGraphicsViewRotate(uintptr_t ptr, double angle)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->rotate(angle);
    }
    uintptr_t nativeGraphicsViewRubberBandRect(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRect rect = instance->rubberBandRect();
        QRect *p = new QRect(rect);
        return reinterpret_cast<uintptr_t>(p);
    }
    short nativeGraphicsViewRubberBandSelectionMode(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->rubberBandSelectionMode();
    }
    void nativeGraphicsViewSetRubberBandSelectionMode(uintptr_t ptr, short mode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setRubberBandSelectionMode(Qt::ItemSelectionMode(mode));
    }
    void nativeGraphicsViewScale(uintptr_t ptr, double sx, double sy)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->scale(sx, sy);
    }
    uintptr_t nativeGraphicsViewScene(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsScene *scene = instance->scene();
        return reinterpret_cast<uintptr_t>(scene);
    }
    void nativeGraphicsViewSetScene(uintptr_t ptr, uintptr_t scenePtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(scenePtr));
        instance->setScene(scene);
    }
    QRectF nativeGraphicsViewSceneRect(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
      //  QRectF rectF = instance->sceneRect();
        // QRectF *p = new QRectF(rectF);
        return instance->sceneRect();
    }
    void nativeGraphicsViewSetSceneRectWithRect(uintptr_t ptr, const uintptr_t rectFPtr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QRectF *rectF = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectFPtr));
        instance->setSceneRect(*rectF);
    }
    void nativeGraphicsViewSetSceneRect(uintptr_t ptr, double x, double y, double w, double h)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setSceneRect(x, y, w, h);
    }
    void nativeGraphicsViewSetViewportUpdateMode(uintptr_t ptr, int mode)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->setViewportUpdateMode(QGraphicsView::ViewportUpdateMode(mode));
    }
    void nativeGraphicsViewShear(uintptr_t ptr, double sh, double sv)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->shear(sh, sv);
    }
    uintptr_t nativeGraphicsViewTransform(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QTransform transform = instance->transform();
        QTransform *p = new QTransform(transform);
        return reinterpret_cast<uintptr_t>(p);
    }
    int nativeGraphicsViewTransformationAnchor(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->transformationAnchor();
    }
    void nativeGraphicsViewTranslate(uintptr_t ptr, double dx, double dy)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        instance->translate(dx, dy);
    }
    uintptr_t nativeGraphicsViewViewportTransform(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        QTransform transform = instance->viewportTransform();
        QTransform *p = new QTransform(transform);
        return reinterpret_cast<uintptr_t>(p);
    }
    int nativeGraphicsViewViewportUpdateMode(uintptr_t ptr)
    {
        QGraphicsView *instance = reinterpret_cast<QGraphicsView *>(static_cast<uintptr_t>(ptr));
        return instance->viewportUpdateMode();
    }
}
