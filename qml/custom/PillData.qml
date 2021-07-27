import QtQuick 2.13
import QtQuick.Controls 2.13

import QtQuick.XmlListModel 2.15

Rectangle {
    id: root
    property var qr_code_source: "qrc:/img/"
    property var name: "Dmytro Doe"
    property var date: ""
    property var pid: "59842982"
    property var bid: "mAquAS"
    property var cid: "12Gha"
    property var path_to_med_data: ""
    clip: true

    XmlListModel {
        id: xmlModel
        source: path_to_med_data
        query: "/meds/med"
        XmlRole { name: "xlm_number"; query: "number/string()" }
        XmlRole { name: "xlm_name"; query: "name/string()" }
        XmlRole { name: "xlm_qty"; query: "qty/string()" }
    }

    property int borderWidth: 5
    color: "white"
    width: 450
    //ROW HEIGHT
    height: 170

    Text {
        id: textName
        text: "<b>" + name + "</b>"
        font.pixelSize: 18
        anchors {

            left: parent.left
            top: parent.top
            topMargin: 4
            leftMargin: 4
        }
    }

    Text {
        id: textDate
        text: parent.date
        font.pixelSize: 11
        anchors{
            top: textName.bottom
            left: textName.left
            topMargin: 1
        }
    }

    Column {
        anchors.top: textName.top
        anchors.right: qr_code.left
        spacing: 2
        Text { text: "P: " + root.pid}
        Text { text: "B: " + root.bid}
        Text { text: "C: " + root.cid}
    }

    Image {
        id: qr_code
        width: 60
        height: 60
        anchors {
            right: parent.right
            top: parent.top
        }
        source: qr_code_source
    }

    Column {
        anchors {
            left: textName.left
            top: qr_code.bottom
        }

        ListView {
            id: lw
            //ROW HEIGHT
            height: 84 + borderWidth
            width: 450
            clip: true
            model: xmlModel
            orientation: ListView.Vertical
            delegate: medDelegate

            Component {
                id: medDelegate
                Row {
                    spacing: 6
                    Text {
                        width: 6 ;
                        text: xlm_number + "."
                    }
                    Text {
                        width: 370;
                        elide: Text.ElideRight
                        text: xlm_name
                    }
                    Text {
                        text: " - qty. <b>" + xlm_qty + "</b>"
                    }
                }
            }
        }
    }
}
