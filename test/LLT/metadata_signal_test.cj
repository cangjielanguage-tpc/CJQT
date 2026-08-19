// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package qqmusic
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*
import cjqt.multimedia.*
import cjqt.tools.*

// 验证 QMediaPlayer metaDataChanged 信号连接 API 可用（不触发真实播放，
// 播放依赖音频后端/事件循环，LLT 环境无此条件）
class Flag {
    public var called = false
}

main() {
    QApplication.create()
    let player = QMediaPlayer()
    let flag = Flag()
    player.metaDataChanged.connect() {
        => flag.called = true
    }
    player.delete()
    QApplication.delete()
    if (flag.called) {
        println("FAIL: callback should not fire without playback")
        return 1
    }
    println("test OK! connect api available")
    return 0
}
