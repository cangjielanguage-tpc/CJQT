package cjqt.core

import std.unittest.*

@Test
public func testPointValue() {
    let p = QPoint(3, 5)
    @Assert(p.x == 3)
    @Assert(p.y == 5)
    let q = QPoint(-1, -2)
    @Assert(q.x == -1)
    @Assert(q.y == -2)
}

@Test
public func testPointFValue() {
    let p = QPointF(1.5, 2.5)
    @Assert(p.x == 1.5)
    @Assert(p.y == 2.5)
    @Assert(!p.isNull())
    let origin = QPointF(0.0, 0.0)
    @Assert(origin.isNull())
    @Assert(p.manhattanLength() == 4.0)
    let t = p.transposed()
    @Assert(t.x == 2.5)
    @Assert(t.y == 1.5)
    let ip = p.toPoint()
    @Assert(ip.x == 2)
    @Assert(ip.y == 2)
}

@Test
public func testSizeValue() {
    let s = QSize(100, 200)
    @Assert(s.width == 100)
    @Assert(s.height == 200)
    @Assert(!s.isEmpty())
    @Assert(s.isValid())
    let empty = QSize(0, 0)
    @Assert(empty.isNull())
    @Assert(empty.isEmpty())
    let neg = QSize(-1, 5)
    @Assert(!neg.isValid())
}

@Test
public func testSizeFValue() {
    let s = QSizeF(12.5, 7.5)
    @Assert(s.width == 12.5)
    @Assert(s.height == 7.5)
}

@Test
public func testRectValue() {
    let r = QRect(10, 20, 100, 50)
    @Assert(r.x == 10)
    @Assert(r.y == 20)
    @Assert(r.width == 100)
    @Assert(r.height == 50)
}

@Test
public func testRectFValue() {
    let r = QRectF(1.0, 2.0, 3.0, 4.0)
    @Assert(r.x == 1.0)
    @Assert(r.y == 2.0)
    @Assert(r.width == 3.0)
    @Assert(r.height == 4.0)
    let topLeft = QPointF(0.0, 0.0)
    let bottomRight = QPointF(10.0, 10.0)
    let r2 = QRectF(topLeft, bottomRight)
    @Assert(r2.width == 10.0)
    @Assert(r2.height == 10.0)
}

@Test
public func testLineF() {
    let line = QLineF(0.0, 0.0, 3.0, 4.0)
    line.delete()
    @Assert(true)
}

@Test
public func testUrl() {
    let url = QUrl("https://cangjie-lang.cn")
    @Assert(url.isValid())
    @Assert(url.toString().contains("cangjie-lang.cn"))
    url.delete()
}

@Test
public func testVariantInt() {
    let v = QVariant(42)
    @Assert(v.isValid())
    @Assert(v.toInt() == 42)
    v.delete()
}

@Test
public func testVariantBool() {
    let v = QVariant(true)
    @Assert(v.isValid())
    @Assert(v.toBool())
    v.delete()
}

@Test
public func testVariantString() {
    let v = QVariant("hello cjqt")
    @Assert(v.isValid())
    @Assert(v.toString() == "hello cjqt")
    v.delete()
}

@Test
public func testVariantSetValue() {
    let v = QVariant()
    v.setValue(Int64(99))
    @Assert(v.toInt() == 99)
    v.setValue("world")
    @Assert(v.toString() == "world")
    v.delete()
}

@Test
public func testStringList() {
    let list = QStringList()
    list.append("alpha")
    list.append("beta")
    list.delete()
    @Assert(true)
}

@Test
public func testTimer() {
    let timer = QTimer()
    timer.start()
    timer.stop()
    timer.delete()
    @Assert(true)
}

@Test
public func testModelIndex() {
    let index = QModelIndex()
    index.setIrow(2)
    index.setIcol(3)
    @Assert(index.row() == 2)
    @Assert(index.column() == 3)
    index.delete()
}

