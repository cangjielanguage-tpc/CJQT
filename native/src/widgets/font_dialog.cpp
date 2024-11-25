#include "font_dialog.h"

extern "C"
{

    // QFontDialog

    uintptr_t nativeFileDialogGetFont(uintptr_t parentPtr)
    {
        bool fontSelected;
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QFont font = QFontDialog::getFont(&fontSelected, parent);
        if (fontSelected){
            reinterpret_cast<uintptr_t>(&font);
        }
        return 0;
    }

}