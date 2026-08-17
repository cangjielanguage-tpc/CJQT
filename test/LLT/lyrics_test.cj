// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package qqmusic
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*
import std.collection.*

public class LrcLine {
    public var timeMs: Int64 = 0
    public var text: String = ""
    public init(timeMs: Int64, text: String) {
        this.timeMs = timeMs
        this.text = text
    }
}

public class LrcParser {
    public static func parse(content: String): ArrayList<LrcLine> {
        let result = ArrayList<LrcLine>()
        let lines = content.split("\n", removeEmpty: false)
        for (line in lines) {
            let trimmed = line.replace("\r", "")
            if (trimmed.startsWith("[") && trimmed.contains("]")) {
                let closeIdxOpt = trimmed.indexOf("]")
                match (closeIdxOpt) {
                    case Some(closeIdx) =>
                        if (closeIdx > 0) {
                            let tag = trimmed[1..closeIdx]
                            let text = trimmed[closeIdx + 1..]
                            if (text.size > 0) {
                                result.add(LrcLine(parseTime(tag), text))
                            }
                        }
                    case None =>
                        ()
                }
            }
        }
        return result
    }

    static func parseTime(tag: String): Int64 {
        let parts = tag.split(":", removeEmpty: false)
        if (parts.size < 2) {
            return 0
        }
        let minutes = parseDigits(parts[0])
        let rest = parts[1]
        var seconds: Int64 = 0
        var millis: Int64 = 0
        let secParts = rest.split(".", removeEmpty: false)
        if (secParts.size >= 1) {
            seconds = parseDigits(secParts[0])
        }
        if (secParts.size >= 2) {
            millis = parseDigits(secParts[1])
        }
        return minutes * 60000 + seconds * 1000 + millis
    }

    static func parseDigits(digits: String): Int64 {
        var result: Int64 = 0
        let count = digits.size
        var i: Int64 = 0
        while (i < count) {
            let ch = digits[i]
            if (ch >= 48 && ch <= 57) {
                result = result * 10 + (Int64(ch) - 48)
            }
            i += 1
        }
        return result
    }
}

public class LyricsPage <: QWidget {
    let scroll: QScrollArea
    var container: QWidget
    var contentLayout: QVBoxLayout
    let labels = ArrayList<QLabel>()
    var lrcLines = ArrayList<LrcLine>()
    var currentIndex: Int64 = -1

    public init() {
        container = QWidget()
        contentLayout = QVBoxLayout(parent: container)
        contentLayout.setContentsMargins(0, 10, 0, 10)
        contentLayout.setSpacing(6)

        scroll = QScrollArea()
        scroll.setWidget(container)
        scroll.setWidgetResizable(true)
        scroll.setStyleSheet("QScrollArea { border: none; background-color: #F5F5F5; }")

        let layout = QVBoxLayout(parent: this)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.addWidget(scroll)
    }

    public func setLrc(lines: ArrayList<LrcLine>) {
        lrcLines = lines
        currentIndex = -1
        rebuildContainer()
        var i: Int64 = 0
        while (i < lines.size) {
            let label = QLabel(lines[i].text)
            label.setStyleSheet(defaultStyle())
            contentLayout.addWidget(label)
            labels.add(label)
            i += 1
        }
        contentLayout.addStretch(1)
    }

    public func updateProgress(position: Int64) {
        if (lrcLines.size == 0) {
            return
        }
        var idx = currentIndex
        if (idx < 0) {
            idx = 0
        }
        while (idx + 1 < lrcLines.size && lrcLines[idx + 1].timeMs <= position) {
            idx += 1
        }
        if (idx != currentIndex) {
            if (currentIndex >= 0 && currentIndex < labels.size) {
                labels[currentIndex].setStyleSheet(defaultStyle())
            }
            currentIndex = idx
            if (currentIndex < labels.size) {
                labels[currentIndex].setStyleSheet(currentStyle())
                scroll.ensureWidgetVisible(labels[currentIndex], 0, 60)
            }
        }
    }

    public func getCurrentIndex(): Int64 {
        return currentIndex
    }

    public func lineCount(): Int64 {
        return labels.size
    }

    func rebuildContainer() {
        labels.clear()
        scroll.setWidget(QWidget())
        container = QWidget()
        contentLayout = QVBoxLayout(parent: container)
        contentLayout.setContentsMargins(0, 10, 0, 10)
        contentLayout.setSpacing(6)
        scroll.setWidget(container)
    }

    func defaultStyle(): String {
        return "QLabel { color: #666666; font-size: 16px; padding: 4px 0; background: transparent; }"
    }

    func currentStyle(): String {
        return "QLabel { color: #1ECE9A; font-size: 20px; font-weight: bold; padding: 4px 0; background: transparent; }"
    }
}

func checkParse(): Unit {
    let content = "[0:0.420.00]标题\n[0:18.350.00]第二行\n[1:14.730.00]第三行"
    let lines = LrcParser.parse(content)
    if (lines.size != 3) {
        println("FAIL parse size")
        return
    }
    if (lines[0].timeMs != 420) {
        println("FAIL time0: ${lines[0].timeMs}")
        return
    }
    if (lines[1].timeMs != 18350) {
        println("FAIL time1: ${lines[1].timeMs}")
        return
    }
    if (lines[2].timeMs != 74730) {
        println("FAIL time2: ${lines[2].timeMs}")
        return
    }
    println("parse OK")
}

func makeLines(): ArrayList<LrcLine> {
    let lines = ArrayList<LrcLine>()
    lines.add(LrcLine(0, "第一行"))
    lines.add(LrcLine(1000, "第二行"))
    lines.add(LrcLine(2000, "第三行"))
    lines.add(LrcLine(3000, "第四行"))
    return lines
}

func checkLrcPage(): Unit {
    let page = LyricsPage()
    page.setLrc(makeLines())
    if (page.lineCount() != 4) {
        println("FAIL count: ${page.lineCount()}")
        return
    }
    page.updateProgress(0)
    if (page.getCurrentIndex() != 0) {
        println("FAIL idx0: ${page.getCurrentIndex()}")
        return
    }
    page.updateProgress(1500)
    if (page.getCurrentIndex() != 1) {
        println("FAIL idx1: ${page.getCurrentIndex()}")
        return
    }
    page.updateProgress(2500)
    if (page.getCurrentIndex() != 2) {
        println("FAIL idx2: ${page.getCurrentIndex()}")
        return
    }
    page.updateProgress(9999)
    if (page.getCurrentIndex() != 3) {
        println("FAIL idx3: ${page.getCurrentIndex()}")
        return
    }
    page.setLrc(makeLines())
    if (page.getCurrentIndex() != -1) {
        println("FAIL reset: ${page.getCurrentIndex()}")
        return
    }
    page.delete()
    println("lyrics OK")
}

main() {
    QApplication.create()
    checkParse()
    checkLrcPage()
    QApplication.delete()
    println("test OK!")
    return 0
}
