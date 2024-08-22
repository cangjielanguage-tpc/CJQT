#include "layout.h"

extern "C"
{
    // QLayout

    void nativeLayoutSetSpacing(uintptr_t ptr, int spacing)
	{
		QLayout *instance = reinterpret_cast<QLayout *>(static_cast<uintptr_t>(ptr));
		instance->setSpacing(spacing);
	}


    void nativeLayoutSetContentsMargins(uintptr_t ptr, int left, int top, int right, int bottom)
	{
		QLayout *instance = reinterpret_cast<QLayout *>(static_cast<uintptr_t>(ptr));
		instance->setContentsMargins(left, top, right, bottom);
	}
}