# QCore 封装进度

> 适配版本：Cangjie 1.0.5 / Qt 5.14.2
>
> 统计说明：`▓` 表示已完成比例（满格 10 格为 100%），`░` 表示尚未完成。
>
> - 已完成（▓▓▓▓▓▓▓▓░░ 及以上）：类主体及常用接口已封装，可在示例/测试中直接使用
> - 进行中（▓▓░░░░░░░░ ~ ▓▓▓▓▓▓░░░░）：已完成创建/删除等基础接口，常用接口封装不完整
> - 未移植（░░░░░░░░░░）：尚无对应封装代码

## 进度总览

| 分类 | 数量 |
| :--- | :--- |
| 已完成 | 6 |
| 进行中 | 12 |
| 未移植 | 240+ |

## 已完成

```
QCore:

QEvent                    ▓▓▓▓▓▓▓▓▓░         QModelIndex               ▓▓▓▓▓▓▓▓░░
QPointF                   ▓▓▓▓▓▓▓▓▓░         QSize                     ▓▓▓▓▓▓▓▓░░
QTimer                    ▓▓▓▓▓▓▓▓░░         QVariant                  ▓▓▓▓▓▓▓▓░░
```

## 进行中

```
QCore:

QAbstractItemModel        ▓▓▓▓▓░░░░░         QAbstractListModel        ▓▓▓▓▓░░░░░
QItemSelectionModel       ▓▓▓░░░░░░░         QLineF                    ▓▓▓▓▓░░░░░
QObject                   ▓▓▓░░░░░░░         QPoint                    ▓▓▓▓░░░░░░
QRect                     ▓▓▓▓░░░░░░         QRectF                    ▓▓▓▓▓░░░░░
QSizeF                    ▓▓▓▓░░░░░░         QStringList               ▓▓▓▓░░░░░░
QStringListModel          ▓▓▓▓▓░░░░░         QUrl                      ▓▓▓▓▓░░░░░
```

## 未移植

以下 Qt Core 类尚无封装（仅列常用类）：

