#include "dock_widget.h"

extern "C"
{
    uintptr_t nativeDockWidgetCreate(uintptr_t parentPtr)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QDockWidget *dock = new QDockWidget(parent);
        return reinterpret_cast<uintptr_t>(dock);
    }

    uintptr_t nativeDockWidgetCreateText(const char *contents,uintptr_t parentPtr)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QDockWidget *dock = new QDockWidget(QString(contents),parent);
        return reinterpret_cast<uintptr_t>(dock);
    }
    void nativeDockWidgetSetWidget(uintptr_t ptr,uintptr_t widgetPtr){
        QDockWidget *dock = reinterpret_cast<QDockWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        dock->setWidget(widget);
    }
    void nativeDockWidgetSetTitleBarWidget(uintptr_t ptr,uintptr_t widgetPtr){
        QDockWidget *dock = reinterpret_cast<QDockWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        dock->setTitleBarWidget(widget);
    }


}
