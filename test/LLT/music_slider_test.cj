// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package qqmusic
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

// 验证 MusicSlider 进度计算逻辑（参考 musicslider.cpp）
// setProgress: currentPos = maxWidth*ratio，钳制 [0, maxWidth]
func calcProgress(maxWidth: Int64, ratio: Float64): Int64 {
    var pos = Int64(Float64(maxWidth) * ratio)
    if (pos < 0) {
        pos = 0
    }
    if (pos > maxWidth) {
        pos = maxWidth
    }
    return pos
}

// 全局x转widget内坐标（参考 setCurrentPosFromGlobal）
func clampPos(x: Int64, maxWidth: Int64): Int64 {
    if (x < 0) {
        return 0
    }
    if (x > maxWidth) {
        return maxWidth
    }
    return x
}

main() {
    QApplication.create()
    let maxWidth = 840

    if (calcProgress(maxWidth, 0.0) != 0) {
        println("FAIL progress 0")
        return 1
    }
    if (calcProgress(maxWidth, 0.5) != 420) {
        println("FAIL progress 0.5: ${calcProgress(maxWidth, 0.5)}")
        return 1
    }
    if (calcProgress(maxWidth, 1.0) != 840) {
        println("FAIL progress 1.0")
        return 1
    }
    // 越界钳制
    if (calcProgress(maxWidth, 1.5) != 840) {
        println("FAIL progress clamp high")
        return 1
    }
    if (calcProgress(maxWidth, -0.5) != 0) {
        println("FAIL progress clamp low")
        return 1
    }
    if (clampPos(-10, maxWidth) != 0) {
        println("FAIL clamp neg")
        return 1
    }
    if (clampPos(9999, maxWidth) != 840) {
        println("FAIL clamp high")
        return 1
    }

    QApplication.delete()
    println("test OK!")
    return 0
}
