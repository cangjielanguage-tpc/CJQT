#include "main_window.h"
#include "menu_bar.h"

extern "C"
{

    // QMainWindow

    uintptr_t nativeMainWindowCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(win);
    }

    void nativeMainWindowSetCentralWidget(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->setCentralWidget(widget);
    }

    void nativeMainWindowSetMenuBar(uintptr_t ptr, uintptr_t menuBarPtr)
    {
        QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
        QMenuBar *menuBar = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(menuBarPtr));
        instance->setMenuBar(menuBar);
    }

    uintptr_t nativeMainWindowMenuBar(uintptr_t ptr)
    {
        QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(instance->menuBar());
    }

    void nativeMainWindowAddToolBar(uintptr_t ptr, uintptr_t toolBarPtr)
    {
        QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
        QToolBar *toolBar = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(toolBarPtr));
        instance->addToolBar(toolBar);
    }

    void nativeMainWindowDelete(uintptr_t ptr)
    {
        CjQtMainWindow *instance = reinterpret_cast<CjQtMainWindow *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}