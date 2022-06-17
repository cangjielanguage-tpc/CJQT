import QtQuick 2.2
import QtQuick.Controls 1.4

ApplicationWindow {
    id: app
    title: "CJQT QML Example"
    width: 400; height: 300
    color: "lightgray"
    Component.onCompleted: visible = true

    Text {
        text: "Hello CJQT for QML!"
        y: 120
        anchors.horizontalCenter: app.contentItem.horizontalCenter
        font.pointSize: 24; font.bold: true
    }
}