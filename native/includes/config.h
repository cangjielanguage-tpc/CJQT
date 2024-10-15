#include <map>
#include <QApplication>
#include <string.h>
#include <iostream>


typedef void (*nativeEventCallback)(uintptr_t, uintptr_t);
typedef void (*nativeConnectCallback)(uintptr_t);
typedef void (*nativeConnectCallbackChar)(uintptr_t, char *);
typedef void (*nativeConnectCallbackInt)(uintptr_t, int);
typedef void (*nativeConnectCallbackIntInt)(uintptr_t, int, int);
typedef void (*nativeConnectCallbackBool)(uintptr_t, bool);
typedef void (*nativeConnectCallbackDouble)(uintptr_t, double);
typedef void (*nativeConnectCallbackPointer)(uintptr_t, void *);

typedef void *(*nativeCallbackPointer)(uintptr_t, void *);

#define APPLICATION_CREATE                                                   \
    if (appConfig->appInit && appConfig->app == nullptr)                     \
    {                                                                        \
        appConfig->app = new QApplication(appConfig->argc, appConfig->argv); \
    }

class Config
{
private:
    std::map<long, nativeEventCallback> hideEventMap;
    std::map<long, nativeEventCallback> wheelEventMap;
    std::map<long, nativeEventCallback> contextMenuEventMap;
    std::map<long, nativeEventCallback> dragEnterEventMap;
    std::map<long, nativeEventCallback> dragLeaveEventMap;
    std::map<long, nativeEventCallback> dragMoveEventMap;
    std::map<long, nativeEventCallback> dropEventMap;
    std::map<long, nativeEventCallback> focusOutEventMap;
    std::map<long, nativeEventCallback> helpEventMap;
    std::map<long, nativeEventCallback> inputMethodEventMap;
    std::map<long, nativeEventCallback> keyReleaseEventMap;
    std::map<long, nativeEventCallback> mouseDoubleClickEventMap;

    std::map<std::string, nativeCallbackPointer> callbackMap;

public:
    Config() {}

    bool appInit = false;
    QApplication *app = nullptr;
    int argc = 0;
    char **argv;
    
    // hideEvent
    void hideEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        hideEventMap[ptr] = callback;
    }

    nativeEventCallback hideEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = hideEventMap.find(ptr);
        if (iter != hideEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void hideEventMapRemove(uintptr_t ptr)
    {
        hideEventMap.erase(ptr);
    }

    // wheelEvent
    void wheelEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        wheelEventMap[ptr] = callback;
    }

    nativeEventCallback wheelEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = wheelEventMap.find(ptr);
        if (iter != wheelEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void wheelEventMapRemove(uintptr_t ptr)
    {
        wheelEventMap.erase(ptr);
    }

    // contextMenuEvent
    void contextMenuEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        contextMenuEventMap[ptr] = callback;
    }

    nativeEventCallback contextMenuEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = contextMenuEventMap.find(ptr);
        if (iter != contextMenuEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void contextMenuEventMapRemove(uintptr_t ptr)
    {
        contextMenuEventMap.erase(ptr);
    }
    // dragEnterEventMap
    void dragEnterEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        dragEnterEventMap[ptr] = callback;
    }

    nativeEventCallback dragEnterEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = dragEnterEventMap.find(ptr);
        if (iter != dragEnterEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void dragEnterEventMapRemove(uintptr_t ptr)
    {
        dragEnterEventMap.erase(ptr);
    }

    // dragLeaveEventMap
    void dragLeaveEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        dragLeaveEventMap[ptr] = callback;
    }

    nativeEventCallback dragLeaveEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = dragLeaveEventMap.find(ptr);
        if (iter != dragLeaveEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void dragLeaveEventMapRemove(uintptr_t ptr)
    {
        dragLeaveEventMap.erase(ptr);
    }

    // dragMoveEventMap
    void dragMoveEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        dragMoveEventMap[ptr] = callback;
    }

    nativeEventCallback dragMoveEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = dragMoveEventMap.find(ptr);
        if (iter != dragMoveEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void dragMoveEventMapRemove(uintptr_t ptr)
    {
        dragMoveEventMap.erase(ptr);
    }

    // dropEventMap
    void dropEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        dropEventMap[ptr] = callback;
    }

    nativeEventCallback dropEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = dropEventMap.find(ptr);
        if (iter != dropEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void dropEventMapRemove(uintptr_t ptr)
    {
        dropEventMap.erase(ptr);
    }
    // focusOutEventMap
    void focusOutEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        focusOutEventMap[ptr] = callback;
    }

    nativeEventCallback focusOutEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = focusOutEventMap.find(ptr);
        if (iter != focusOutEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void focusOutEventMapRemove(uintptr_t ptr)
    {
        focusOutEventMap.erase(ptr);
    }
    // helpEventMap
    void helpEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        helpEventMap[ptr] = callback;
    }

    nativeEventCallback helpEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = helpEventMap.find(ptr);
        if (iter != helpEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void helpEventMapRemove(uintptr_t ptr)
    {
        helpEventMap.erase(ptr);
    }
    // inputMethodEventMap
    void inputMethodEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        inputMethodEventMap[ptr] = callback;
    }

    nativeEventCallback inputMethodEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = inputMethodEventMap.find(ptr);
        if (iter != inputMethodEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void inputMethodEventMapRemove(uintptr_t ptr)
    {
        inputMethodEventMap.erase(ptr);
    }
    // keyReleaseEventMap
    void keyReleaseEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        keyReleaseEventMap[ptr] = callback;
    }

    nativeEventCallback keyReleaseEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = keyReleaseEventMap.find(ptr);
        if (iter != keyReleaseEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void keyReleaseEventMapRemove(uintptr_t ptr)
    {
        keyReleaseEventMap.erase(ptr);
    }
    // mouseDoubleClickEventMap
    void mouseDoubleClickEventMapPut(uintptr_t ptr, nativeEventCallback callback)
    {
        mouseDoubleClickEventMap[ptr] = callback;
    }

    nativeEventCallback mouseDoubleClickEventMapGet(uintptr_t ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = mouseDoubleClickEventMap.find(ptr);
        if (iter != mouseDoubleClickEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void mouseDoubleClickEventMapRemove(uintptr_t ptr)
    {
        mouseDoubleClickEventMap.erase(ptr);
    }

    

    // universalCallback
    void callbackMapPut(char *type, uintptr_t ptr, nativeCallbackPointer callback)
    {
        std::string ptrStr = getPtrStr(type, ptr);
        callbackMap[ptrStr] = callback;
    }

    nativeCallbackPointer callbackMapGet(char *type, uintptr_t ptr)
    {
        std::string ptrStr = getPtrStr(type, ptr);
        std::map<std::string, nativeCallbackPointer>::iterator iter;
        iter = callbackMap.find(ptrStr);
        if (iter != callbackMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void callbackMapRemove(char *type, uintptr_t ptr)
    {
        std::string ptrStr = getPtrStr(type, ptr);
        callbackMap.erase(ptrStr);
    }

    std::string getPtrStr(char *type, uintptr_t ptr)
    {
        std::string result(type);
        return result + std::to_string(ptr);
    }
};