@Test
public func testEvent() {
    let event = QEvent(QEventType.None)
    @Assert(event.isAccepted())
    event.ignore()
    @Assert(!event.isAccepted())
    event.accept()
    @Assert(event.isAccepted())
}

@Test
public func testQFile() {
    let path = "/tmp/cjqt_ut_file.txt"
    if (QFile.existsPath(path)) {
        QFile.removePath(path)
    }
    let file = QFile(path)
    @Assert(file.open(QIODeviceOpenMode.WriteOnly))
    let written = file.write("hello cjqt")
    @Assert(written > 0)
    file.flush()
    file.close()
    file.delete()

    @Assert(QFile.existsPath(path))
    let file2 = QFile(path)
    @Assert(file2.open(QIODeviceOpenMode.ReadOnly))
    @Assert(file2.isOpen())
    let content = file2.readAll()
    @Assert(content == "hello cjqt")
    file2.close()
    file2.delete()

    @Assert(QFile.removePath(path))
    @Assert(!QFile.existsPath(path))
}

@Test
public func testQFileInfo() {
    let path = "/tmp/cjqt_ut_info.txt"
    if (QFile.existsPath(path)) {
        QFile.removePath(path)
    }
    let file = QFile(path)
    file.open(QIODeviceOpenMode.WriteOnly)
    file.write("data")
    file.close()
    file.delete()

    let info = QFileInfo(path)
    @Assert(info.exists())
    @Assert(info.isFile())
    @Assert(info.fileName() == "cjqt_ut_info.txt")
    @Assert(info.suffix() == "txt")
    @Assert(info.size() > 0)
    info.delete()
    QFile.removePath(path)
}

@Test
public func testQDir() {
    let dirPath = "/tmp/cjqt_ut_dir"
    let dir = QDir(dirPath)
    if (!dir.exists()) {
        @Assert(dir.mkpath(dirPath))
    }
    @Assert(dir.exists())

    let f1 = QFile("${dirPath}/a.txt")
    f1.open(QIODeviceOpenMode.WriteOnly)
    f1.write("a")
    f1.close()
    f1.delete()
    let f2 = QFile("${dirPath}/b.txt")
    f2.open(QIODeviceOpenMode.WriteOnly)
    f2.write("b")
    f2.close()
    f2.delete()

    @Assert(dir.entryCount() >= 2)
    let list = dir.entryList()
    @Assert(list.count() >= 2)
    @Assert(!list.isEmpty())
    dir.delete()

    let cleanup = QDir(dirPath)
    @Assert(cleanup.removeRecursively())
    cleanup.delete()
    let verify = QDir(dirPath)
    @Assert(!verify.exists())
    verify.delete()
}

@Test
public func testQStringList() {
    let list = QStringList()
    @Assert(list.isEmpty())
    list.append("alpha")
    list.append("beta")
    list.append("gamma")
    @Assert(list.count() == 3)
    @Assert(list.at(0) == "alpha")
    @Assert(list.at(2) == "gamma")
    @Assert(!list.isEmpty())
    list.clear()
    @Assert(list.isEmpty())
    list.delete()
}

@Test
public func testQDate() {
    let date = QDate(2024, 1, 15)
    @Assert(date.year() == 2024)
    @Assert(date.month() == 1)
    @Assert(date.day() == 15)
    @Assert(date.isValid())
    @Assert(date.toString() == "2024-01-15")
    let next = date.addDays(1)
    @Assert(next.day() == 16)
    @Assert(date.daysTo(next) == 1)
    next.delete()
    date.delete()

    let today = QDate.currentDate()
    @Assert(today.year() > 2020)
    today.delete()
}

@Test
public func testQTime() {
    let time = QTime(10, 30, 45)
    @Assert(time.hour() == 10)
    @Assert(time.minute() == 30)
    @Assert(time.second() == 45)
    @Assert(time.isValid())
    @Assert(time.toString() == "10:30:45")
    let later = time.addSecs(15)
    @Assert(later.second() == 0)
    @Assert(later.minute() == 31)
    later.delete()
    time.delete()

    let now = QTime.currentTime()
    @Assert(now.isValid())
    now.delete()
}

