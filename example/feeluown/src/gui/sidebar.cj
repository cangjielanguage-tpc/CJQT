package gui

from std import math.*

public class ListViewContainer <: QFrame {
    let btnTextHide: String = "△"
    let btnTextShow: String = "▼"
    let toggleBtn: QPushButton
    let label: QLabel
    let view: QWidget

    public init(label: QLabel, view: QWidget, parent!: QWidget = QWidget(0)) {
        super(parent)
        this.label = label
        this.view = view
        toggleBtn = QPushButton()
        toggleBtn.setText(btnTextHide)

        let layout = QVBoxLayout(parent: this)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)

        let hLayout = QHBoxLayout()
        label.setFixedHeight(25)
        hLayout.addWidget(label)
        hLayout.addStretch(0)
        hLayout.addWidget(toggleBtn)
        hLayout.addSpacing(10)
        layout.addLayout(hLayout)
        layout.addWidget(view)
        layout.addStretch(0)
        setSizePolicy(5, 4)

        toggleBtn.clicked.connect(toggleView)
    }

    func toggleView(d: Unit) {
        if (view.isVisible()) {
            hideView()
        } else {
            showView()
        }
    }

    func showView() {
        toggleBtn.setText(btnTextHide)
        view.show()
    }

    func hideView() {
        toggleBtn.setText(btnTextShow)
        view.hide()
    }
}

public class LeftPanel <: QScrollArea {
    let app: GuiApp

    public init(app: GuiApp, parent!: QWidget = QWidget(0)) {
        super(parent: parent)
        this.app = app
        setWidgetResizable(true)
        setFrameShape(QFrameShape.NoFrame)

        let p = ILeftPanel(app, parent: this)
        setWidget(p)
        setMaximumWidth(280)
    }

    public override func sizeHint(): QSize {
        let size = sizeHint()
        let width = min(app.width() / 4, 240)
        return QSize(width, size.height())
    }
}

class ILeftPanel <: QFrame {
    let app: GuiApp

    public init(app: GuiApp, parent!: QWidget = QWidget(0)) {
        super(parent)
        this.app = app

        let layout = QVBoxLayout(parent: this)

        let libraryHeader = QLabel("音乐提供方")
        let collectionsHeader = QLabel("本地收藏")
        collectionsHeader.setToolTip(
            """
        我们可以在本地建立『收藏集』来收藏自己喜欢的音乐资源

        每个收藏集都以一个独立 .fuo 文件的存在，将鼠标悬浮在收藏集上，可以查看文件所在路径。
        新建 fuo 文件，则可以新建收藏集，文件名即是收藏集的名字。

        手动编辑 fuo 文件即可编辑收藏集中的音乐资源，也可以在界面上拖拽来增删歌曲。
"""
        )
        let playlistsHeader = QLabel("歌单列表")
        let myMusicHeader = QLabel("我的音乐")

        let playlists_view = QWidget(this)
        let providers_view = QWidget(this)
        let my_music_view = QWidget(this)
        let collections_view = QWidget(this)

        let providers_con = ListViewContainer(libraryHeader, providers_view)
        let collections_con = ListViewContainer(collectionsHeader, collections_view)
        let playlists_con = ListViewContainer(playlistsHeader, playlists_view)
        let my_music_con = ListViewContainer(myMusicHeader, my_music_view)

        layout.setSpacing(0)
        layout.setContentsMargins(6, 4, 0, 0)

        layout.addWidget(providers_con)
        layout.addWidget(collections_con)
        layout.addWidget(playlists_con)
        layout.addWidget(my_music_con)
        layout.addStretch(0)
    }
}
