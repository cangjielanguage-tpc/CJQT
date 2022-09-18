#include "tab_widget.h"

extern "C"
{

    // QTabWidget

    long nativeTabWidgetCreate(long parentPtr)
    {
        APPLICATION_CREATE
        CjQtTabWidget *tabWidget;
        if (parentPtr == 0L)
        {
            tabWidget = new CjQtTabWidget();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            tabWidget = new CjQtTabWidget(parent);
        }
        return reinterpret_cast<long>(tabWidget);
    }

    void nativeTabWidgetDelete(long ptr)
    {
        CjQtTabWidget *instance = reinterpret_cast<CjQtTabWidget *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeTabWidgetAddTab(long ptr, long widgetPtr, const char *text)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->addTab(widget, text);
    }

    void nativeTabWidgetAddTabWithIcon(long ptr, long widgetPtr, long iconPtr, const char *text)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->addTab(widget, *icon, text);
    }

    void nativeTabWidgetInsertTab(long ptr, int index, long widgetPtr, const char *text)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->insertTab(index, widget, text);
    }

    void nativeTabWidgetInsertTabWithIcon(long ptr, long widgetPtr, int index, long iconPtr, const char *text)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->insertTab(index, widget, *icon, text);
    }

    void nativeTabWidgetRemoveTab(long ptr, int index)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->removeTab(index);
    }

    bool nativeTabWidgetIsTabEnabled(long ptr, int index)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->isTabEnabled(index);
    }

    void nativeTabWidgetSetTabEnabled(long ptr, int index, bool enabl)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setTabEnabled(index, enabl);
    }

    const char *nativeTabWidgetTabText(long ptr, int index)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QString str = instance->tabText(index);
        return qstrdup(str.toUtf8());
    }

    void nativeTabWidgetSetTabText(long ptr, int index, const char *text)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setTabText(index, text);
    }

    long nativeTabWidgetTabIcon(long ptr, int index)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QIcon icon = instance->tabIcon(index);
        return reinterpret_cast<long>(&icon);
    }

    void nativeTabWidgetSetTabIcon(long ptr, int index, long iconPtr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->setTabIcon(index, *icon);
    }

    int nativeTabWidgetCurrentIndex(long ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->currentIndex();
    }

    long nativeTabWidgetCurrentWidget(long ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->currentWidget();
        return reinterpret_cast<long>(widget);
    }

    long nativeTabWidgetWidget(long ptr, int index)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->widget(index);
        return reinterpret_cast<long>(widget);
    }

    int nativeTabWidgetIndexOf(long ptr, long widgetPtr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return instance->indexOf(widget);
    }

    int nativeTabWidgetCount(long ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->count();
    }

    long nativeTabWidgetIconSize(long ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->iconSize();
        return reinterpret_cast<long>(&size);
    }

    void nativeTabWidgetSetIconSize(long ptr, long sizePtr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QSize *size = reinterpret_cast<QSize *>(static_cast<uintptr_t>(sizePtr));
        instance->setIconSize(*size);
    }

    void nativeTabWidgetSetUsesScrollButtons(long ptr, bool useButtons)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setUsesScrollButtons(useButtons);
    }

    bool nativeTabWidgetUsesScrollButtons(long ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->usesScrollButtons();
    }

    void nativeTabWidgetSetTabsClosable(long ptr, bool closable)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setTabsClosable(closable);
    }

    bool nativeTabWidgetTabsClosable(long ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->tabsClosable();
    }

    void nativeTabWidgetSetMovable(long ptr, bool movable)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setMovable(movable);
    }

    bool nativeTabWidgetIsMovable(long ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->isMovable();
    }

    void nativeTabWidgetSetDocumentMode(long ptr, bool documentMode)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setDocumentMode(documentMode);
    }

    bool nativeTabWidgetDocumentMode(long ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->documentMode();
    }

    void nativeTabWidgetSetTabBarAutoHide(long ptr, bool hide)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setTabBarAutoHide(hide);
    }

    bool nativeTabWidgetTabBarAutoHide(long ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->tabBarAutoHide();
    }

    void nativeTabWidgetClear(long ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->clear();
    }

    long nativeTabWidgetTabBar(long ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QTabBar *tabBar = instance->tabBar();
        return reinterpret_cast<long>(tabBar);
    }

    void nativeTabWidgetConnectCurrentChanged(long ptr, long code, nativeConnectCallbackPointer callback)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabWidget::currentChanged, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabWidgetConnectTabCloseRequested(long ptr, long code, nativeConnectCallbackPointer callback)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabWidget::tabCloseRequested, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabWidgetConnectTabBarClicked(long ptr, long code, nativeConnectCallbackPointer callback)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabWidget::tabBarClicked, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabWidgetConnectTabBarDoubleClicked(long ptr, long code, nativeConnectCallbackPointer callback)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabWidget::tabBarDoubleClicked, [=](int index)
                         { callback(code, (void *)&index); });
    }
}