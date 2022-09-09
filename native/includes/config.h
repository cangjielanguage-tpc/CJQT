#include <map>
#include <QApplication>

typedef void (*nativeEventCallback)(long, long);
typedef void (*nativeConnectCallback)(long);
typedef void (*nativeConnectCallbackChar)(long, char *);
typedef void (*nativeConnectCallbackInt)(long, int);
typedef void (*nativeConnectCallbackIntInt)(long, int, int);
typedef void (*nativeConnectCallbackBool)(long, bool);
typedef void (*nativeConnectCallbackDouble)(long, double);

#define APPLICATION_CREATE                                                   \
    if (appConfig->appInit && appConfig->app == nullptr)                     \
    {                                                                        \
        appConfig->app = new QApplication(appConfig->argc, appConfig->argv); \
    }

class Config
{
private:
    std::map<long, nativeEventCallback> paintEventMap;
    std::map<long, nativeEventCallback> mousePressEventMap;
    std::map<long, nativeEventCallback> mouseReleaseEventMap;
    std::map<long, nativeEventCallback> mouseMoveEventMap;
    std::map<long, nativeEventCallback> keyPressEventMap;
    std::map<long, nativeEventCallback> hideEventMap;
    std::map<long, nativeEventCallback> wheelEventMap;

public:
    Config() {}

    bool appInit = false;
    QApplication *app = nullptr;
    int argc = 0;
    char **argv;
    // paintEvent
    void paintEventMapPut(long ptr, nativeEventCallback callback)
    {
        paintEventMap[ptr] = callback;
    }

    nativeEventCallback paintEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = paintEventMap.find(ptr);
        if (iter != paintEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void paintEventMapRemove(long ptr)
    {
        paintEventMap.erase(ptr);
    }
    // mousePressEvent
    void mousePressEventMapPut(long ptr, nativeEventCallback callback)
    {
        mousePressEventMap[ptr] = callback;
    }

    nativeEventCallback mousePressEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = mousePressEventMap.find(ptr);
        if (iter != mousePressEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void mousePressEventMapRemove(long ptr)
    {
        mousePressEventMap.erase(ptr);
    }
    // mouseReleaseEvent
    void mouseReleaseEventMapPut(long ptr, nativeEventCallback callback)
    {
        mouseReleaseEventMap[ptr] = callback;
    }

    nativeEventCallback mouseReleaseEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = mouseReleaseEventMap.find(ptr);
        if (iter != mouseReleaseEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void mouseReleaseEventMapRemove(long ptr)
    {
        mouseReleaseEventMap.erase(ptr);
    }
    // mouseMoveEvent
    void mouseMoveEventMapPut(long ptr, nativeEventCallback callback)
    {
        mouseMoveEventMap[ptr] = callback;
    }

    nativeEventCallback mouseMoveEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = mouseMoveEventMap.find(ptr);
        if (iter != mouseMoveEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void mouseMoveEventMapRemove(long ptr)
    {
        mouseMoveEventMap.erase(ptr);
    }
    // keyPressEvent
    void keyPressEventMapPut(long ptr, nativeEventCallback callback)
    {
        keyPressEventMap[ptr] = callback;
    }

    nativeEventCallback keyPressEventMapGet(long ptr)
    {
        std::map<long, nativeEventCallback>::iterator iter;
        iter = keyPressEventMap.find(ptr);
        if (iter != keyPressEventMap.end())
        {
            return iter->second;
        }
        return nullptr;
    }

    void keyPressEventMapRemove(long ptr)
    {
        keyPressEventMap.erase(ptr);
    }
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
};
