#include "tab_bar.h"

#include <QIcon>

extern "C"
{

    // QTabBar

    uintptr_t nativeTabBarCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjQtTabBar *tabBar;
        if (parentPtr == 0L)
        {
            tabBar = new CjQtTabBar();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            tabBar = new CjQtTabBar(parent);
        }
        return reinterpret_cast<uintptr_t>(tabBar);
    }

    void nativeTabBarDelete(uintptr_t ptr)
    {
        CjQtTabBar *instance = reinterpret_cast<CjQtTabBar *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeTabBarAddTab(uintptr_t ptr, const char *text)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->addTab(text);
    }

    void nativeTabBarAddTabWithIcon(uintptr_t ptr, uintptr_t iconPtr, const char *text)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->addTab(*icon, text);
    }

    void nativeTabBarInsertTab(uintptr_t ptr, int index, const char *text)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->insertTab(index, text);
    }

    void nativeTabBarInsertTabWithIcon(uintptr_t ptr, int index, uintptr_t iconPtr, const char *text)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->insertTab(index, *icon, text);
    }

    void nativeTabBarRemoveTab(uintptr_t ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->removeTab(index);
    }

    void nativeTabBarMoveTab(uintptr_t ptr, int from, int to)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->moveTab(from, to);
    }

    bool nativeTabBarIsTabEnabled(uintptr_t ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->isTabEnabled(index);
    }

    void nativeTabBarSetTabEnabled(uintptr_t ptr, int index, bool enabl)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setTabEnabled(index, enabl);
    }

    const char *nativeTabBarTabText(uintptr_t ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QString str = instance->tabText(index);
        return qstrdup(str.toUtf8());
    }

    void nativeTabBarSetTabText(uintptr_t ptr, int index, const char *text)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setTabText(index, text);
    }

    uintptr_t nativeTabBarTabTextColor(uintptr_t ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QColor color = instance->tabTextColor(index);
        return reinterpret_cast<uintptr_t>(&color);
    }

    void nativeTabBarSetTabTextColor(uintptr_t ptr, int index, uintptr_t colorPtr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        instance->setTabTextColor(index, *color);
    }

    uintptr_t nativeTabBarTabIcon(uintptr_t ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QIcon icon = instance->tabIcon(index);
        return reinterpret_cast<uintptr_t>(&icon);
    }

    void nativeTabBarSetTabIcon(uintptr_t ptr, int index, uintptr_t iconPtr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->setTabIcon(index, *icon);
    }

    uintptr_t nativeTabBarTabData(uintptr_t ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QVariant variant = instance->tabData(index);
        return reinterpret_cast<uintptr_t>(&variant);
    }

    void nativeTabBarSetTabData(uintptr_t ptr, int index, uintptr_t variantPtr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QVariant *variant = reinterpret_cast<QVariant *>(static_cast<uintptr_t>(variantPtr));
        instance->setTabData(index, *variant);
    }

    uintptr_t nativeTabBarTabRect(uintptr_t ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QRect rect = instance->tabRect(index);
        return reinterpret_cast<uintptr_t>(&rect);
    }

    int nativeTabBarTabAt(uintptr_t ptr, uintptr_t ponitPtr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QPoint *ponit = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ponitPtr));
        return instance->tabAt(*ponit);
    }

    int nativeTabBarCurrentIndex(uintptr_t ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->currentIndex();
    }

    int nativeTabBarCount(uintptr_t ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->count();
    }

    void nativeTabBarSetDrawBase(uintptr_t ptr, bool drawTheBase)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setDrawBase(drawTheBase);
    }

    bool nativeTabBarDrawBase(uintptr_t ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->drawBase();
    }

    uintptr_t nativeTabBarIconSize(uintptr_t ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->iconSize();
        return reinterpret_cast<uintptr_t>(&size);
    }

    void nativeTabBarSetIconSize(uintptr_t ptr, uintptr_t sizePtr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QSize *size = reinterpret_cast<QSize *>(static_cast<uintptr_t>(sizePtr));
        instance->setIconSize(*size);
    }

    void nativeTabBarSetUsesScrollButtons(uintptr_t ptr, bool useButtons)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setUsesScrollButtons(useButtons);
    }

    bool nativeTabBarUsesScrollButtons(uintptr_t ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->usesScrollButtons();
    }

    void nativeTabBarSetTabsClosable(uintptr_t ptr, bool closable)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setTabsClosable(closable);
    }

    bool nativeTabBarTabsClosable(uintptr_t ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->tabsClosable();
    }

    void nativeTabBarSetExpanding(uintptr_t ptr, bool expanding)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setExpanding(expanding);
    }

    bool nativeTabBarExpanding(uintptr_t ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->expanding();
    }

    void nativeTabBarSetMovable(uintptr_t ptr, bool movable)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setMovable(movable);
    }

    bool nativeTabBarIsMovable(uintptr_t ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->isMovable();
    }

    void nativeTabBarSetDocumentMode(uintptr_t ptr, bool documentMode)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setDocumentMode(documentMode);
    }

    bool nativeTabBarDocumentMode(uintptr_t ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->documentMode();
    }

    void nativeTabBarSetAutoHide(uintptr_t ptr, bool hide)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setAutoHide(hide);
    }

    bool nativeTabBarAutoHide(uintptr_t ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->autoHide();
    }

    void nativeTabBarSetChangeCurrentOnDrag(uintptr_t ptr, bool change)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setChangeCurrentOnDrag(change);
    }

    bool nativeTabBarChangeCurrentOnDrag(uintptr_t ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->changeCurrentOnDrag();
    }

    void nativeTabBarConnectCurrentChanged(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabBar::currentChanged, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabBarConnectTabCloseRequested(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabBar::tabCloseRequested, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabBarConnectTabMoved(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabBar::tabMoved, [=](int from, int to)
                         { CjDataIntInt  data = {    
 	                            .p1= from,    
 	                            .p2 = to
                            };
                            callback(code, (void *)&data); });
    }

    void nativeTabBarConnectTabBarClicked(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabBar::tabBarClicked, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabBarConnectTabBarDoubleClicked(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabBar::tabBarDoubleClicked, [=](int index)
                         { callback(code, (void *)&index); });
    }
}
