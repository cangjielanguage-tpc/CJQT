#include "gui_application.h"
#include <QGuiApplication>
#include <QScreen>
#include <QDebug>

extern "C"
{
    uintptr_t nativeGuiApplicationPrimaryScreen()
    {
        qDebug()<<"nativeGuiApplicationPrimaryScreen"<<endl;
        QList<QScreen *> screens=QGuiApplication::screens();
        qDebug()<<"nativeGuiApplicationPrimaryScreen:screens.length:"<<screens.length()<<endl;
        return 0;
//        return reinterpret_cast<uintptr_t>(screen);
    }
}
