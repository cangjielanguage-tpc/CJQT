// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package cjqt
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*
import cjqt.multimedia.*

// 验证 QMediaPlayer.thumbnail() 方法可用（无媒体时不崩溃，返回空或路径字符串）
main() {
    QApplication.create()
    let player = QMediaPlayer()
    let t = player.thumbnail()
    player.delete()
    QApplication.delete()
    println("test OK! thumbnail=${t}")
    return 0
}
