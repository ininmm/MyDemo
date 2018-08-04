import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Scroll")

    ScrollView {
        anchors.fill: parent

        ListView {
            width: parent.width
            model: 20
            delegate: ItemDelegate {
                text: "Item " + (index + 1)
                width: parent.width
            }
        }

        Text {
            id: text1
            x: 200
            y: 100
            text: qsTr("Hello World!")
            font.pixelSize: 20
        }
    }
}
