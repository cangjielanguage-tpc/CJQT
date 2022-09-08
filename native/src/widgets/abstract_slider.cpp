#include "abstract_slider.h"

extern "C"
{
    long nativeAbstractSliderCreate(long parentPtr)
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
        return reinterpret_cast<long>(slider);
    }
    void nativeAbstractSliderDelete(long ptr)
    {
        CjAbstractSlider *instance = reinterpret_cast<CjAbstractSlider *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}