/*
 * CJQT native bindings: QWizard, QWizardPage, QSizeGrip
 */
#include <QWizard>
#include <QWizardPage>
#include <QSizeGrip>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QWizard ----

    uintptr_t nativeWizardCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QWizard(parent));
    }

    void nativeWizardDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QWizard *>(static_cast<uintptr_t>(ptr));
    }

    int nativeWizardAddPage(uintptr_t ptr, uintptr_t pagePtr)
    {
        QWizardPage *page = reinterpret_cast<QWizardPage *>(static_cast<uintptr_t>(pagePtr));
        return reinterpret_cast<QWizard *>(static_cast<uintptr_t>(ptr))->addPage(page);
    }

    int nativeWizardPageCount(uintptr_t ptr)
    {
        return reinterpret_cast<QWizard *>(static_cast<uintptr_t>(ptr))->pageIds().size();
    }

    int nativeWizardCurrentId(uintptr_t ptr)
    {
        return reinterpret_cast<QWizard *>(static_cast<uintptr_t>(ptr))->currentId();
    }

    void nativeWizardSetStartId(uintptr_t ptr, int id)
    {
        reinterpret_cast<QWizard *>(static_cast<uintptr_t>(ptr))->setStartId(id);
    }

    // ---- QWizardPage ----

    uintptr_t nativeWizardPageCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QWizardPage(parent));
    }

    void nativeWizardPageDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QWizardPage *>(static_cast<uintptr_t>(ptr));
    }

    void nativeWizardPageSetTitle(uintptr_t ptr, const char *title)
    {
        reinterpret_cast<QWizardPage *>(static_cast<uintptr_t>(ptr))->setTitle(QString::fromUtf8(title));
    }

    char *nativeWizardPageTitle(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QWizardPage *>(static_cast<uintptr_t>(ptr))->title());
    }

    // ---- QSizeGrip ----

    uintptr_t nativeSizeGripCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QSizeGrip(parent));
    }

    void nativeSizeGripDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSizeGrip *>(static_cast<uintptr_t>(ptr));
    }
}
