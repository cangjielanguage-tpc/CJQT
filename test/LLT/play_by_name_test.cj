// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package qqmusic
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*
import std.collection.*

// 验证 playByName 逻辑：播放列表为空时构建后播放指定曲目（非第一首）
class PlaySim {
    public var mediaCount = 0
    public var currentIndex: Int64 = -1
    public var playedIndex: Int64 = -1

    public func build() {
        if (mediaCount > 0) {
            return
        }
        mediaCount = 5
    }

    public func playByName(name: String, songs: ArrayList<String>): Unit {
        var i: Int64 = 0
        while (i < songs.size) {
            if (songs[i] == name) {
                if (mediaCount == 0) {
                    build()
                }
                currentIndex = i
                playedIndex = i
                return
            }
            i += 1
        }
    }
}

main() {
    QApplication.create()
    let songs = ArrayList<String>()
    songs.add("歌A")
    songs.add("歌B")
    songs.add("歌C")

    let sim = PlaySim()
    // 第一次点击播放 "歌C"（playlist 为空）
    sim.playByName("歌C", songs)
    if (sim.playedIndex != 2) {
        println("FAIL first play C, played=${sim.playedIndex}")
        return 1
    }
    if (sim.currentIndex != 2) {
        println("FAIL currentIndex: ${sim.currentIndex}")
        return 1
    }
    // 第二次点击播放 "歌B"
    sim.playByName("歌B", songs)
    if (sim.playedIndex != 1) {
        println("FAIL second play B, played=${sim.playedIndex}")
        return 1
    }

    QApplication.delete()
    println("test OK!")
    return 0
}
