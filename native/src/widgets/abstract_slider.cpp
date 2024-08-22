#include "abstract_slider.h"

extern "C"
{
    uintptr_t nativeAbstractSliderCreate(uintptr_t parentPtr)
    {
        CjAbstractSlider *slider;
        if (parentPtr == 0L)
        {
            slider = new CjAbstractSlider();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            slider = new CjAbstractSlider(parent);
        }
        return reinterpret_cast<uintptr_t>(slider);
    }
    void nativeAbstractSliderDelete(uintptr_t ptr)
    {
        CjAbstractSlider *instance = reinterpret_cast<CjAbstractSlider *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}