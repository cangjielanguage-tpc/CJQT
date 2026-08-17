package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*

// 仿参考项目 RecBox：推荐歌曲图片宫格（左右翻页箭头 + 图片卡片）
public class RecBox <: QWidget {
    let cardCount = 5

    public init() {
        setFixedHeight(210)
        setStyleSheet("QWidget { background-color: #F5F5F5; }")

        let layout = QHBoxLayout(parent: this)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(4)

        let upBtn = QPushButton()
        upBtn.setFixedSize(30, 160)
        upBtn.setStyleSheet(
            "QPushButton { border: none; background-image: url(images/up_page.png); background-repeat: no-repeat; background-position: center center; } QPushButton:hover { background-color: #1ECD97; }")
        layout.addWidget(upBtn)

        let content = QWidget()
        content.setStyleSheet("QWidget { background-color: #F5F5F5; }")
        let contentLayout = QHBoxLayout(parent: content)
        contentLayout.setContentsMargins(0, 0, 0, 0)
        contentLayout.setSpacing(12)
        layout.addWidget(content)

        let titles = ["动感地带", "热门榜单", "新歌首发", "经典老歌", "民谣精选"]
        var i = 0
        while (i < cardCount) {
            contentLayout.addWidget(makeCard("images/rec/00${i + 1}.png", titles[i]))
            i += 1
        }
        contentLayout.addStretch(1)

        let downBtn = QPushButton()
        downBtn.setFixedSize(30, 160)
        downBtn.setStyleSheet(
            "QPushButton { border: none; background-image: url(images/down_page.png); background-repeat: no-repeat; background-position: center center; } QPushButton:hover { background-color: #1ECD97; }")
        layout.addWidget(downBtn)
    }

    func makeCard(imagePath: String, title: String): QWidget {
        let card = QWidget()
        card.setFixedWidth(150)
        let cardLayout = QVBoxLayout(parent: card)
        cardLayout.setContentsMargins(0, 0, 0, 0)
        cardLayout.setSpacing(4)
        let image = QLabel()
        image.setFixedSize(150, 150)
        image.setStyleSheet(
            "QLabel { background-image: url(${imagePath}); background-repeat: no-repeat; background-position: center center; border-radius: 6px; }")
        cardLayout.addWidget(image)
        let name = QLabel(title)
        name.setFontSize(12)
        name.setFontColor(QColor(51, 51, 51))
        cardLayout.addWidget(name)
        return card
    }
}
