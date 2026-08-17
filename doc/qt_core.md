# QCore 封装进度

> 适配版本：Cangjie 1.0.5 / Qt 5.14.2
>
> 统计说明：`▓` 表示已完成（满格 10 格为 100%），`░` 表示尚未移植。
> 每类均包含 native C 绑定（`native/src/core/`）、仓颉封装（`src/core/`）与单元测试。

## 进度总览

| 分类 | 数量 |
| :--- | :--- |
| 已完成 | 80 |
| 未移植 | 40+（多为内部/低频类） |

## 已完成

```
QCore:

QAbstractAnimation        ▓▓▓▓▓▓▓▓▓▓         QAbstractItemModel        ▓▓▓▓▓▓▓▓▓▓
QAbstractListModel        ▓▓▓▓▓▓▓▓▓▓         QAbstractTableModel       ▓▓▓▓▓▓▓▓▓▓
QAnimationGroup           ▓▓▓▓▓▓▓▓▓▓         QBuffer                   ▓▓▓▓▓▓▓▓▓▓
QByteArray                ▓▓▓▓▓▓▓▓▓▓         QCommandLineParser        ▓▓▓▓▓▓▓▓▓▓
QCoreApplication          ▓▓▓▓▓▓▓▓▓▓         QCryptographicHash        ▓▓▓▓▓▓▓▓▓▓
QDataStream               ▓▓▓▓▓▓▓▓▓▓         QDate                     ▓▓▓▓▓▓▓▓▓▓
QDateTime                 ▓▓▓▓▓▓▓▓▓▓         QDeadlineTimer            ▓▓▓▓▓▓▓▓▓▓
QDir                      ▓▓▓▓▓▓▓▓▓▓         QDirIterator              ▓▓▓▓▓▓▓▓▓▓
QEasingCurve              ▓▓▓▓▓▓▓▓▓▓         QElapsedTimer             ▓▓▓▓▓▓▓▓▓▓
QEvent                    ▓▓▓▓▓▓▓▓▓▓         QEventLoop                ▓▓▓▓▓▓▓▓▓▓
QFile                     ▓▓▓▓▓▓▓▓▓▓         QFileInfo                 ▓▓▓▓▓▓▓▓▓▓
QFileSystemWatcher        ▓▓▓▓▓▓▓▓▓▓         QIODevice                 ▓▓▓▓▓▓▓▓▓▓
QIdentityProxyModel       ▓▓▓▓▓▓▓▓▓▓         QItemSelection            ▓▓▓▓▓▓▓▓▓▓
QItemSelectionModel       ▓▓▓▓▓▓▓▓▓▓         QJsonArray                ▓▓▓▓▓▓▓▓▓▓
QJsonDocument             ▓▓▓▓▓▓▓▓▓▓         QJsonObject               ▓▓▓▓▓▓▓▓▓▓
QJsonValue                ▓▓▓▓▓▓▓▓▓▓         QLibrary                  ▓▓▓▓▓▓▓▓▓▓
QLibraryInfo              ▓▓▓▓▓▓▓▓▓▓         QLineF                    ▓▓▓▓▓▓▓▓▓▓
QLocale                   ▓▓▓▓▓▓▓▓▓▓         QLockFile                 ▓▓▓▓▓▓▓▓▓▓
QMimeData                 ▓▓▓▓▓▓▓▓▓▓         QMimeDatabase             ▓▓▓▓▓▓▓▓▓▓
QMimeType                 ▓▓▓▓▓▓▓▓▓▓         QModelIndex               ▓▓▓▓▓▓▓▓▓▓
QMutex                    ▓▓▓▓▓▓▓▓▓▓         QObject                   ▓▓▓▓▓▓▓▓▓▓
QParallelAnimationGroup   ▓▓▓▓▓▓▓▓▓▓         QPauseAnimation           ▓▓▓▓▓▓▓▓▓▓
QPersistentModelIndex     ▓▓▓▓▓▓▓▓▓▓         QPluginLoader             ▓▓▓▓▓▓▓▓▓▓
QProcess                  ▓▓▓▓▓▓▓▓▓▓         QProcessEnvironment       ▓▓▓▓▓▓▓▓▓▓
QPropertyAnimation        ▓▓▓▓▓▓▓▓▓▓         QRandomGenerator          ▓▓▓▓▓▓▓▓▓▓
QRegularExpression        ▓▓▓▓▓▓▓▓▓▓         QRegularExpressionMatch   ▓▓▓▓▓▓▓▓▓▓
QSaveFile                 ▓▓▓▓▓▓▓▓▓▓         QSemaphore                ▓▓▓▓▓▓▓▓▓▓
QSequentialAnimationGroup ▓▓▓▓▓▓▓▓▓▓         QSettings                 ▓▓▓▓▓▓▓▓▓▓
QSharedMemory             ▓▓▓▓▓▓▓▓▓▓         QSignalMapper             ▓▓▓▓▓▓▓▓▓▓
QSortFilterProxyModel     ▓▓▓▓▓▓▓▓▓▓         QStandardPaths            ▓▓▓▓▓▓▓▓▓▓
QStringList               ▓▓▓▓▓▓▓▓▓▓         QStringListModel          ▓▓▓▓▓▓▓▓▓▓
QSysInfo                  ▓▓▓▓▓▓▓▓▓▓         QTemporaryDir             ▓▓▓▓▓▓▓▓▓▓
QTemporaryFile            ▓▓▓▓▓▓▓▓▓▓         QTextStream               ▓▓▓▓▓▓▓▓▓▓
QThread                   ▓▓▓▓▓▓▓▓▓▓         QTime                     ▓▓▓▓▓▓▓▓▓▓
QTimeLine                 ▓▓▓▓▓▓▓▓▓▓         QTimeZone                 ▓▓▓▓▓▓▓▓▓▓
QTimer                    ▓▓▓▓▓▓▓▓▓▓         QTranslator               ▓▓▓▓▓▓▓▓▓▓
QUrl                      ▓▓▓▓▓▓▓▓▓▓         QUrlQuery                 ▓▓▓▓▓▓▓▓▓▓
QUuid                     ▓▓▓▓▓▓▓▓▓▓         QVariant                  ▓▓▓▓▓▓▓▓▓▓
QVariantAnimation         ▓▓▓▓▓▓▓▓▓▓         QVersionNumber            ▓▓▓▓▓▓▓▓▓▓
QXmlStreamReader          ▓▓▓▓▓▓▓▓▓▓         QXmlStreamWriter          ▓▓▓▓▓▓▓▓▓▓
```

