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
| 已完成 | 61 |
| 进行中 | 11 |
| 未移植 | 200+ |

## 已完成

```
QCore:

QBuffer                   ▓▓▓▓▓▓▓▓░░         QByteArray                ▓▓▓▓▓▓▓▓░░
QCryptographicHash        ▓▓▓▓▓▓▓▓░░
QCoreApplication          ▓▓▓▓▓▓▓▓░░         QDataStream               ▓▓▓▓▓▓▓▓░░
QDate                     ▓▓▓▓▓▓▓▓░░         QDateTime                 ▓▓▓▓▓▓▓▓░░
QDeadlineTimer            ▓▓▓▓▓▓▓▓░░         QDir                      ▓▓▓▓▓▓▓▓░░
QEasingCurve              ▓▓▓▓▓▓▓▓░░
QDirIterator              ▓▓▓▓▓▓▓▓░░         QElapsedTimer             ▓▓▓▓▓▓▓▓▓░
QEvent                    ▓▓▓▓▓▓▓▓▓░         QEventLoop                ▓▓▓▓▓▓▓▓░░
QFile                     ▓▓▓▓▓▓▓▓░░         QFileInfo                 ▓▓▓▓▓▓▓▓░░
QFileSystemWatcher        ▓▓▓▓▓▓▓▓░░         QJsonArray                ▓▓▓▓▓▓▓▓░░
QJsonDocument             ▓▓▓▓▓▓▓▓░░         QJsonObject               ▓▓▓▓▓▓▓▓░░
QJsonValue                ▓▓▓▓▓▓▓▓░░         QLibrary                  ▓▓▓▓▓▓▓▓░░
QLibraryInfo              ▓▓▓▓▓▓▓▓░░         QLocale                   ▓▓▓▓▓▓▓▓░░
QMargins                  ▓▓▓▓▓▓▓▓▓░         QMimeData                 ▓▓▓▓▓▓▓▓░░
QMimeType                 ▓▓▓▓▓▓▓▓░░
QModelIndex               ▓▓▓▓▓▓▓▓░░         QMutex                    ▓▓▓▓▓▓▓▓░░
QPersistentModelIndex     ▓▓▓▓▓▓▓▓░░         QPointF                   ▓▓▓▓▓▓▓▓▓░
QProcess                  ▓▓▓▓▓▓▓▓░░         QProcessEnvironment       ▓▓▓▓▓▓▓▓░░
QItemSelection            ▓▓▓▓▓▓▓▓░░         QRandomGenerator          ▓▓▓▓▓▓▓▓░░
QRandomGenerator64         ▓▓▓▓▓▓▓▓░░         QRegularExpression        ▓▓▓▓▓▓▓▓░░
QRegularExpressionMatch   ▓▓▓▓▓▓▓▓░░         QSaveFile                 ▓▓▓▓▓▓▓▓░░
QSemaphore                ▓▓▓▓▓▓▓▓░░         QSettings                 ▓▓▓▓▓▓▓▓░░
QAbstractTableModel       ▓▓▓▓▓▓▓▓░░         QIODevice                 ▓▓▓▓▓▓▓▓░░
QSize                     ▓▓▓▓▓▓▓▓░░         QSortFilterProxyModel     ▓▓▓▓▓▓▓▓░░
QStandardPaths            ▓▓▓▓▓▓▓▓▓░
QSysInfo                  ▓▓▓▓▓▓▓▓░░         QTemporaryDir             ▓▓▓▓▓▓▓▓░░
QTemporaryFile            ▓▓▓▓▓▓▓▓░░         QTextStream               ▓▓▓▓▓▓▓▓░░
QThread                   ▓▓▓▓▓▓▓▓░░         QTime                     ▓▓▓▓▓▓▓▓░░
QTimeLine                 ▓▓▓▓▓▓▓▓░░         QTimeZone                 ▓▓▓▓▓▓▓▓░░
QTimer                    ▓▓▓▓▓▓▓▓░░
QTranslator               ▓▓▓▓▓▓▓▓░░         QUrl                      ▓▓▓▓▓▓▓▓░░
QUrlQuery                 ▓▓▓▓▓▓▓▓░░         QUuid                     ▓▓▓▓▓▓▓▓░░
QVariant                  ▓▓▓▓▓▓▓▓░░         QVersionNumber            ▓▓▓▓▓▓▓▓░░
QXmlStreamReader          ▓▓▓▓▓▓▓▓░░
```

## 进行中

```
QCore:

QAbstractItemModel        ▓▓▓▓▓░░░░░         QAbstractListModel        ▓▓▓▓▓░░░░░
QItemSelectionModel       ▓▓▓░░░░░░░         QLineF                    ▓▓▓▓▓░░░░░
QObject                   ▓▓▓░░░░░░░         QPoint                    ▓▓▓▓░░░░░░
QRect                     ▓▓▓▓░░░░░░         QRectF                    ▓▓▓▓▓░░░░░
QSizeF                    ▓▓▓▓░░░░░░         QStringList               ▓▓▓▓▓▓░░░░
QStringListModel          ▓▓▓▓▓░░░░░
```

