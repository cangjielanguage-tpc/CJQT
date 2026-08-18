// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package qqmusic
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*
import std.collection.*

// 验证 RecBox 翻页核心逻辑（独立副本，避免依赖示例可执行包）
func numberText(i: Int64): String {
    if (i < 10) {
        return "00${i}"
    }
    if (i < 100) {
        return "0${i}"
    }
    return "${i}"
}

func recImageName(i: Int64): String {
    let num = i + 1
    if (num == 2) {
        return "003"
    }
    let n = if (num > 2) { num + 1 } else { num }
    return numberText(n)
}

func nextPage(cur: Int64, pageCount: Int64): Int64 {
    var r = cur + 1
    if (r >= pageCount) {
        r = 0
    }
    return r
}

func prevPage(cur: Int64, pageCount: Int64): Int64 {
    var r = cur - 1
    if (r < 0) {
        r = pageCount - 1
    }
    return r
}

main() {
    QApplication.create()

    // 图片名映射：i=0->001, i=1->003(跳002), i=38->040
    if (recImageName(0) != "001") {
        println("FAIL name0: ${recImageName(0)}")
        return 1
    }
    if (recImageName(1) != "003") {
        println("FAIL name1: ${recImageName(1)}")
        return 1
    }
    if (recImageName(38) != "040") {
        println("FAIL name38: ${recImageName(38)}")
        return 1
    }

    // 39张图，每页5张 => 8页
    let pageCount = (39 + 5 - 1) / 5
    if (pageCount != 8) {
        println("FAIL pageCount: ${pageCount}")
        return 1
    }

    // 下翻循环
    if (nextPage(0, pageCount) != 1) {
        println("FAIL next 0->1")
        return 1
    }
    if (nextPage(pageCount - 1, pageCount) != 0) {
        println("FAIL next last->0")
        return 1
    }
    // 上翻循环
    if (prevPage(0, pageCount) != pageCount - 1) {
        println("FAIL prev 0->last")
        return 1
    }
    if (prevPage(2, pageCount) != 1) {
        println("FAIL prev 2->1")
        return 1
    }

    QApplication.delete()
    println("test OK!")
    return 0
}