## 未移植

以下 Qt Core 类尚未移植（多为内部实现，或与仓颉标准库能力重叠）：

```
QAbstractEventDispatcher ░░░░░░░░░░         QAbstractNativeEventFilter░░░░░░░░░░
QAbstractProxyModel      ░░░░░░░░░░         QBasicTimer               ░░░░░░░░░░
QBitArray                ░░░░░░░░░░         QCache                    ░░░░░░░░░░
QChar                    ░░░░░░░░░░         QChildEvent               ░░░░░░░░░░
QCollator                ░░░░░░░░░░         QCommandLineOption        ░░░░░░░░░░
QContiguousCache         ░░░░░░░░░░         QFileDevice               ░░░░░░░░░░
QFuture                  ░░░░░░░░░░         QFutureWatcher            ░░░░░░░░░░
QHash                    ░░░░░░░░░░         QList                    ░░░░░░░░░░
QMap                     ░░░░░░░░░░         QMarginsF                ░░░░░░░░░░
QMetaClassInfo           ░░░░░░░░░░         QMetaEnum                ░░░░░░░░░░
QMetaMethod              ░░░░░░░░░░         QMetaObject              ░░░░░░░░░░
QMetaProperty            ░░░░░░░░░░         QMetaType                ░░░░░░░░░░
QMutexLocker             ░░░░░░░░░░         QPointer                 ░░░░░░░░░░
QQueue                   ░░░░░░░░░░         QReadWriteLock           ░░░░░░░░░░
QResource                ░░░░░░░░░░         QScopedPointer           ░░░░░░░░░░
QSet                     ░░░░░░░░░░         QSharedDataPointer       ░░░░░░░░░░
QSharedPointer           ░░░░░░░░░░         QStack                   ░░░░░░░░░░
QString                  ░░░░░░░░░░         QStringConverter         ░░░░░░░░░░
QSystemSemaphore         ░░░░░░░░░░         QTextBoundaryFinder      ░░░░░░░░░░
QTimerEvent              ░░░░░░░░░░         QVector                  ░░░░░░░░░░
QWaitCondition           ░░░░░░░░░░         QWeakPointer             ░░░░░░░░░░
```

## 说明

- 基础设施：`namespace.cj`（Qt 常量/枚举）、`conversion.cpp`（C/CJ 类型转换）、`core_callback_map.cj`（模型回调映射）、`native_string.h`（C 字符串转换）均已提供。
- `QString` 未单独封装，仓颉侧使用 `std.core.String`；`QStringList` 已封装（含 count/at/isEmpty/clear）。
- `QAbstractTableModel`/`QAbstractListModel` 通过回调机制支持仓颉侧子类化实现自定义模型；`QSortFilterProxyModel`/`QIdentityProxyModel` 提供模型代理能力。
- `QHash`/`QList`/`QMap`/`QVector`/`QSet` 等容器类与仓颉 `std.collection` 能力重叠，建议直接用仓颉标准库；`QSharedPointer`/`QPointer` 由仓颉 GC 覆盖。
- JSON（QJson*）、XML（QXmlStream*）、文件系统、进程、线程、动画、序列化等常用能力均已移植，可直接用于仓颉 GUI 应用。
