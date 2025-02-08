#include "tab_widget.h"

extern "C"
{

    // QTabWidget

    uintptr_t nativeTabWidgetCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(tabWidget);
    }

    void nativeTabWidgetDelete(uintptr_t ptr)
    {
        CjQtTabWidget *instance = reinterpret_cast<CjQtTabWidget *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeTabWidgetAddTab(uintptr_t ptr, uintptr_t widgetPtr, const char *text)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->addTab(widget, text);
    }

    void nativeTabWidgetAddTabWithIcon(uintptr_t ptr, uintptr_t widgetPtr, uintptr_t iconPtr, const char *text)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->addTab(widget, *icon, text);
    }

    void nativeTabWidgetInsertTab(uintptr_t ptr, int index, uintptr_t widgetPtr, const char *text)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->insertTab(index, widget, text);
    }

    void nativeTabWidgetInsertTabWithIcon(uintptr_t ptr, uintptr_t widgetPtr, int index, uintptr_t iconPtr, const char *text)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->insertTab(index, widget, *icon, text);
    }

    void nativeTabWidgetRemoveTab(uintptr_t ptr, int index)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->removeTab(index);
    }

    bool nativeTabWidgetIsTabEnabled(uintptr_t ptr, int index)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->isTabEnabled(index);
    }

    void nativeTabWidgetSetTabEnabled(uintptr_t ptr, int index, bool enabl)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setTabEnabled(index, enabl);
    }

    const char *nativeTabWidgetTabText(uintptr_t ptr, int index)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QString str = instance->tabText(index);
        return qstrdup(str.toUtf8());
    }

    void nativeTabWidgetSetTabText(uintptr_t ptr, int index, const char *text)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setTabText(index, text);
    }

    uintptr_t nativeTabWidgetTabIcon(uintptr_t ptr, int index)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QIcon icon = instance->tabIcon(index);
        return reinterpret_cast<uintptr_t>(&icon);
    }

    void nativeTabWidgetSetTabIcon(uintptr_t ptr, int index, uintptr_t iconPtr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->setTabIcon(index, *icon);
    }

    int nativeTabWidgetCurrentIndex(uintptr_t ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->currentIndex();
    }

    uintptr_t nativeTabWidgetCurrentWidget(uintptr_t ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->currentWidget();
        return reinterpret_cast<uintptr_t>(widget);
    }

    uintptr_t nativeTabWidgetWidget(uintptr_t ptr, int index)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->widget(index);
        return reinterpret_cast<uintptr_t>(widget);
    }

    int nativeTabWidgetIndexOf(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return instance->indexOf(widget);
    }

    int nativeTabWidgetCount(uintptr_t ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->count();
    }

    QSize nativeTabWidgetIconSize(uintptr_t ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        // QSize size = instance->iconSize();
        return instance->iconSize();
    }

    void nativeTabWidgetSetIconSize(uintptr_t ptr, int sizeW, int sizeH)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QSize size(sizeW,sizeH);
        instance->setIconSize(size);
    }

    void nativeTabWidgetSetUsesScrollButtons(uintptr_t ptr, bool useButtons)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setUsesScrollButtons(useButtons);
    }

    bool nativeTabWidgetUsesScrollButtons(uintptr_t ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->usesScrollButtons();
    }

    void nativeTabWidgetSetTabsClosable(uintptr_t ptr, bool closable)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setTabsClosable(closable);
    }

    bool nativeTabWidgetTabsClosable(uintptr_t ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->tabsClosable();
    }

    void nativeTabWidgetSetMovable(uintptr_t ptr, bool movable)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setMovable(movable);
    }

    bool nativeTabWidgetIsMovable(uintptr_t ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->isMovable();
    }

    void nativeTabWidgetSetDocumentMode(uintptr_t ptr, bool documentMode)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setDocumentMode(documentMode);
    }

    bool nativeTabWidgetDocumentMode(uintptr_t ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->documentMode();
    }

    void nativeTabWidgetSetTabBarAutoHide(uintptr_t ptr, bool hide)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->setTabBarAutoHide(hide);
    }

    bool nativeTabWidgetTabBarAutoHide(uintptr_t ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        return instance->tabBarAutoHide();
    }

    void nativeTabWidgetClear(uintptr_t ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        instance->clear();
    }

    uintptr_t nativeTabWidgetTabBar(uintptr_t ptr)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QTabBar *tabBar = instance->tabBar();
        return reinterpret_cast<uintptr_t>(tabBar);
    }

    void nativeTabWidgetConnectCurrentChanged(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabWidget::currentChanged, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabWidgetConnectTabCloseRequested(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabWidget::tabCloseRequested, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabWidgetConnectTabBarClicked(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabWidget::tabBarClicked, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabWidgetConnectTabBarDoubleClicked(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QTabWidget *instance = reinterpret_cast<QTabWidget *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabWidget::tabBarDoubleClicked, [=](int index)
                         { callback(code, (void *)&index); });
    }
}