```
QAbstractAnimation        ░░░░░░░░░░         QAbstractEventDispatcher ░░░░░░░░░░
QAbstractProxyModel       ░░░░░░░░░░         QAbstractTableModel      ░░░░░░░░░░
QAnimationGroup           ░░░░░░░░░░         QAtomicInt               ░░░░░░░░░░
QBasicTimer               ░░░░░░░░░░         QBitArray                ░░░░░░░░░░
QBuffer                   ░░░░░░░░░░         QByteArray               ░░░░░░░░░░
QCache                    ░░░░░░░░░░         QChar                    ░░░░░░░░░░
QChildEvent               ░░░░░░░░░░         QCollator                ░░░░░░░░░░
QCommandLineOption        ░░░░░░░░░░         QCommandLineParser       ░░░░░░░░░░
QCoreApplication          ░░░░░░░░░░         QCryptographicHash       ░░░░░░░░░░
QDataStream               ░░░░░░░░░░         QDate                    ░░░░░░░░░░
QDateTime                 ░░░░░░░░░░         QDir                     ░░░░░░░░░░
QEasingCurve              ░░░░░░░░░░         QElapsedTimer            ░░░░░░░░░░
QEventLoop                ░░░░░░░░░░         QFile                    ░░░░░░░░░░
QFileDevice               ░░░░░░░░░░         QFileInfo                ░░░░░░░░░░
QFileSystemWatcher        ░░░░░░░░░░         QFlags                   ░░░░░░░░░░
QFuture                   ░░░░░░░░░░         QFutureWatcher           ░░░░░░░░░░
QHash                     ░░░░░░░░░░         QIODevice                ░░░░░░░░░░
QIdentityProxyModel       ░░░░░░░░░░         QItemSelection           ░░░░░░░░░░
QItemSelectionRange       ░░░░░░░░░░         QJsonArray               ░░░░░░░░░░
QJsonDocument             ░░░░░░░░░░         QJsonObject              ░░░░░░░░░░
QJsonValue                ░░░░░░░░░░         QKeyCombination          ░░░░░░░░░░
QLatin1String             ░░░░░░░░░░         QLibrary                 ░░░░░░░░░░
QLine                     ░░░░░░░░░░         QList                    ░░░░░░░░░░
QLocale                   ░░░░░░░░░░         QLockFile                ░░░░░░░░░░
QMap                      ░░░░░░░░░░         QMargins                 ░░░░░░░░░░
QMetaClassInfo            ░░░░░░░░░░         QMetaEnum                ░░░░░░░░░░
QMetaMethod               ░░░░░░░░░░         QMetaObject              ░░░░░░░░░░
QMetaProperty             ░░░░░░░░░░         QMetaType                ░░░░░░░░░░
QMimeData                 ░░░░░░░░░░         QMimeDatabase            ░░░░░░░░░░
QMutex                    ░░░░░░░░░░         QParallelAnimationGroup  ░░░░░░░░░░
QPersistentModelIndex     ░░░░░░░░░░         QPluginLoader            ░░░░░░░░░░
QPointer                  ░░░░░░░░░░         QProcess                 ░░░░░░░░░░
QPropertyAnimation        ░░░░░░░░░░         QQueue                   ░░░░░░░░░░
QRandomGenerator          ░░░░░░░░░░         QReadWriteLock           ░░░░░░░░░░
QRegularExpression        ░░░░░░░░░░         QRegularExpressionMatch  ░░░░░░░░░░
QResource                 ░░░░░░░░░░         QSaveFile                ░░░░░░░░░░
QSemaphore                ░░░░░░░░░░         QSequentialAnimationGroup░░░░░░░░░░
QSet                      ░░░░░░░░░░         QSettings                ░░░░░░░░░░
QSharedData               ░░░░░░░░░░         QSharedMemory            ░░░░░░░░░░
QSharedPointer            ░░░░░░░░░░         QSignalBlocker           ░░░░░░░░░░
QSignalMapper             ░░░░░░░░░░         QSizePolicy              ░░░░░░░░░░
QSortFilterProxyModel     ░░░░░░░░░░         QStack                   ░░░░░░░░░░
QStandardPaths            ░░░░░░░░░░         QStorageInfo             ░░░░░░░░░░
QString                   ░░░░░░░░░░         QStringConverter         ░░░░░░░░░░
QStringDecoder            ░░░░░░░░░░         QStringEncoder           ░░░░░░░░░░
QStringMatcher            ░░░░░░░░░░         QStringView              ░░░░░░░░░░
QSysInfo                  ░░░░░░░░░░         QSystemSemaphore         ░░░░░░░░░░
QTemporaryDir             ░░░░░░░░░░         QTemporaryFile           ░░░░░░░░░░
QTextBoundaryFinder       ░░░░░░░░░░         QTextStream              ░░░░░░░░░░
QThread                   ░░░░░░░░░░         QThreadPool              ░░░░░░░░░░
QTime                     ░░░░░░░░░░         QTimeLine                ░░░░░░░░░░
QTimeZone                 ░░░░░░░░░░         QTimerEvent              ░░░░░░░░░░
QTranslator               ░░░░░░░░░░         QTransposeProxyModel     ░░░░░░░░░░
QUrlQuery                 ░░░░░░░░░░         QUuid                    ░░░░░░░░░░
QVariantAnimation         ░░░░░░░░░░         QVector                  ░░░░░░░░░░
QVersionNumber            ░░░░░░░░░░         QWaitCondition           ░░░░░░░░░░
QWeakPointer              ░░░░░░░░░░         QXmlStreamReader         ░░░░░░░░░░
QXmlStreamWriter          ░░░░░░░░░░         QXmlStreamAttribute      ░░░░░░░░░░
```

## 说明

- 基础设施：`namespace.cj`（Qt 常量/枚举定义）、`conversion.cpp`（C/CJ 类型转换）、`core_callback_map.cj`（回调映射）已提供，不属于某个具体类。
- `QString` 未单独封装，仓颉侧使用 `std.core.String`；`QStringList` 提供部分封装（`string_list.cj`）。
- 已封装类中，`QEvent`（`event.cj`）以事件基类和事件类型枚举为主；`QTimer` 支持创建/启动/停止/回调。
- 剩余 Qt Core 类多数在 Qt 内部/底层使用，按优先级后续逐步封装。
