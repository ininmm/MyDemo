import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import "../js/DataStorage.js" as Storage

XmlListModel {
    id: xmlModel
    source: "https://www.cwb.gov.tw/rss/forecast/36_08.xml"
    query: "/rss/channel/item"
    XmlRole { name: "description"; query: "description/string()" }
}
