#include "dock_widget.h"

extern "C"
{
    uintptr_t nativeDockWidgetCreate(uintptr_t parentPtr)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QDockWidget *dock = new QDockWidget(parent);
        return reinterpret_cast<uintptr_t>(dock);
    }

}
