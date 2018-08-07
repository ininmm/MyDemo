import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11
import QtQuick.XmlListModel 2.11
import "./QML"
import "./js/ListViewClickListener.js" as Logic
import "./js/DataFilter.js" as DataFilter


ApplicationWindow {
    id: applicationWindow
    visible: true
    color: "#B3E5FC"

    ColumnLayout {
        id: columnLayout
        spacing: 2
        anchors.fill: parent

        TextView {
            id: titleView
            color: "#ffffff"
            anchors {
                top: columnLayout.top;
                topMargin: 20
            }
        }

        ScrollView {
            width: 360
            height: 480
            y: 8
            anchors.top: titleView.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: columnLayout.horizontalCenter

            ListView {
                width: parent.width
                model: weatherModel
                delegate: weatherComponent
            }
        }

        XmlListComponent {
            id: weatherComponent
        }

        XmlWeatherModel {
            id: weatherModel
        }
    }







    /**
      * ListView 的適配器
      */
//    Component {
//        id: listDelegate
//        Item {
//            width: 200
//            height: 50
//            Text {
//                id: nameField
//                text: name
//            }
//            Text {
//                text: '$' + cost
//                anchors.left: nameField.right
//            }
//            Row {
//                anchors.top: nameField.bottom
//                spacing: 5
//                Text { text: "Attributes:" }
//                Repeater {
//                    model: attributes
//                    Text { text: description }
//                }
//            }

//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    listModel.setProperty(index, "cost", cost * 2)
//                    Logic.onClickListener(index, listModel)
//                }
//            }
//        }
//    }

//    /**
//      * ListView 的 Data Model
//      */
//    ListModel {
//        id: listModel

//        ListElement {
//            name: "Bob"
//            cost: 1.0
//            attributes: [
//                ListElement {
//                    description: "Core"
//                },
//                ListElement {
//                    description: "Destroy"
//                }
//            ]
//        }

//        ListElement {
//            name: "Tim"
//            cost: 8.7
//            attributes: [
//                ListElement {
//                    description: "Mock"
//                }
//            ]
//        }
//    }

//    XmlListModel {
//         id: weatherModel
//         source: "https://www.cwb.gov.tw/rss/forecast/36_08.xml"
//         query: "/rss/channel/item[2]"
//         XmlRole { name: "pubDate"; query: "pubDate/string()" }
//         XmlRole { name: "title"; query: "title/string()" }
//         XmlRole { name: "link"; query: "link/string()" }
//         XmlRole { name: "description"; query: "description/string()" }
//    }

//    Component {
//        id: xmlDelegate
//        Item {
//            width: 200
//            height: 50
//            Row {
//                id: rowPub
//                spacing: 5
//                Text {
//                    id: pubDateField
//                    text: pubDate
//                }
//            }
//            Row {
//                id: rowTitle
//                anchors.top: rowPub.bottom
//                spacing: 5
//                Text {
//                    id: titleField
//                    text: title
//                }
//            }
//            Row {
//                id: rowLink
//                anchors.top: rowTitle.bottom
//                spacing: 5
//                Text {
//                    id: linkField
//                    text: link
//                }
//            }
//            Row {
//                id: rowDesc
//                anchors.top: rowLink.bottom
//                spacing: 5
//                Text {
//                    id: descriptionField
//                    text: {
//                        var data = description.split("<BR>")
//                        console.log(data[1])
//                        data[1]
//                    }
//                }
//            }
//        }
//    }
}



/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
