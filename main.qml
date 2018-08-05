import QtQuick 2.9
import QtQuick.Controls 2.2
import "QML"
import "./js/ListViewClickListener.js" as Logic


ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 640
    height: 480
    color: "#B3E5FC"
    title: qsTr("Blank")

    TextView {
        id: rec1
        x: 228
        width: 200
        height: 0
        color: "#ffffff"
        anchors {
            horizontalCenter: applicationWindow.contentItem.horizontalCenter;
            top: applicationWindow.contentItem.top;
            topMargin: 20
        }
    }

    ScrollView {
        x: 174
        y: 185
        width: 360
        height: 480
        anchors {
            horizontalCenter: applicationWindow.contentItem.horizontalCenter;

        }

            ListView {
                width: parent.width
                model: listModel
                delegate: listDelegate
            }
    }

    /**
      * ListView 的適配器
      */
    Component {
        id: listDelegate
        Item {
            width: 200
            height: 50
            Text {
                id: nameField
                text: name
            }
            Text {
                text: '$' + cost
                anchors.left: nameField.right
            }
            Row {
                anchors.top: nameField.bottom
                spacing: 5
                Text { text: "Attributes:" }
                Repeater {
                    model: attributes
                    Text { text: description }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listModel.setProperty(index, "cost", cost * 2)
                    Logic.onClickListener(index, listModel)
                }
            }
        }
    }

    /**
      * ListView 的 Data Model
      */
    ListModel {
        id: listModel

        ListElement {
            name: "Bob"
            cost: 1.0
            attributes: [
                ListElement {
                    description: "Core"
                },
                ListElement {
                    description: "Destroy"
                }
            ]
        }

        ListElement {
            name: "Tim"
            cost: 8.7
            attributes: [
                ListElement {
                    description: "Mock"
                }
            ]
        }
    }
}



/*##^## Designer {
    D{i:12;anchors_height:100;anchors_width:200;anchors_x:228;anchors_y:56}
}
 ##^##*/
