#include <map>
#include <QApplication>
#include <string.h>

typedef void (*nativeEventCallback)(long, long);
typedef void (*nativeConnectCallback)(long);
typedef void (*nativeConnectCallbackChar)(long, char *);
typedef void (*nativeConnectCallbackInt)(long, int);
typedef void (*nativeConnectCallbackIntInt)(long, int, int);
typedef void (*nativeConnectCallbackBool)(long, bool);
typedef void (*nativeConnectCallbackDouble)(long, double);
typedef void (*nativeConnectCallbackPointer)(long, void *);

typedef void *(*nativeCallbackPointer)(long, void *);

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
    void hideEventMapPut(long ptr, nativeEventCallback callback)
    {
        hideEventMap[ptr] = callback;
    }

    nativeEventCallback hideEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = hideEventMap.find(ptr);
        if (iter != hideEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void hideEventMapRemove(long ptr)
    {
        hideEventMap.erase(ptr);
    }

    // wheelEvent
    void wheelEventMapPut(long ptr, nativeEventCallback callback)
    {
        wheelEventMap[ptr] = callback;
    }

    nativeEventCallback wheelEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = wheelEventMap.find(ptr);
        if (iter != wheelEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void wheelEventMapRemove(long ptr)
    {
        wheelEventMap.erase(ptr);
    }

    // contextMenuEvent
    void contextMenuEventMapPut(long ptr, nativeEventCallback callback)
    {
        contextMenuEventMap[ptr] = callback;
    }

    nativeEventCallback contextMenuEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = contextMenuEventMap.find(ptr);
        if (iter != contextMenuEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void contextMenuEventMapRemove(long ptr)
    {
        contextMenuEventMap.erase(ptr);
    }
    // dragEnterEventMap
    void dragEnterEventMapPut(long ptr, nativeEventCallback callback)
    {
        dragEnterEventMap[ptr] = callback;
    }

    nativeEventCallback dragEnterEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = dragEnterEventMap.find(ptr);
        if (iter != dragEnterEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void dragEnterEventMapRemove(long ptr)
    {
        dragEnterEventMap.erase(ptr);
    }

    // dragLeaveEventMap
    void dragLeaveEventMapPut(long ptr, nativeEventCallback callback)
    {
        dragLeaveEventMap[ptr] = callback;
    }

    nativeEventCallback dragLeaveEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = dragLeaveEventMap.find(ptr);
        if (iter != dragLeaveEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void dragLeaveEventMapRemove(long ptr)
    {
        dragLeaveEventMap.erase(ptr);
    }

    // dragMoveEventMap
    void dragMoveEventMapPut(long ptr, nativeEventCallback callback)
    {
        dragMoveEventMap[ptr] = callback;
    }

    nativeEventCallback dragMoveEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = dragMoveEventMap.find(ptr);
        if (iter != dragMoveEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void dragMoveEventMapRemove(long ptr)
    {
        dragMoveEventMap.erase(ptr);
    }

    // dropEventMap
    void dropEventMapPut(long ptr, nativeEventCallback callback)
    {
        dropEventMap[ptr] = callback;
    }

    nativeEventCallback dropEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = dropEventMap.find(ptr);
        if (iter != dropEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void dropEventMapRemove(long ptr)
    {
        dropEventMap.erase(ptr);
    }
    // focusOutEventMap
    void focusOutEventMapPut(long ptr, nativeEventCallback callback)
    {
        focusOutEventMap[ptr] = callback;
    }

    nativeEventCallback focusOutEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = focusOutEventMap.find(ptr);
        if (iter != focusOutEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void focusOutEventMapRemove(long ptr)
    {
        focusOutEventMap.erase(ptr);
    }
    // helpEventMap
    void helpEventMapPut(long ptr, nativeEventCallback callback)
    {
        helpEventMap[ptr] = callback;
    }

    nativeEventCallback helpEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = helpEventMap.find(ptr);
        if (iter != helpEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void helpEventMapRemove(long ptr)
    {
        helpEventMap.erase(ptr);
    }
    // inputMethodEventMap
    void inputMethodEventMapPut(long ptr, nativeEventCallback callback)
    {
        inputMethodEventMap[ptr] = callback;
    }

    nativeEventCallback inputMethodEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = inputMethodEventMap.find(ptr);
        if (iter != inputMethodEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void inputMethodEventMapRemove(long ptr)
    {
        inputMethodEventMap.erase(ptr);
    }
    // keyReleaseEventMap
    void keyReleaseEventMapPut(long ptr, nativeEventCallback callback)
    {
        keyReleaseEventMap[ptr] = callback;
    }

    nativeEventCallback keyReleaseEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = keyReleaseEventMap.find(ptr);
        if (iter != keyReleaseEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void keyReleaseEventMapRemove(long ptr)
    {
        keyReleaseEventMap.erase(ptr);
    }
    // mouseDoubleClickEventMap
    void mouseDoubleClickEventMapPut(long ptr, nativeEventCallback callback)
    {
        mouseDoubleClickEventMap[ptr] = callback;
    }

    nativeEventCallback mouseDoubleClickEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = mouseDoubleClickEventMap.find(ptr);
        if (iter != mouseDoubleClickEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void mouseDoubleClickEventMapRemove(long ptr)
    {
        mouseDoubleClickEventMap.erase(ptr);
    }

    

    // universalCallback
    void callbackMapPut(char *type, long ptr, nativeCallbackPointer callback)
    {
        std::string ptrStr = getPtrStr(type, ptr);
        callbackMap[ptrStr] = callback;
    }

    nativeCallbackPointer callbackMapGet(char *type, long ptr)
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

    void callbackMapRemove(char *type, long ptr)
    {
        std::string ptrStr = getPtrStr(type, ptr);
        callbackMap.erase(ptrStr);
    }

    std::string getPtrStr(char *type, long ptr)
    {
        std::string result(type);
        return result + std::to_string(ptr);
    }
};