## 未移植

以下 Qt Core 类尚无封装（仅列常用类）：

```
QAbstractAnimation        ░░░░░░░░░░         QAbstractEventDispatcher ░░░░░░░░░░
QAbstractProxyModel       ░░░░░░░░░░         QAbstractTableModel      ░░░░░░░░░░
QAnimationGroup           ░░░░░░░░░░         QAtomicInt               ░░░░░░░░░░
QBasicTimer               ░░░░░░░░░░         QBitArray                ░░░░░░░░░░
QBuffer                   ░░░░░░░░░░         QCache                   ░░░░░░░░░░
QChar                     ░░░░░░░░░░         QChildEvent              ░░░░░░░░░░
QCollator                 ░░░░░░░░░░         QCommandLineOption       ░░░░░░░░░░
QCommandLineParser        ░░░░░░░░░░         QCoreApplication         ░░░░░░░░░░
QEasingCurve              ░░░░░░░░░░         QFileDevice              ░░░░░░░░░░
QFlags                    ░░░░░░░░░░         QFuture                  ░░░░░░░░░░
QFutureWatcher            ░░░░░░░░░░         QHash                    ░░░░░░░░░░
QIODevice                 ░░░░░░░░░░         QIdentityProxyModel      ░░░░░░░░░░
QItemSelection            ░░░░░░░░░░         QItemSelectionRange      ░░░░░░░░░░
QKeyCombination           ░░░░░░░░░░         QLatin1String            ░░░░░░░░░░
QLine                     ░░░░░░░░░░         QList                    ░░░░░░░░░░
QLockFile                 ░░░░░░░░░░         QMap                     ░░░░░░░░░░
QMarginsF                 ░░░░░░░░░░         QMetaClassInfo           ░░░░░░░░░░
QMetaEnum                 ░░░░░░░░░░         QMetaMethod              ░░░░░░░░░░
QMetaObject               ░░░░░░░░░░         QMetaProperty            ░░░░░░░░░░
QMetaType                 ░░░░░░░░░░         QMimeDatabase            ░░░░░░░░░░
QMutex                    ░░░░░░░░░░         QParallelAnimationGroup  ░░░░░░░░░░
QPersistentModelIndex     ░░░░░░░░░░         QPluginLoader            ░░░░░░░░░░
QPointer                  ░░░░░░░░░░         QPropertyAnimation       ░░░░░░░░░░
QQueue                    ░░░░░░░░░░         QReadWriteLock           ░░░░░░░░░░
QResource                 ░░░░░░░░░░         QSaveFile                ░░░░░░░░░░
QSemaphore                ░░░░░░░░░░         QSequentialAnimationGroup░░░░░░░░░░
QSet                      ░░░░░░░░░░         QSharedData              ░░░░░░░░░░
QSharedMemory             ░░░░░░░░░░         QSharedPointer           ░░░░░░░░░░
QSignalBlocker            ░░░░░░░░░░         QSignalMapper            ░░░░░░░░░░
QSizePolicy               ░░░░░░░░░░         QSortFilterProxyModel    ░░░░░░░░░░
QStack                    ░░░░░░░░░░         QStorageInfo             ░░░░░░░░░░
QString                   ░░░░░░░░░░         QStringConverter         ░░░░░░░░░░
QStringDecoder            ░░░░░░░░░░         QStringEncoder           ░░░░░░░░░░
QStringMatcher            ░░░░░░░░░░         QStringView              ░░░░░░░░░░
QSysInfo                  ░░░░░░░░░░         QSystemSemaphore         ░░░░░░░░░░
QTextBoundaryFinder       ░░░░░░░░░░         QTimeLine                ░░░░░░░░░░
QTimeZone                 ░░░░░░░░░░         QTimerEvent              ░░░░░░░░░░
QTranslator               ░░░░░░░░░░         QTransposeProxyModel     ░░░░░░░░░░
QVariantAnimation         ░░░░░░░░░░         QVector                  ░░░░░░░░░░
         QWaitCondition           ░░░░░░░░░░
QWeakPointer              ░░░░░░░░░░         QXmlStreamReader         ░░░░░░░░░░
QXmlStreamWriter          ░░░░░░░░░░         QXmlStreamAttribute      ░░░░░░░░░░
```

## 说明

- 基础设施：`namespace.cj`（Qt 常量/枚举定义）、`conversion.cpp`（C/CJ 类型转换）、`core_callback_map.cj`（回调映射）已提供，不属于某个具体类。
- `QString` 未单独封装，仓颉侧使用 `std.core.String`；`QStringList` 已封装（`string_list.cj`，支持 count/at/isEmpty/clear）。
- `QByteArray`/`QDataStream`/`QTextStream` 提供字节与流式读写；`QJsonValue/QJsonArray/QJsonObject/QJsonDocument` 提供 JSON 序列化/反序列化；`QThread` 提供线程生命周期管理；`QFileSystemWatcher`/`QTemporaryFile`/`QTemporaryDir`/`QDirIterator` 提供文件系统能力。
- 剩余 Qt Core 类多数在 Qt 内部/底层使用，按优先级后续逐步封装。
