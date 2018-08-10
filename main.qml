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
    width: 640
    height: 480
    title: qsTr("MyDemo")
    color: "#B3E5FC"

    Component.onCompleted: {
        Storage.init()
    }

    Text {
        id: dailyText
        width: applicationWindow.width
        color: "gray"
        text: "讀取中..."
        anchors {
            top: applicationWindow.contentItem.top
            margins: 20
        }
        padding: 10
        font.pixelSize: 20
        wrapMode: Text.WordWrap
        Component.onCompleted: {
            DataUtil.request(function (o) {
                var data = DataUtil.filterTags(o.responseText,
                                      "<article class=\"dphs\">",
                                      "<\/article>")
                data = DataUtil.replaceData(data)
                console.log(data)
                dailyText.text = data
            })
        }
    }

    ScrollView {
        width: 360
        height: 480
        y: 8
        anchors.top: dailyText.bottom
        anchors.topMargin: 20
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

                    horizontalAlignment: Text.AlignHCenter
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