@Test
public func testQDateTime() {
    let dt = QDateTime(2024, 1, 15, 10, 30, 45, 0)
    @Assert(dt.isValid())
    @Assert(dt.toString() == "2024-01-15 10:30:45")
    let d = dt.date()
    @Assert(d.year() == 2024)
    d.delete()
    let t = dt.time()
    @Assert(t.hour() == 10)
    t.delete()
    let next = dt.addDays(1)
    @Assert(next.toString() == "2024-01-16 10:30:45")
    next.delete()
    dt.delete()

    let now = QDateTime.currentDateTime()
    @Assert(now.isValid())
    now.delete()
}

@Test
public func testQMargins() {
    let m = QMargins(1, 2, 3, 4)
    @Assert(m.left == 1)
    @Assert(m.top == 2)
    @Assert(m.right == 3)
    @Assert(m.bottom == 4)
    @Assert(m.width() == 4)
    @Assert(m.height() == 6)
    @Assert(!m.isNull())
    let zero = QMargins(0, 0, 0, 0)
    @Assert(zero.isNull())
}

@Test
public func testQElapsedTimer() {
    let timer = QElapsedTimer()
    timer.start()
    @Assert(timer.isValid())
    @Assert(!timer.hasExpired(10))
    let elapsed = timer.restart()
    @Assert(elapsed >= 0)
    timer.delete()
}

@Test
public func testQStandardPaths() {
    let home = QStandardPaths.writableLocation(StandardLocation.HomeLocation)
    @Assert(home.size > 0)
    let temp = QStandardPaths.writableLocation(StandardLocation.TempLocation)
    @Assert(temp.size > 0)
    let locations = QStandardPaths.standardLocations(StandardLocation.TempLocation)
    @Assert(!locations.isEmpty())
    locations.delete()
}

@Test
public func testQRegularExpression() {
    let regex = QRegularExpression("^\\d+$")
    @Assert(regex.isValid())
    let m = regex.matchText("12345")
    @Assert(m.hasMatch())
    m.delete()
    let m2 = regex.matchText("abc")
    @Assert(!m2.hasMatch())
    m2.delete()
    regex.delete()

    let email = QRegularExpression("(\\w+)@(\\w+)\\.com")
    let em = email.matchText("user@example.com")
    @Assert(em.hasMatch())
    @Assert(em.captured(index: 1) == "user")
    @Assert(em.captured(index: 2) == "example")
    @Assert(em.capturedCount() >= 3)
    em.delete()
    email.delete()
}

@Test
public func testQUuid() {
    let uuid = QUuid()
    @Assert(!uuid.isNull())
    let s = uuid.toString()
    @Assert(s.size > 10)
    uuid.delete()

    let parsed = QUuid("00000000-0000-0000-0000-000000000000")
    @Assert(parsed.isNull())
    parsed.delete()
}

@Test
public func testQProcess() {
    let proc = QProcess()
    let args = QStringList()
    let echo = proc.start("/bin/echo", args: args)
    @Assert(echo == ())
    @Assert(proc.waitForFinished(5000))
    @Assert(proc.exitCode() == 0)
    proc.delete()
    args.delete()
}

@Test
public func testQSettings() {
    let settings = QSettings("CJQT", "UnitTest")
    settings.setValue("name", "cjqt")
    settings.sync()
    @Assert(settings.contains("name"))
    @Assert(settings.value("name") == "cjqt")
    settings.remove("name")
    @Assert(!settings.contains("name"))
    settings.sync()
    settings.delete()
}

@Test
public func testQLocale() {
    let locale = QLocale("en_US")
    @Assert(locale.name().size > 0)
    let en = locale.toString(12.5, precision: 2)
    @Assert(en.contains("12.50") || en.contains("12,50"))
    locale.delete()
    let sys = QLocale.system()
    @Assert(sys.name().size > 0)
    sys.delete()
}

