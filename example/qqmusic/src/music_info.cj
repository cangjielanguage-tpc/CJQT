package qqmusic

import cjqt.core.*
import std.collection.*

public class MusicInfo {
    public var name: String = ""
    public var filePath: String = ""

    public init() {}

    public init(name: String, filePath: String) {
        this.name = name
        this.filePath = filePath
    }
}

public class MusicLibrary {
    public let musicList = ArrayList<MusicInfo>()

    public func scanDirectory(dir: String) {
        musicList.clear()
        let directory = QDir(dir)
        if (!directory.exists()) {
            return
        }
        let entries = directory.entryList()
        let count = entries.count()
        let absDir = directory.absolutePath()
        var i = 0
        while (i < count) {
            let fileName = entries.at(i)
            if (fileName.endsWith(".mp3") || fileName.endsWith(".wav") || fileName.endsWith(".flac")) {
                musicList.add(MusicInfo(fileName, "${absDir}/${fileName}"))
            }
            i += 1
        }
    }

    public func size(): Int64 {
        return musicList.size
    }

    public func at(index: Int64): MusicInfo {
        return musicList[Int64(index)]
    }
}
