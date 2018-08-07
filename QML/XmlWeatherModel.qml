import QtQuick 2.0
import QtQuick.XmlListModel 2.0

XmlListModel {
     source: "https://www.cwb.gov.tw/rss/forecast/36_08.xml"
     query: "/rss/channel/item[2]"
     XmlRole { name: "pubDate"; query: "pubDate/string()" }
     XmlRole { name: "title"; query: "title/string()" }
     XmlRole { name: "link"; query: "link/string()" }
     XmlRole { name: "description"; query: "description/string()" }
}
