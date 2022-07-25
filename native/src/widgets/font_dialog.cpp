#include "font_dialog.h"

extern "C"
{

    // QFontDialog

    long nativeFileDialogGetFont(long parentPtr)
    {
        bool fontSelected;
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QFont font = QFontDialog::getFont(&fontSelected, parent);
        if (fontSelected){
            reinterpret_cast<long>(&font);
        }
        return 0;
    }

}