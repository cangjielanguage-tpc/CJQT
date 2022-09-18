#include <stdio.h>
#include <stdint.h>
#include <string>
#include "data_type.h"

extern "C"
{

    int nativeCPointerToInt(void *data)
    {
        return (int)(intptr_t)data;
    }

    char *nativeCPointerToString(void *data)
    {
        return (char *)data;
    }

    bool nativeCPointerToBool(void *data)
    {
        return (bool)data;
    }

    CjDataIntInt nativeCPointerToCjDataIntInt(void *data)
    {
        return *(CjDataIntInt *)data;
    }
}