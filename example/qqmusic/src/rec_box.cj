package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
import std.collection.*

// 仿参考项目 RecBox：推荐歌曲图片宫格（左右翻页箭头 + 图片卡片）
// 参考项目：40张图，每页col张，currentIndex循环翻页，点击重建一组
// 悬停放大：定时器轮询underMouse，平滑改变图片尺寸
public class RecBox <: QWidget {
    static let instances = ArrayList<RecBox>()
    let cardCount = 5
    let images = ArrayList<String>()
    let stack: QStackedWidget
    let imageLabels = ArrayList<QLabel>()
    var pageCount: Int64 = 0
    var currentPage: Int64 = 0

    public init() {
        stack = QStackedWidget()
        stack.setFixedHeight(200)
        setFixedHeight(210)
        setStyleSheet("QWidget { background-color: #F5F5F5; }")
        instances.add(this)

        var i: Int64 = 0
        while (i < 39) {
            images.add(recImageName(i))
            i += 1
        }

        let layout = QHBoxLayout(parent: this)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(4)

        let upBtn = QPushButton()
        upBtn.setFixedSize(30, 160)
        upBtn.setStyleSheet(
            "QPushButton { border: none; background-image: url(images/up_page.png); background-repeat: no-repeat; background-position: center center; } QPushButton:hover { background-color: #1ECD97; }")
        layout.addWidget(upBtn)

        layout.addWidget(stack)

        let downBtn = QPushButton()
        downBtn.setFixedSize(30, 160)
        downBtn.setStyleSheet(
            "QPushButton { border: none; background-image: url(images/down_page.png); background-repeat: no-repeat; background-position: center center; } QPushButton:hover { background-color: #1ECD97; }")
        layout.addWidget(downBtn)

        buildPages()

        // 上翻：到第一页后循环到最后一页
        upBtn.clicked.connect() {
            d => prevPage()
        }
        // 下翻：到最后一页后循环到第一页
        downBtn.clicked.connect() {
            d => nextPage()
        }
    }

    func buildPages() {
        pageCount = (images.size + cardCount - 1) / cardCount
        var p: Int64 = 0
        while (p < pageCount) {
            let page = QWidget()
            page.setStyleSheet("QWidget { background-color: #F5F5F5; }")
            let pageLayout = QHBoxLayout(parent: page)
            pageLayout.setContentsMargins(0, 0, 0, 0)
            pageLayout.setSpacing(20)
            var i: Int64 = 0
            while (i < cardCount) {
                let idx = p * cardCount + i
                if (idx < images.size) {
                    pageLayout.addWidget(makeCard("images/rec/${images[idx]}.png", "推荐-${images[idx]}"))
                }
                i += 1
            }
            pageLayout.addStretch(1)
            stack.addWidget(page)
            p += 1
        }
    }

    func prevPage() {
        currentPage -= 1
        if (currentPage < 0) {
            currentPage = pageCount - 1
        }
        stack.setCurrentIndex(currentPage)
    }

    func nextPage() {
        currentPage += 1
        if (currentPage >= pageCount) {
            currentPage = 0
        }
        stack.setCurrentIndex(currentPage)
    }

    // 参考项目图片列表：001,003,004,...040（缺002），39张
    static func recImageName(i: Int64): String {
        let num = i + 1
        if (num == 2) {
            return "003"
        }
        let n = if (num > 2) { num + 1 } else { num }
        return numberText(n)
    }

    static func numberText(i: Int64): String {
        if (i < 10) {
            return "00${i}"
        }
        if (i < 100) {
            return "0${i}"
        }
        return "${i}"
    }

    func makeCard(imagePath: String, title: String): QWidget {
        let card = QWidget()
        card.setFixedWidth(150)
        let cardLayout = QVBoxLayout(parent: card)
        cardLayout.setContentsMargins(0, 0, 0, 0)
        cardLayout.setSpacing(4)

        // 图片固定容器：图片用setGeometry手动定位居中，放大不推挤标题
        let imageBox = QWidget()
        imageBox.setFixedSize(150, 150)
        cardLayout.addWidget(imageBox)

        let image = QLabel(imageBox)
        image.setFixedSize(150, 150)
        image.move(0, 0)
        image.setStyleSheet(
            "QLabel { background-image: url(${imagePath}); background-repeat: no-repeat; background-position: center center; background-clip: content; border-radius: 10px; padding: 8px; }")
        image.setMouseTracking(true)
        imageLabels.add(image)

        let name = QLabel(title)
        name.setFontSize(12)
        name.setFontColor(QColor(51, 51, 51))
        name.setStyleSheet(
            "QLabel { qproperty-alignment: 'AlignCenter'; background: transparent; }")
        name.setFixedHeight(20)
        cardLayout.addWidget(name)
        return card
    }

    // 由全局定时器驱动：遍历所有 RecBox 检查悬停
    public static func tickAll() {
        var i: Int64 = 0
        while (i < instances.size) {
            instances[i].tick()
            i += 1
        }
    }

    // 检查鼠标悬停，平滑放大/缩小图片（步长4，动画约400ms快速完成，避免卡顿）
    // 图片在固定容器内setGeometry居中扩展，不推挤下方标题
    public func tick() {
        var i: Int64 = 0
        while (i < imageLabels.size) {
            let label = imageLabels[i]
            let cur = Int64(label.width())
            let target = if (label.underMouse()) { 160 } else { 150 }
            if (cur != target) {
                var next = cur
                if (target > cur) {
                    next = cur + 4
                    if (next > target) {
                        next = target
                    }
                } else {
                    next = cur - 4
                    if (next < target) {
                        next = target
                    }
                }
                label.setFixedSize(next, next)
                let offset = (next - 150) / 2
                label.move(Int32(-offset), Int32(-offset))
            }
            i += 1
        }
    }
}
