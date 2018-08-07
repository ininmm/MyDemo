import QtQuick 2.0

Component {
    Item {
        width: 200
        height: 50
        Row {
            id: rowPub
            spacing: 5
            anchors.centerIn: parent
            Text {
                id: pubDateField
                text: pubDate
                wrapMode: Text.Wrap
            }
        }
        Row {
            id: rowTitle
            anchors.top: rowPub.bottom
            spacing: 5
            Text {
                id: titleField
                text: title
                wrapMode: Text.Wrap
            }
        }
        Row {
            id: rowLink
            anchors.top: rowTitle.bottom
            spacing: 5
            Text {
                id: linkField
                text: link
                wrapMode: Text.Wrap
            }
        }
        Row {
            id: rowDesc
            anchors.top: rowLink.bottom
            spacing: 5
            Text {
                id: descriptionField
                text: {
                    var data = description.split("<BR>")
                    console.log(data[1])
                    qsTr(data[1])
                }
                wrapMode: Text.Wrap
            }
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
