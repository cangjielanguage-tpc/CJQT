// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package qqmusic
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*
import std.collection.*

// 验证 setParent 与音量计算逻辑（独立副本避免依赖可执行包）
// volumeBox 全局 y=10，局部 y 有效范围 [25,205]
func calcVolume(globalY: Int64): Int64 {
    var y = globalY - 10
    if (y < 25) {
        y = 25
    }
    if (y > 205) {
        y = 205
    }
    let h = 205 - y
    var ratio = h * 100 / 180
    if (ratio > 100) {
        ratio = 100
    }
    return ratio
}

main() {
    QApplication.create()

    // 音量计算边界
    if (calcVolume(35) != 100) {
        println("FAIL vol top: ${calcVolume(35)}")
        return 1
    }
    if (calcVolume(215) != 0) {
        println("FAIL vol bottom: ${calcVolume(215)}")
        return 1
    }
    if (calcVolume(125) != 50) {
        println("FAIL vol mid: ${calcVolume(125)}")
        return 1
    }
    // 超出范围钳制
    if (calcVolume(0) != 100) {
        println("FAIL clamp top")
        return 1
    }
    if (calcVolume(999) != 0) {
        println("FAIL clamp bottom")
        return 1
    }

    // setParent 可用性：Qt 级联删除子widget，只删 parent 即可
    let parent = QWidget()
    let child = QWidget()
    child.setParent(parent)
    parent.delete()

    QApplication.delete()
    println("test OK!")
    return 0
}
