// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package qqmusic
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*
import std.collection.*

// 验证喜欢状态跨页面同步逻辑（独立副本模拟）
class Song {
    public var isLike = false
    public var name: String = ""
    public init(name: String) {
        this.name = name
    }
}

// 模拟 setLikeByName：更新所有页面共用同一数据源
func setLike(songs: ArrayList<Song>, name: String, liked: Bool): Bool {
    var i: Int64 = 0
    while (i < songs.size) {
        let s = songs[i]
        if (s.name == name) {
            s.isLike = liked
            return s.isLike
        }
        i += 1
    }
    return liked
}

// 页面显示时从数据源读取红心状态
func pageLikeState(songs: ArrayList<Song>, name: String): Bool {
    var i: Int64 = 0
    while (i < songs.size) {
        let s = songs[i]
        if (s.name == name) {
            return s.isLike
        }
        i += 1
    }
    return false
}

main() {
    QApplication.create()

    let songs = ArrayList<Song>()
    songs.add(Song("歌A"))
    songs.add(Song("歌B"))

    // 在喜欢页取消：歌A 从喜欢 -> 取消
    setLike(songs, "歌A", true)
    setLike(songs, "歌A", false)
    // 切换到本地下载页，红心应显示取消状态
    if (pageLikeState(songs, "歌A")) {
        println("FAIL: local page still liked")
        return 1
    }
    // 本地下载页取消：歌B 喜欢 -> 取消
    setLike(songs, "歌B", true)
    setLike(songs, "歌B", false)
    if (pageLikeState(songs, "歌B")) {
        println("FAIL: local page cannot unlike")
        return 1
    }

    QApplication.delete()
    println("test OK!")
    return 0
}
