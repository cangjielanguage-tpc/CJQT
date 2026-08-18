// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package qqmusic
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

// 验证喜欢状态切换逻辑（独立副本，模拟 setLikeByName/toggleLike 语义）
class MusicLike {
    public var isLike = false
}

func setLikeByName(m: MusicLike, liked: Bool): Bool {
    m.isLike = liked
    return m.isLike
}

func toggleLike(m: MusicLike): Bool {
    m.isLike = !m.isLike
    return m.isLike
}

main() {
    QApplication.create()

    let m = MusicLike()
    // 设置喜欢
    if (!setLikeByName(m, true)) {
        println("FAIL setLike true")
        return 1
    }
    // 切换取消
    if (toggleLike(m) || m.isLike) {
        println("FAIL toggle off")
        return 1
    }
    // 再切换恢复
    if (!toggleLike(m) || !m.isLike) {
        println("FAIL toggle on")
        return 1
    }

    QApplication.delete()
    println("test OK!")
    return 0
}
