#ifndef __DATA_TYPE_H_
#define __DATA_TYPE_H_

typedef struct
{
    int p1;
    int p2;
} CjDataIntInt;

typedef struct
{
    uintptr_t p1;
    int p2;
} CjDataLongInt;

typedef struct
{
    uintptr_t p1;
    uintptr_t p2;
} CjDataLongLong;

typedef struct
{
    uintptr_t p1;
    uintptr_t p2;
    uintptr_t p3;
} CjDataLongLongLong;

#endif