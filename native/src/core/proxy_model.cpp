/*
 * CJQT native bindings: QSortFilterProxyModel
 */
#include <QSortFilterProxyModel>
#include "native_string.h"

extern "C"
{
    uintptr_t nativeSortFilterProxyModelCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QSortFilterProxyModel(parent));
    }

    void nativeSortFilterProxyModelDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSortFilterProxyModel *>(static_cast<uintptr_t>(ptr));
    }

    void nativeSortFilterProxyModelSetFilterRegExp(uintptr_t ptr, const char *pattern)
    {
        reinterpret_cast<QSortFilterProxyModel *>(static_cast<uintptr_t>(ptr))->setFilterRegularExpression(
            QRegularExpression(QString::fromUtf8(pattern)));
    }

    void nativeSortFilterProxyModelSetFilterKeyColumn(uintptr_t ptr, int column)
    {
        reinterpret_cast<QSortFilterProxyModel *>(static_cast<uintptr_t>(ptr))->setFilterKeyColumn(column);
    }

    int nativeSortFilterProxyModelFilterKeyColumn(uintptr_t ptr)
    {
        return reinterpret_cast<QSortFilterProxyModel *>(static_cast<uintptr_t>(ptr))->filterKeyColumn();
    }

    void nativeSortFilterProxyModelSetDynamicSortFilter(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QSortFilterProxyModel *>(static_cast<uintptr_t>(ptr))->setDynamicSortFilter(b);
    }

    bool nativeSortFilterProxyModelIsSortLocaleAware(uintptr_t ptr)
    {
        return reinterpret_cast<QSortFilterProxyModel *>(static_cast<uintptr_t>(ptr))->isSortLocaleAware();
    }

    void nativeSortFilterProxyModelSetSortRole(uintptr_t ptr, int role)
    {
        reinterpret_cast<QSortFilterProxyModel *>(static_cast<uintptr_t>(ptr))->setSortRole(role);
    }

    int nativeSortFilterProxyModelSortRole(uintptr_t ptr)
    {
        return reinterpret_cast<QSortFilterProxyModel *>(static_cast<uintptr_t>(ptr))->sortRole();
    }

    void nativeSortFilterProxyModelSort(uintptr_t ptr, int column, int order)
    {
        reinterpret_cast<QSortFilterProxyModel *>(static_cast<uintptr_t>(ptr))->sort(column,
                                                                                   static_cast<Qt::SortOrder>(order));
    }

    void nativeSortFilterProxyModelSetSourceModel(uintptr_t ptr, uintptr_t sourcePtr)
    {
        QAbstractItemModel *source = reinterpret_cast<QAbstractItemModel *>(static_cast<uintptr_t>(sourcePtr));
        reinterpret_cast<QSortFilterProxyModel *>(static_cast<uintptr_t>(ptr))->setSourceModel(source);
    }
}
