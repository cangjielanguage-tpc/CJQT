// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package qqmusic
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*
import std.collection.*

// 验证播放历史记录逻辑：播放时标记 isHistory，最近播放页显示
class Song {
    public var name: String = ""
    public var isHistory = false
    public init(name: String) {
        this.name = name
    }
}

// 模拟 playCurrent 中的历史标记
func markHistory(songs: ArrayList<Song>, name: String): Bool {
    var i: Int64 = 0
    while (i < songs.size) {
        let s = songs[i]
        if (s.name == name) {
            let wasHistory = s.isHistory
            s.isHistory = true
            return !wasHistory
        }
        i += 1
    }
    return false
}

func historyCount(songs: ArrayList<Song>): Int64 {
    var n: Int64 = 0
    var i: Int64 = 0
    while (i < songs.size) {
        if (songs[i].isHistory) {
            n += 1
        }
        i += 1
    }
    return n
}

main() {
    QApplication.create()
    let songs = ArrayList<Song>()
    songs.add(Song("歌A"))
    songs.add(Song("歌B"))
    songs.add(Song("歌C"))

    // 初始无历史
    if (historyCount(songs) != 0) {
        println("FAIL initial history")
        return 1
    }
    // 播放歌A -> 标记历史
    markHistory(songs, "歌A")
    if (historyCount(songs) != 1) {
        println("FAIL after play A")
        return 1
    }
    // 播放歌B
    markHistory(songs, "歌B")
    if (historyCount(songs) != 2) {
        println("FAIL after play B")
        return 1
    }
    // 重复播放歌A不重复记录
    markHistory(songs, "歌A")
    if (historyCount(songs) != 2) {
        println("FAIL duplicate A")
        return 1
    }

    QApplication.delete()
    println("test OK!")
    return 0
}
