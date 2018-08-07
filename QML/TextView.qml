import QtQuick 2.0

Rectangle {
    color: "#127CC1"
    Text {
        id: text1
        color: "gray"
        text: qsTr("MyDemo DailyWord")
        font.pixelSize: 20
        anchors.fill: parent
        anchors.margins: 10
        wrapMode: Text.WordWrap
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
