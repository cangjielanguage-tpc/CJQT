package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
import std.collection.*

// 歌词页：铺满窗口的多行歌词，随播放进度自动滚动，当前行绿色高亮
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

    // 根据播放进度更新高亮行并滚动到可见
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
