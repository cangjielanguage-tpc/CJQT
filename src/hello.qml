import QtQuick 2.2
import QtQuick.Controls 1.4

ApplicationWindow {
    id: app
    title: "CJQT QRC Example"
    width: 600; height: 400
    color: "lightgray"
    Component.onCompleted: visible = true

    Text {
        text: "Hello CJQT!\nbinding by cangjie"
        y: 30
        anchors.horizontalCenter: app.contentItem.horizontalCenter
        font.pointSize: 24; font.bold: true
    }
}