@Test
public func testQMimeData() {
    let mime = QMimeData()
    @Assert(!mime.hasText())
    mime.setText("hello")
    @Assert(mime.hasText())
    @Assert(mime.text() == "hello")
    @Assert(mime.formats().contains("text/plain"))
    mime.delete()
}

@Test
public func testQByteArray() {
    let ba = QByteArray()
    @Assert(ba.isEmpty())
    ba.append("hello")
    @Assert(!ba.isEmpty())
    @Assert(ba.size() == 5)
    @Assert(ba.toString() == "hello")
    @Assert(ba.at(0) == 104)
    @Assert(ba.contains("ell"))
    @Assert(ba.indexOf("ll") == 2)
    ba.append(" world")
    @Assert(ba.size() == 11)
    ba.prepend(">>")
    @Assert(ba.toString().startsWith(">>"))
    ba.clear()
    @Assert(ba.isEmpty())
    ba.delete()
}

@Test
public func testQDataStream() {
    let ba = QByteArray()
    let out = QDataStream(ba, QDataStreamMode.WriteOnly)
    out.writeInt(42)
    out.writeString("cjqt")
    out.writeDouble(3.14)
    out.delete()

    let input = QDataStream(ba, QDataStreamMode.ReadOnly)
    @Assert(input.readInt() == 42)
    @Assert(input.readString() == "cjqt")
    @Assert(input.readDouble() == 3.14)
    @Assert(input.atEnd())
    input.delete()
    ba.delete()
}

@Test
public func testQTextStream() {
    let ba = QByteArray()
    let out = QTextStream(ba, QDataStreamMode.WriteOnly)
    out.write("line1\n")
    out.write("line2")
    out.delete()

    let input = QTextStream(ba, QDataStreamMode.ReadOnly)
    @Assert(input.readLine() == "line1")
    @Assert(input.readLine() == "line2")
    @Assert(input.atEnd())
    input.delete()
    ba.delete()
}

@Test
public func testQJsonObject() {
    let obj = QJsonObject()
    @Assert(obj.isEmpty())
    obj.insert("name", QJsonValue("cjqt"))
    obj.insert("version", QJsonValue(1.0))
    obj.insert("active", QJsonValue(true))
    @Assert(obj.size() == 3)
    @Assert(obj.contains("name"))
    let name = obj.value("name")
    @Assert(name.isString())
    @Assert(name.toString() == "cjqt")
    name.delete()
    let active = obj.value("active")
    @Assert(active.isBool())
    @Assert(active.toBool())
    active.delete()
    let keys = obj.keys()
    @Assert(keys.count() == 3)
    keys.delete()
    obj.remove("active")
    @Assert(obj.size() == 2)
    obj.delete()
}

@Test
public func testQJsonArray() {
    let arr = QJsonArray()
    @Assert(arr.isEmpty())
    arr.append(QJsonValue("a"))
    arr.append(QJsonValue(2.5))
    arr.append(QJsonValue(true))
    @Assert(arr.size() == 3)
    let first = arr.at(0)
    @Assert(first.isString())
    @Assert(first.toString() == "a")
    first.delete()
    let second = arr.at(1)
    @Assert(second.isDouble())
    @Assert(second.toDouble() == 2.5)
    second.delete()
    arr.delete()
}

@Test
public func testQJsonDocument() {
    let obj = QJsonObject()
    obj.insert("key", QJsonValue("value"))
    let doc = QJsonDocument(obj)
    @Assert(!doc.isNull())
    @Assert(doc.isObject())
    let json = doc.toJson()
    @Assert(json.contains("key"))
    @Assert(json.contains("value"))
    doc.delete()
    obj.delete()

    let parsed = QJsonDocument.fromJson("{\"a\": 1, \"b\": [1, 2, 3]}")
    @Assert(!parsed.isNull())
    @Assert(parsed.isObject())
    let o = parsed.object()
    @Assert(o.contains("a"))
    let b = o.value("b")
    @Assert(b.isArray())
    let arr = b.toArray()
    @Assert(arr.size() == 3)
    arr.delete()
    b.delete()
    o.delete()
    parsed.delete()
}

