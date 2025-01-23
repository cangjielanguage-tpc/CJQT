#include <QPainter>
#include <QWidget>
#include <QPen>
#include <QBrush>
#include <QPixmap>
#include <QStaticText>
#include <QFont>
#include <QPolygonF>
#include <QPolygon>
#include <QDebug>

extern "C"
{

    uintptr_t nativePainterCreate(uintptr_t widgetPtr)
    {
        QPainter *painter;
        if (widgetPtr == 0L)
        {
            painter = new QPainter();
        }
        else
        {
            QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
            painter = new QPainter(widget);
        }
        return reinterpret_cast<uintptr_t>(painter);
    }
    uintptr_t nativePainterCreateWithDevice(uintptr_t devicePtr)
    {
        QPainter *painter;
        if (devicePtr == 0L)
        {
            painter = new QPainter();
        }
        else
        {
            QPaintDevice *device = reinterpret_cast<QPaintDevice *>(static_cast<uintptr_t>(devicePtr));
            painter = new QPainter(device);
        }
        return reinterpret_cast<uintptr_t>(painter);
    }
    uintptr_t nativePainterPen(uintptr_t ptr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(&instance->pen());

    }

    void nativePainterSetPen(uintptr_t ptr, uintptr_t penPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPen *pen = reinterpret_cast<QPen *>(static_cast<uintptr_t>(penPtr));
        instance->setPen(*pen);
    }
    void nativePainterSetFont(uintptr_t ptr, uintptr_t fontPtr){
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
        instance->setFont(*font);
    }
    void nativePainterSetBrush(uintptr_t ptr, uintptr_t brushPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        instance->setBrush(*brush);
    }
    void nativePainterSetOpacity(uintptr_t ptr, float opacity)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->setOpacity(opacity);
    }
    void nativePainterDrawLine(uintptr_t ptr, int x, int y, int x2, int y2)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->drawLine(x, y, x2, y2);
    }
    void nativePainterDrawLineF(uintptr_t ptr,qreal p1x,qreal p1y,qreal p2x,qreal p2y)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPointF p1(p1x,p1y) ;
        QPointF p2(p2x,p2y) ;
        instance->drawLine(p1, p2);
    }
    void nativePainterDrawRect(uintptr_t ptr, int x, int y, int width, int height)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->drawRect(x, y, width, height);
    }
    void nativePainterDrawRoundedRectF(uintptr_t ptr,qreal x,qreal y,qreal w,qreal h, qreal xRadius, qreal yRadius,int mode)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QRectF rectf (x,y,w,h) ;
        instance->drawRoundedRect(rectf, xRadius, yRadius,Qt::SizeMode(mode) );
    }
    void nativePainterDrawRoundedRect(uintptr_t ptr, int x, int y, int width, int height,double xRadius,double yRadius)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->drawRoundedRect(x, y, width, height,xRadius,yRadius );
    }
    void nativePainterDrawPixmap(uintptr_t ptr, int x, int y,
                                 int width, int height, uintptr_t pixmapPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPixmap *pixmap = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(pixmapPtr));
        instance->drawPixmap(x, y, width, height, *pixmap);
    }

    void nativePainterDelete(uintptr_t ptr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    void nativePainterTranslate(uintptr_t ptr, double dx, double dy)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->translate(dx, dy);
    }
    void nativePainterTranslateWithPoint(uintptr_t ptr, int x,int y)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPoint point(x,y) ;
        instance->translate(point);
    }
    void nativePainterTranslateWithPointF(uintptr_t ptr, const uintptr_t pointFPrt)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPointF *pointF = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(pointFPrt));
        instance->translate(*pointF);
    }

    void nativePainterDrawPolyline(uintptr_t ptr, const uintptr_t polygonFPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPolygonF *polygon = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(polygonFPtr));
        instance->drawPolyline(*polygon);
    }
    void nativePainterDrawPolygonF(uintptr_t ptr, const uintptr_t polygonFPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPolygonF *polygon = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(polygonFPtr));
        instance->drawPolygon(*polygon);
    }
    void nativePainterDrawPolygon(uintptr_t ptr, const uintptr_t polygonPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPolygon *polygon = reinterpret_cast<QPolygon *>(static_cast<uintptr_t>(polygonPtr));
        instance->drawPolygon(*polygon);
    }

    void nativePainterDrawRoundedRectR(uintptr_t ptr,uintptr_t rectPtr, double xRadius,double yRadius,int mode)
    {
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QRect *rect = reinterpret_cast<QRect *>(static_cast<uintptr_t>(rectPtr));
//        QPolygonF *polygon = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(polygonFPtr));
        painter->drawRoundedRect(*rect,xRadius,yRadius,Qt::SizeMode(mode));
    }


    void nativePainterDrawStaticTextPointF(uintptr_t ptr, qreal x,qreal y, const char *text){
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPointF topLeftPosition(x,y);
        painter->drawStaticText(topLeftPosition,QStaticText(text));

    }
    void nativePainterDrawStaticTextPoint(uintptr_t ptr, uintptr_t topLeftPositionPtr, const char *text){
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPoint *topLeftPosition = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(topLeftPositionPtr));
        painter->drawStaticText(*topLeftPosition,QStaticText(text));
    }

    void nativePainterDrawStaticText(uintptr_t ptr,int x, int y, const char *text) {
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        painter->drawStaticText(x,y,QStaticText(text));
    }
    void nativePainterDrawTextPointF(uintptr_t ptr,qreal x,qreal y, const char *text){
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPointF topLeftPosition(x,y) ;
        painter->drawText(topLeftPosition,text);
    }
    void nativePainterDrawTextPoint(uintptr_t ptr,uintptr_t topLeftPositionPtr, const char *text){
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPoint *topLeftPosition = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(topLeftPositionPtr));
        painter->drawText(*topLeftPosition,text);

    }
    void nativePainterDrawText(uintptr_t ptr, int x, int y, const char *text){
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        painter->drawText(x,y,text);

    }
    
    void nativePainterDrawTextRectFFlag(uintptr_t ptr,qreal x,qreal y,qreal w,qreal h, short flags, const char *text){
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QRectF f(x,y,w,h) ;
        painter->drawText(f,flags,text);

    }
    void nativePainterDrawTextRectFlag(uintptr_t ptr, uintptr_t rPtr,  short flags, const char *text){
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QRect *f = reinterpret_cast<QRect *>(static_cast<uintptr_t>(rPtr));
        painter->drawText(*f,flags,text);
    }
    void drawnativePainterDrawTextXYFlag(uintptr_t ptr, int x, int y, int w, int h, short flags, const char *text){
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        painter->drawText(x,y,w,h,flags,text);
    }

    void nativePainterDrawTextOption(uintptr_t ptr,qreal x,qreal y,qreal w,qreal h, const char *text,  uintptr_t oPtr){
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QRectF rectF(x,y,w,h) ;
        if(oPtr==0){
            painter->drawText(rectF,text);
        }
        else{
            QTextOption *o = reinterpret_cast<QTextOption *>(static_cast<uintptr_t>(oPtr));
            painter->drawText(rectF,text,*o);
        }
    }
    void nativePainterSetRenderHints(uintptr_t ptr, short hints,bool on){
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        painter->setRenderHints(QPainter::RenderHints(hints),on);
    }
    void nativePainterSave(uintptr_t ptr){
       QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
       painter ->save();
    }
    void nativePainterRestore(uintptr_t ptr){
        QPainter *painter = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        painter ->restore();
    }
}
