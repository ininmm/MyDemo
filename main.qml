import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.11
import QtQuick.XmlListModel 2.11
import QtQuick.LocalStorage 2.0
import "./QML"
import "./js/DataStorage.js" as Storage
import "./js/ListViewClickListener.js" as Click
import "./js/Utils.js" as DataUtil


ApplicationWindow {
    id: applicationWindow
    visible: true
    color: "#B3E5FC"

    Component.onCompleted: {
        Storage.init()
    }

    Rectangle {
        id: titleView
        color: "#127CC1"
        anchors {
            top: applicationWindow.contentItem.top
            topMargin: 20
        }

        Text {
            id: dailyText
            color: "gray"
            text: qsTr("MyDemo DailyWord")
            font.pixelSize: 20
            anchors.fill: parent
            anchors.margins: 10
            wrapMode: Text.WordWrap
        }
    }

    ScrollView {
        width: 360
        height: 480
        y: 8
        anchors.top: titleView.bottom
        anchors.topMargin: 160
        anchors.horizontalCenter: applicationWindow.contentItem.horizontalCenter

        ListView {
            id: listView
            width: parent.width
            delegate: weatherComponent
        }
    }

    XmlWeatherModel {
        id: weatherModel

        onStatusChanged: {
            Storage.deleteAllWeather()
            var weatherdesc = DataUtil.getWeekDescription(weatherModel.get(1).description)
            DataUtil.filterAndStoreWeather(weatherdesc)
            listView.model = Storage.getAllWeather()
        }
    }

    Component {
        id: weatherComponent
        Item {
            width: 200
            height: 50
            Row {
                id: rowdesc
                spacing: 5
                anchors.centerIn: parent
                Text {
                    id: descriptionField
                    text: modelData
                    font.pixelSize: 14
                    wrapMode: Text.Wrap
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listView.currentIndex = index
                    Click.onClickListener(index, modelData)
                    listView.model = Storage.getAllWeather()
                }
            }
        }
    }
}



/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
