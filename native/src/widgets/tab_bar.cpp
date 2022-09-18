#include "tab_bar.h"

#include <QIcon>

extern "C"
{

    // QTabBar

    long nativeTabBarCreate(long parentPtr)
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
        return reinterpret_cast<long>(tabBar);
    }

    void nativeTabBarDelete(long ptr)
    {
        CjQtTabBar *instance = reinterpret_cast<CjQtTabBar *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeTabBarAddTab(long ptr, const char *text)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->addTab(text);
    }

    void nativeTabBarAddTabWithIcon(long ptr, long iconPtr, const char *text)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->addTab(*icon, text);
    }

    void nativeTabBarInsertTab(long ptr, int index, const char *text)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->insertTab(index, text);
    }

    void nativeTabBarInsertTabWithIcon(long ptr, int index, long iconPtr, const char *text)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->insertTab(index, *icon, text);
    }

    void nativeTabBarRemoveTab(long ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->removeTab(index);
    }

    void nativeTabBarMoveTab(long ptr, int from, int to)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->moveTab(from, to);
    }

    bool nativeTabBarIsTabEnabled(long ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->isTabEnabled(index);
    }

    void nativeTabBarSetTabEnabled(long ptr, int index, bool enabl)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setTabEnabled(index, enabl);
    }

    const char *nativeTabBarTabText(long ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QString str = instance->tabText(index);
        return qstrdup(str.toUtf8());
    }

    void nativeTabBarSetTabText(long ptr, int index, const char *text)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setTabText(index, text);
    }

    long nativeTabBarTabTextColor(long ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QColor color = instance->tabTextColor(index);
        return reinterpret_cast<long>(&color);
    }

    void nativeTabBarSetTabTextColor(long ptr, int index, long colorPtr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        instance->setTabTextColor(index, *color);
    }

    long nativeTabBarTabIcon(long ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QIcon icon = instance->tabIcon(index);
        return reinterpret_cast<long>(&icon);
    }

    void nativeTabBarSetTabIcon(long ptr, int index, long iconPtr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->setTabIcon(index, *icon);
    }

    long nativeTabBarTabData(long ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QVariant variant = instance->tabData(index);
        return reinterpret_cast<long>(&variant);
    }

    void nativeTabBarSetTabData(long ptr, int index, long variantPtr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QVariant *variant = reinterpret_cast<QVariant *>(static_cast<uintptr_t>(variantPtr));
        instance->setTabData(index, *variant);
    }

    long nativeTabBarTabRect(long ptr, int index)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QRect rect = instance->tabRect(index);
        return reinterpret_cast<long>(&rect);
    }

    int nativeTabBarTabAt(long ptr, long ponitPtr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QPoint *ponit = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ponitPtr));
        return instance->tabAt(*ponit);
    }

    int nativeTabBarCurrentIndex(long ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->currentIndex();
    }

    int nativeTabBarCount(long ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->count();
    }

    void nativeTabBarSetDrawBase(long ptr, bool drawTheBase)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setDrawBase(drawTheBase);
    }

    bool nativeTabBarDrawBase(long ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->drawBase();
    }

    long nativeTabIconSize(long ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->iconSize();
        return reinterpret_cast<long>(&size);
    }

    void nativeTabBarSetIconSize(long ptr, long sizePtr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QSize *size = reinterpret_cast<QSize *>(static_cast<uintptr_t>(sizePtr));
        instance->setIconSize(*size);
    }

    void nativeTabBarSetUsesScrollButtons(long ptr, bool useButtons)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setUsesScrollButtons(useButtons);
    }

    bool nativeTabBarUsesScrollButtons(long ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->usesScrollButtons();
    }

    void nativeTabBarSetTabsClosable(long ptr, bool closable)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setTabsClosable(closable);
    }

    bool nativeTabBarTabsClosable(long ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->tabsClosable();
    }

    void nativeTabBarSetExpanding(long ptr, bool expanding)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setExpanding(expanding);
    }

    bool nativeTabBarExpanding(long ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->expanding();
    }

    void nativeTabBarSetMovable(long ptr, bool movable)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setMovable(movable);
    }

    bool nativeTabBarIsMovable(long ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->isMovable();
    }

    void nativeTabBarSetDocumentMode(long ptr, bool documentMode)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setDocumentMode(documentMode);
    }

    bool nativeTabBarDocumentMode(long ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->documentMode();
    }

    void nativeTabBarSetAutoHide(long ptr, bool hide)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setAutoHide(hide);
    }

    bool nativeTabBarAutoHide(long ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->autoHide();
    }

    void nativeTabBarSetChangeCurrentOnDrag(long ptr, bool change)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        instance->setChangeCurrentOnDrag(change);
    }

    bool nativeTabBarChangeCurrentOnDrag(long ptr)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        return instance->changeCurrentOnDrag();
    }

    void nativeTabBarConnectCurrentChanged(long ptr, long code, nativeConnectCallbackPointer callback)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabBar::currentChanged, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabBarConnectTabCloseRequested(long ptr, long code, nativeConnectCallbackPointer callback)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabBar::tabCloseRequested, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabBarConnectTabMoved(long ptr, long code, nativeConnectCallbackPointer callback)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabBar::tabMoved, [=](int from, int to)
                         { CjDataIntInt  data = {    
 	                            .p1= from,    
 	                            .p2 = to
                            };
                            callback(code, (void *)&data); });
    }

    void nativeTabBarConnectTabBarClicked(long ptr, long code, nativeConnectCallbackPointer callback)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabBar::tabBarClicked, [=](int index)
                         { callback(code, (void *)&index); });
    }

    void nativeTabBarConnectTabBarDoubleClicked(long ptr, long code, nativeConnectCallbackPointer callback)
    {
        QTabBar *instance = reinterpret_cast<QTabBar *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QTabBar::tabBarDoubleClicked, [=](int index)
                         { callback(code, (void *)&index); });
    }
}