@Test
public func testQJsonValueInt() {
    let v = QJsonValue.intValue(42)
    @Assert(v.isDouble())
    @Assert(v.toInt() == 42)
    v.delete()
}

@Test
public func testQThreadBasics() {
    @Assert(QThread.idealThreadCount() >= 1)
    @Assert(QThread.currentThreadId() != 0)
    let thread = QThread()
    @Assert(!thread.isRunning())
    thread.delete()
}

@Test
public func testQFileSystemWatcher() {
    let path = "/tmp/cjqt_ut_watch.txt"
    if (QFile.existsPath(path)) {
        QFile.removePath(path)
    }
    let f = QFile(path)
    f.open(QIODeviceOpenMode.WriteOnly)
    f.write("x")
    f.close()
    f.delete()
    let watcher = QFileSystemWatcher()
    @Assert(watcher.addPath(path))
    let files = watcher.files()
    @Assert(files.count() == 1)
    files.delete()
    @Assert(watcher.removePath(path))
    watcher.delete()
    QFile.removePath(path)
}

@Test
public func testQTemporaryFile() {
    let file = QTemporaryFile()
    @Assert(file.open())
    let name = file.fileName()
    @Assert(name.size > 0)
    file.write("temp data")
    file.delete()
    @Assert(!QFile.existsPath(name))
}

@Test
public func testQTemporaryDir() {
    let dir = QTemporaryDir()
    @Assert(dir.isValid())
    let path = dir.path()
    @Assert(path.size > 0)
    @Assert(dir.autoRemove())
    dir.delete()
    @Assert(!QDir(path).exists())
}

@Test
public func testQUrlQuery() {
    let query = QUrlQuery()
    @Assert(query.isEmpty())
    query.addQueryItem("name", "cjqt")
    query.addQueryItem("page", "1")
    @Assert(!query.isEmpty())
    @Assert(query.hasQueryItem("name"))
    @Assert(query.queryItemValue("name") == "cjqt")
    @Assert(query.query().contains("name=cjqt"))
    query.removeQueryItem("page")
    @Assert(!query.hasQueryItem("page"))
    query.delete()
}

@Test
public func testQRandomGenerator() {
    let gen = QRandomGenerator()
    let v = gen.bounded(100)
    @Assert(v >= 0 && v < 100)
    let g = gen.generate()
    @Assert(g != 0)
    gen.delete()
    let gb = QRandomGenerator.globalBounded(10)
    @Assert(gb >= 0 && gb < 10)
}

@Test
public func testQCryptographicHash() {
    let hash = QCryptographicHash(QHashAlgorithm.Md5)
    hash.addData("hello")
    let result = hash.result()
    @Assert(result.size == 32)
    hash.delete()

    let sha = QCryptographicHash(QHashAlgorithm.Sha256)
    sha.addData("hello")
    let shaResult = sha.result()
    @Assert(shaResult.size == 64)
    sha.delete()
}

@Test
public func testQEventLoopBasics() {
    let loop = QEventLoop()
    @Assert(!loop.isRunning())
    loop.delete()
}

@Test
public func testQDirIterator() {
    let dirPath = "/tmp/cjqt_ut_iter"
    let dir = QDir(dirPath)
    if (!dir.exists()) {
        dir.mkpath(dirPath)
    }
    let f1 = QFile("${dirPath}/one.txt")
    f1.open(QIODeviceOpenMode.WriteOnly)
    f1.close()
    f1.delete()
    let iter = QDirIterator(dirPath)
    var found = false
    while (iter.hasNext()) {
        let name = iter.next()
        if (name.endsWith("one.txt")) {
            found = true
        }
    }
    @Assert(found)
    iter.delete()
    let cleanup = QDir(dirPath)
    cleanup.removeRecursively()
    cleanup.delete()
}

