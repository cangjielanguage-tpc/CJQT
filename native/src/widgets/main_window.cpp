#include "main_window.h"
#include "menu_bar.h"

extern "C"
{

    // QMainWindow

    long nativeMainWindowCreate(long parentPtr)
    {
        APPLICATION_CREATE
        CjQtMainWindow *win;
        if (parentPtr == 0L)
        {
            win = new CjQtMainWindow();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            win = new CjQtMainWindow(parent);
        }
        return reinterpret_cast<long>(win);
    }

    void nativeMainWindowSetCentralWidget(long ptr, long widgetPtr)
    {
        QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->setCentralWidget(widget);
    }

    void nativeMainWindowSetMenuBar(long ptr, long menuBarPtr)
    {
        QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
        QMenuBar *menuBar = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(menuBarPtr));
        instance->setMenuBar(menuBar);
    }

    long nativeMainWindowMenuBar(long ptr)
    {
        QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<long>(instance->menuBar());
    }

    void nativeMainWindowDelete(long ptr)
    {
        CjQtMainWindow *instance = reinterpret_cast<CjQtMainWindow *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}