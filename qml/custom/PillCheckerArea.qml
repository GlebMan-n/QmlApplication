import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.XmlListModel 2.15
import QtQml.Models 2.15

Rectangle {
    id: root
    clip: true
    property var xml_file: "qrc:/xml/example.xml"
    color: "black"

    XmlListModel {
        id: xmlModel
        source: xml_file
        query: "/bin/item"
        XmlRole { name: "xlm_name"; query: "patient/string()" }
        XmlRole { name: "xlm_date"; query: "date/string()" }
        XmlRole { name: "xlm_pid"; query: "pid/string()" }
        XmlRole { name: "xlm_bid"; query: "bid/string()" }
        XmlRole { name: "xlm_cid"; query: "cid/string()" }
        XmlRole { name: "xlm_qr_code_source"; query: "qr_code_source/string()" }
        XmlRole { name: "xlm_med_data"; query: "med_data/string()" }
        XmlRole { name: "xml_photo_source"; query: "photo_source/string()" }
        XmlRole { name: "xlm_color"; query: "color/string()" }
        XmlRole { name: "xlm_border_width"; query: "border_width/string()" }
        XmlRole { name: "xlm_box_file"; query: "box_file/string()" }
        XmlRole { name: "xlm_photos"; query: "photos/string()" }

    }

    ListView {
        id: lw
        width: parent.width
        height: parent.height
        //+ margins + bins spacing
        spacing: 1
        anchors {
            margins: spacing
            left: parent.left
            right: parent.right
            top: parent.top
        }
        model: xmlModel
        delegate: numberDelegate
    }

    Component {
        id: numberDelegate

        Row {
            //ROW HEIGHT
            height: 170
            width: root.width
            BinPhotos{
                patientName: xlm_name
                date: xlm_date
                pid: xlm_pid
                bid: xlm_bid
                cid: xlm_cid
                qr_code_source: xlm_qr_code_source
                photo_source: "qrc:/xml/photo/" + xml_photo_source
                med_data: xlm_med_data
                spaceBetweenElem: lw.spacing
                borderColor: xlm_color
                borderWidth: xlm_border_width
                box_file: xlm_box_file
                root_model: xlm_photos
            }
        }
    }
}

