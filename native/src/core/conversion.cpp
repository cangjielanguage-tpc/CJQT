#include <stdio.h>
#include <stdint.h>
#include <string>
#include <cstring>
#include "data_type.h"

extern "C"
{

    intptr_t nativeCPointerToInt(void *data)
    {
        return (intptr_t)data;
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

    CjDataLongInt nativeCPointerToCjDataLongInt(void *data)
    {
        return *(CjDataLongInt *)data;
    }

    CjDataLongLong nativeCPointerToCjDataLongLong(void *data)
    {
        return *(CjDataLongLong *)data;
    }

    CjDataLongLongLong nativeCPointerToCjDataLongLongLong(void *data)
    {
        return *(CjDataLongLongLong *)data;
    }
    
    void *nativeIntToCPointer(intptr_t data)
    {
        return (void *)(intptr_t)data;
    }

    void *nativeStringToCPointer(char *data)
    {
        if (data == nullptr)
        {
            return nullptr;
        }
        char *copy = new char[std::strlen(data) + 1];
        std::strcpy(copy, data);
        return (void *)copy;
    }

    void *nativeBoolToCPointer(bool data)
    {
        return (void *)data;
    }
}
