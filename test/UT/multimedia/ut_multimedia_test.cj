package cjqt.multimedia

import cjqt.widgets.*
import std.unittest.*

@Test
public func testQMediaContent() {
    let content = QMediaContent("file:///tmp/test.mp3")
    @Assert(!content.isNull())
    @Assert(content.canonicalUrl().contains("test.mp3"))
    content.delete()
}

@Test
public func testQMediaPlayerBasics() {
    QApplication.create()
    let player = QMediaPlayer()
    @Assert(player.volume() >= 0)
    player.setVolume(50)
    @Assert(player.volume() == 50)
    player.setMuted(true)
    @Assert(player.isMuted())
    player.setMuted(false)
    @Assert(player.state().value() == QMediaPlayerState.StoppedState.value())
    player.stop()
    player.delete()
}

@Test
public func testQMediaPlaylist() {
    QApplication.create()
    let playlist = QMediaPlaylist()
    @Assert(playlist.addMedia("file:///tmp/a.mp3"))
    @Assert(playlist.addMedia("file:///tmp/b.mp3"))
    @Assert(playlist.mediaCount() == 2)
    playlist.setCurrentIndex(0)
    @Assert(playlist.currentIndex() == 0)
    playlist.next()
    @Assert(playlist.currentIndex() == 1)
    playlist.setPlaybackMode(QMediaPlaybackMode.Loop)
    @Assert(playlist.playbackMode().value() == QMediaPlaybackMode.Loop.value())
    playlist.clear()
    @Assert(playlist.mediaCount() == 0)
    playlist.delete()
}