@Test
public func testQSaveFile() {
    let path = "/tmp/cjqt_ut_save.txt"
    if (QFile.existsPath(path)) {
        QFile.removePath(path)
    }
    let save = QSaveFile(path)
    @Assert(save.open())
    save.write("atomic data")
    @Assert(save.commit())
    save.delete()
    @Assert(QFile.existsPath(path))
    let f = QFile(path)
    f.open(QIODeviceOpenMode.ReadOnly)
    @Assert(f.readAll() == "atomic data")
    f.close()
    f.delete()
    QFile.removePath(path)
}

@Test
public func testQProcessEnvironment() {
    let env = QProcessEnvironment.systemEnvironment()
    @Assert(!env.isEmpty())
    @Assert(env.contains("PATH"))
    @Assert(env.value("PATH").size > 0)
    env.delete()
    let custom = QProcessEnvironment()
    custom.insert("MY_KEY", "my_value")
    @Assert(custom.contains("MY_KEY"))
    @Assert(custom.value("MY_KEY") == "my_value")
    custom.remove("MY_KEY")
    @Assert(!custom.contains("MY_KEY"))
    custom.delete()
}

@Test
public func testQDeadlineTimer() {
    let timer = QDeadlineTimer.withTimeout(100)
    @Assert(!timer.isForever())
    @Assert(!timer.hasExpired())
    let remaining = timer.remainingTime()
    @Assert(remaining > 0)
    timer.delete()
    let forever = QDeadlineTimer.forever()
    @Assert(forever.isForever())
    forever.delete()
}

@Test
public func testQCoreApplication() {
    QCoreApplication.setApplicationName("cjqt-test")
    @Assert(QCoreApplication.applicationName() == "cjqt-test")
    QCoreApplication.setApplicationVersion("1.2.3")
    @Assert(QCoreApplication.applicationVersion() == "1.2.3")
    QCoreApplication.processEvents()
}

@Test
public func testQTranslator() {
    let translator = QTranslator()
    @Assert(translator.isEmpty())
    translator.delete()
}

@Test
public func testQSysInfo() {
    @Assert(QSysInfo.kernelType().size > 0)
    @Assert(QSysInfo.productType().size > 0)
    @Assert(QSysInfo.wordSize() == 64)
}

@Test
public func testQLibraryInfo() {
    let version = QLibraryInfo.version()
    @Assert(version.contains("5."))
    let path = QLibraryInfo.location(QLibraryLocation.TranslationsPath)
    @Assert(path.size > 0)
}

@Test
public func testQTimeZone() {
    let tz = QTimeZone("Asia/Shanghai")
    @Assert(tz.isValid())
    let sys = QTimeZone.systemTimeZone()
    @Assert(sys.isValid())
    tz.delete()
    sys.delete()
}

@Test
public func testQSemaphore() {
    let sem = QSemaphore.withCount(2)
    @Assert(sem.available() == 2)
    sem.acquire()
    @Assert(sem.available() == 1)
    @Assert(sem.tryAcquire())
    @Assert(!sem.tryAcquire())
    sem.release(n: 2)
    @Assert(sem.available() == 2)
    sem.delete()
}

@Test
public func testQMutex() {
    let mutex = QMutex()
    @Assert(mutex.tryLock())
    @Assert(!mutex.tryLock())
    mutex.unlock()
    @Assert(mutex.tryLock())
    mutex.unlock()
    mutex.delete()
}

@Test
public func testQPersistentModelIndex() {
    let index = QPersistentModelIndex()
    @Assert(!index.isValid())
    index.delete()
}

@Test
public func testQSortFilterProxyModel() {
    let proxy = QSortFilterProxyModel()
    proxy.setFilterKeyColumn(0)
    @Assert(proxy.filterKeyColumn() == 0)
    proxy.setDynamicSortFilter(true)
    proxy.setSortRole(0)
    @Assert(proxy.sortRole() == 0)
    proxy.sort(0, QSortOrder.AscendingOrder)
    proxy.delete()
}
