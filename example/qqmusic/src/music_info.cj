package qqmusic

import cjqt.core.*
import std.collection.*

public class MusicInfo {
    public var name: String = ""
    public var filePath: String = ""
    public var singer: String = "未知歌手"
    public var album: String = "未知专辑"
    public var isLike: Bool = false
    public var isHistory: Bool = false

    public init() {}

    public init(name: String, filePath: String) {
        this.name = name
        this.filePath = filePath
    }

    public init(name: String, filePath: String, singer: String, album: String) {
        this.name = name
        this.filePath = filePath
        this.singer = singer
        this.album = album
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
                let title = stripExt(fileName)
                musicList.add(makeMusicInfo(title, "${absDir}/${fileName}"))
            }
            i += 1
        }
    }

    // 解析 "歌名 - 歌手.mp3" 格式；否则歌名=文件名
    func makeMusicInfo(title: String, filePath: String): MusicInfo {
        let dash = title.indexOf(" - ")
        match (dash) {
            case Some(d) =>
                let song = title[0..d]
                let singer = title[d + 3..]
                if (song.size > 0 && singer.size > 0) {
                    return MusicInfo(song, filePath, singer, "未知专辑")
                }
            case None =>
                ()
        }
        return MusicInfo(title, filePath)
    }

    func stripExt(fileName: String): String {
        let dotOpt = fileName.lastIndexOf(".")
        match (dotOpt) {
            case Some(dot) =>
                return fileName[0..dot]
            case None =>
                return fileName
        }
    }

    public func size(): Int64 {
        return musicList.size
    }

    public func at(index: Int64): MusicInfo {
        return musicList[Int64(index)]
    }
}
