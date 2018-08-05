import QtQuick 2.0

Rectangle {
    color: "#127CC1"
    Text {
        id: text1
        width: 200
        height: 100
        color: "#ffffff"
        text: qsTr("Hello World!")
        font.pixelSize: 20
        anchors.fill: parent
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
