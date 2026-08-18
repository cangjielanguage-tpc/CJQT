package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
import std.collection.*

// 仿参考项目 CommonPage：音乐列表页（完全按 commonpage.ui 布局）
// PageTittle + musicPlayBox(图片150+播放全部120) + listLabelBox(歌名/歌手/专辑) + 列表
// 列表行仿 ListItemBox：likeBtn + 歌名 + 歌手 + 专辑，固定列宽对齐
public class CommonPage <: QWidget {
    let titleLabel: QLabel
    let headerImage: QLabel
    let scrollArea: QScrollArea
    var listContainer: QWidget
    var listLayout: QVBoxLayout
    let rows = ArrayList<QWidget>()
    let names = ArrayList<String>()
    var pageTitle = ""
    var playAllHandler: () -> Unit = { => () }

    public init() {
        titleLabel = QLabel(pageTitle)
        headerImage = QLabel()
        scrollArea = QScrollArea()
        listContainer = QWidget()
        listLayout = QVBoxLayout(parent: listContainer)
        listLayout.setContentsMargins(0, 0, 0, 0)
        listLayout.setSpacing(0)
        setStyleSheet("QWidget { background-color: #F5F5F5; }")

        let layout = QVBoxLayout(parent: this)
        layout.setContentsMargins(3, 0, 3, 0)
        layout.setSpacing(0)

        // PageTittle：30px 高
        titleLabel.setFixedHeight(30)
        titleLabel.setFontSize(18)
        titleLabel.setFontColor(QColor(51, 51, 51))
        layout.addWidget(titleLabel)

        // musicPlayBox：150px 高，水平布局
        let playBox = QWidget()
        playBox.setFixedHeight(150)
        let playBoxLayout = QHBoxLayout(parent: playBox)
        playBoxLayout.setContentsMargins(0, 0, 0, 0)
        playBoxLayout.setSpacing(0)

        // musicImageLabel：150px 宽封面图
        headerImage.setFixedWidth(150)
        headerImage.setStyleSheet(
            "QLabel { background-image: url(images/ilikebg.png); background-repeat: no-repeat; background-position: center center; }")
        playBoxLayout.addWidget(headerImage)

        // playAll：120px 宽，垂直布局(spacer + 播放全部按钮)
        let playAllBox = QWidget()
        playAllBox.setFixedWidth(120)
        let playAllLayout = QVBoxLayout(parent: playAllBox)
        playAllLayout.setContentsMargins(0, 0, 0, 0)
        playAllLayout.setSpacing(0)
        playAllLayout.addStretch(1)
        let playAllBtn = QPushButton("播放全部")
        playAllBtn.setFixedSize(100, 30)
        playAllBtn.setStyleSheet(
            "QPushButton { background-color: #E3E3E3; border-radius: 10px; color: #333333; font-size: 13px; border: none; } QPushButton:hover { background-color: #1ECD97; color: #ffffff; }")
        playAllBtn.clicked.connect() {
            d => playAllHandler()
        }
        playAllLayout.addWidget(playAllBtn)
        playAllLayout.addStretch(1)
        playBoxLayout.addWidget(playAllBox)

        playBoxLayout.addStretch(1)
        layout.addWidget(playBox)

        // listLabelBox：40px 高列头 = 歌名(380) + 歌手(130) + 专辑
        let labelBox = QWidget()
        labelBox.setFixedHeight(40)
        let labelLayout = QHBoxLayout(parent: labelBox)
        labelLayout.setContentsMargins(0, 0, 0, 0)
        labelLayout.setSpacing(0)

        let nameHeader = QLabel("歌曲名称")
        nameHeader.setFontSize(12)
        nameHeader.setFontColor(QColor(120, 120, 120))
        nameHeader.setFixedWidth(380)
        labelLayout.addWidget(nameHeader)

        let singerHeader = QLabel("歌手名称")
        singerHeader.setFontSize(12)
        singerHeader.setFontColor(QColor(120, 120, 120))
        singerHeader.setFixedWidth(130)
        labelLayout.addWidget(singerHeader)

        let albumHeader = QLabel("专辑名称")
        albumHeader.setFontSize(12)
        albumHeader.setFontColor(QColor(120, 120, 120))
        labelLayout.addWidget(albumHeader)

        layout.addWidget(labelBox)

        // 列表滚动容器
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

    // 仿参考项目 ListItemBox：likeBtn + 歌名 + 歌手 + 专辑（固定列宽对齐）
    public func addMusic(name: String, singer: String, album: String) {
        let row = QWidget()
        row.setFixedHeight(45)
        row.setStyleSheet("QWidget { background-color: #ffffff; border-bottom: 1px solid #F0F0F0; }")
        let rowLayout = QHBoxLayout(parent: row)
        rowLayout.setContentsMargins(0, 0, 0, 0)
        rowLayout.setSpacing(0)

        // 歌名区：380px 宽（like 图标 + 歌名）
        let nameLabel = QLabel(name)
        nameLabel.setFixedWidth(380)
        nameLabel.setStyleSheet("QLabel { color: #333333; font-size: 14px; padding-left: 12px; background: transparent; }")
        rowLayout.addWidget(nameLabel)

        // 歌手区：130px 宽
        let singerLabel = QLabel(singer)
        singerLabel.setFixedWidth(130)
        singerLabel.setStyleSheet("QLabel { color: #666666; font-size: 13px; background: transparent; }")
        rowLayout.addWidget(singerLabel)

        // 专辑区
        let albumLabel = QLabel(album)
        albumLabel.setStyleSheet("QLabel { color: #666666; font-size: 13px; background: transparent; }")
        rowLayout.addWidget(albumLabel)
        rowLayout.addStretch(1)

        listLayout.addWidget(row)
        rows.add(row)
        names.add(name)
    }

    public func clear() {
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
            rows[i].setStyleSheet("QWidget { background-color: #ffffff; border-bottom: 1px solid #F0F0F0; }")
            i += 1
        }
        if (row >= 0 && row < rows.size) {
            rows[row].setStyleSheet("QWidget { background-color: #EFEFEF; border-bottom: 1px solid #F0F0F0; }")
        }
    }

    public func musicNameAt(index: Int64): String {
        if (index >= 0 && index < names.size) {
            return names[index]
        }
        return ""
    }
}
