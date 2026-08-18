package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
import std.collection.*

// 仿参考项目 CommonPage：音乐列表页（我喜欢 / 本地下载 / 最近播放）
// 参考项目：每页不同标题与背景图（ilikebg/localbg/recentbg），每行显示 歌名/歌手/专辑
public class CommonPage <: QWidget {
    let scrollArea: QScrollArea
    var listContainer: QWidget
    var listLayout: QVBoxLayout
    let titleLabel: QLabel
    let headerImage: QLabel
    let rows = ArrayList<QWidget>()
    let names = ArrayList<String>()
    var pageTitle = ""
    var playAllHandler: () -> Unit = { => () }

    public init() {
        scrollArea = QScrollArea()
        listContainer = QWidget()
        listLayout = QVBoxLayout(parent: listContainer)
        listLayout.setContentsMargins(0, 0, 0, 0)
        listLayout.setSpacing(0)
        titleLabel = QLabel(pageTitle)
        headerImage = QLabel()
        setStyleSheet("QWidget { background-color: #F5F5F5; }")
        let layout = QVBoxLayout(parent: this)
        layout.setContentsMargins(16, 12, 16, 12)
        layout.setSpacing(8)

        titleLabel.setFontSize(18)
        titleLabel.setFontColor(QColor(51, 51, 51))
        layout.addWidget(titleLabel)

        // 表头行：图片 + 歌名/歌手/专辑列 + 播放全部
        let header = QWidget()
        header.setFixedHeight(40)
        let headerLayout = QHBoxLayout(parent: header)
        headerLayout.setContentsMargins(12, 0, 12, 0)
        headerLayout.setSpacing(8)

        let image = headerImage
        image.setFixedSize(120, 36)
        image.setStyleSheet(
            "QLabel { background-image: url(images/ilikebg.png); background-repeat: no-repeat; background-position: center center; }")
        headerLayout.addWidget(image)

        let nameHeader = QLabel("歌名")
        nameHeader.setFontSize(12)
        nameHeader.setFontColor(QColor(120, 120, 120))
        nameHeader.setFixedWidth(300)
        headerLayout.addWidget(nameHeader)

        let singerHeader = QLabel("歌手")
        singerHeader.setFontSize(12)
        singerHeader.setFontColor(QColor(120, 120, 120))
        singerHeader.setFixedWidth(120)
        headerLayout.addWidget(singerHeader)

        let albumHeader = QLabel("专辑")
        albumHeader.setFontSize(12)
        albumHeader.setFontColor(QColor(120, 120, 120))
        headerLayout.addWidget(albumHeader)

        let playAllBtn = QPushButton("▶ 播放全部")
        playAllBtn.setFixedSize(120, 32)
        playAllBtn.setStyleSheet(
            "QPushButton { color: #ffffff; background-color: #31c27c; border: none; border-radius: 16px; font-size: 13px; } QPushButton:hover { background-color: #3dd690; }")
        playAllBtn.clicked.connect() {
            d => playAllHandler()
        }
        headerLayout.addWidget(playAllBtn)

        layout.addWidget(header)

        // 滚动列表容器：widgetResizable=true 撑满视口，布局默认顶部对齐
        scrollArea.setWidget(listContainer)
        scrollArea.setWidgetResizable(true)
        scrollArea.setStyleSheet("QScrollArea { border: none; background-color: #ffffff; }")
        layout.addWidget(scrollArea)
    }

    public func setPageTitle(title: String) {
        pageTitle = title
        titleLabel.setText(title)
    }

    public func setPageImage(imagePath: String) {
        headerImage.setStyleSheet(
            "QLabel { background-image: url(${imagePath}); background-repeat: no-repeat; background-position: center center; }")
    }

    public func setPlayAllHandler(handler: () -> Unit) {
        playAllHandler = handler
    }

    public func addMusic(name: String, singer: String, album: String) {
        let row = QWidget()
        row.setFixedHeight(40)
        row.setStyleSheet("QWidget { background-color: #ffffff; border-bottom: 1px solid #f0f0f0; }")
        let rowLayout = QHBoxLayout(parent: row)
        rowLayout.setContentsMargins(12, 0, 0, 0)
        rowLayout.setSpacing(8)

        // 表头图片占位：与表头的 image(120) + spacing 对齐，保证歌名/歌手/专辑列与表头一致
        let spacer = QWidget()
        spacer.setFixedSize(120, 36)
        spacer.setStyleSheet("QWidget { background: transparent; }")
        rowLayout.addWidget(spacer)

        let nameLabel = QLabel(name)
        nameLabel.setFixedWidth(300)
        nameLabel.setStyleSheet("QLabel { color: #333333; font-size: 14px; background: transparent; }")
        rowLayout.addWidget(nameLabel)

        let singerLabel = QLabel(singer)
        singerLabel.setFixedWidth(120)
        singerLabel.setStyleSheet("QLabel { color: #666666; font-size: 13px; background: transparent; }")
        rowLayout.addWidget(singerLabel)

        let albumLabel = QLabel(album)
        albumLabel.setStyleSheet("QLabel { color: #666666; font-size: 13px; background: transparent; }")
        rowLayout.addWidget(albumLabel)
        rowLayout.addStretch(1)

        listLayout.addWidget(row)
        rows.add(row)
        names.add(name)
    }

    public func clear() {
        // QVBoxLayout 无 removeWidget，重建容器
        scrollArea.setWidget(QWidget())
        listContainer = QWidget()
        listLayout = QVBoxLayout(parent: listContainer)
        listLayout.setContentsMargins(0, 0, 0, 0)
        listLayout.setSpacing(0)
        scrollArea.setWidget(listContainer)
        rows.clear()
        names.clear()
    }

    public func currentRow(): Int64 {
        return 0
    }

    public func setCurrentRow(row: Int64) {
        var i: Int64 = 0
        while (i < rows.size) {
            rows[i].setStyleSheet("QWidget { background-color: #ffffff; border-bottom: 1px solid #f0f0f0; }")
            i += 1
        }
        if (row >= 0 && row < rows.size) {
            rows[row].setStyleSheet("QWidget { background-color: #d5f5e8; border-bottom: 1px solid #f0f0f0; }")
        }
    }

    public func musicNameAt(index: Int64): String {
        if (index >= 0 && index < names.size) {
            return names[index]
        }
        return ""
    }
}
