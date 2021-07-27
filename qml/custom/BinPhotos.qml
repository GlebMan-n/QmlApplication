import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.XmlListModel 2.15
import ".."
import QtQml.Models 2.15

Item {
    id: root
    property var date: ""
    property var pid: ""
    property var bid: ""
    property var cid: ""
    property int borderWidth: 5
    property var borderColor: "red"
    property int spaceBetweenElem: 0
    property var med_data: ""
    property var photo_source: ""
    property var qr_code_source: ""
    property var patientName: ""
    property var box_file: ""
    property var pills_model
    property var root_model

    ListModel {
        id: photos_model
    }


    Component.onCompleted: {
        var splitted = root_model.split( "\n" );
        for (var i = 1; i < splitted.length; i++) {
            var s = splitted[i].substr(8)
            if(s !== undefined && s !== "" && s.length > 0)            
                photos_model.append({"filename" : s});

        }
    }


    width: parent.width
    //ROW HEIGHT
    height: 170

    XmlListModel {
        id: xmlModel
        source: photo_source
        query: "/photos/photo"

        XmlRole { name: "xlm_filename"; query: "filename/string()" }
        XmlRole { name: "xlm_name"; query: "name/string()" }
        XmlRole { name: "xlm_qty"; query: "qty/string()" }
    }

    Rectangle {
       clip: true
       color: "black"
       border.width: borderWidth
       border.color: borderColor
       width: parent.width
       height: parent.height
       PillData {
           property date currentDate: new Date()
           property var locale: Qt.locale()
           id: pdata

           qr_code_source: "qrc:/img/" + root.qr_code_source
           path_to_med_data: "qrc:/xml/med/" + root.med_data
           name: root.patientName
           date: root.date
           pid: root.pid
           bid: root.bid
           cid: root.cid

           //ROW HEIGHT
           height: parent.height - borderWidth * 4
           width: 450 - borderWidth * 2
           borderWidth: borderWidth
           anchors {
               top: parent.top
               left: parent.left
               topMargin: borderWidth* 2
               leftMargin: borderWidth* 2
           }
       }

       Image{
           fillMode: Image.Stretch
           id: photo_bank
           anchors {
               top: parent.top
               left: pdata.right
               topMargin: borderWidth
           }
           source: root.box_file
           height: parent.height - borderWidth * 2
           width: 150

       }

       PillsPhoto {
           id: photos_pills
           anchors {
               top: parent.top
               left: photo_bank.right
               topMargin: borderWidth* 2
           }
           minimumHeight: parent.height - borderWidth * 4
           minimumWidth: 150
           model: photos_model
       }

       ListView {
           id: lw
           width: parent.width
           height: parent.height - borderWidth*2
           //+ margins + bins spacing
           spacing: 1
           anchors {
               topMargin: borderWidth
               left: photos_pills.right
               right: parent.right
               top: parent.top
           }
            clip: true

           model: xmlModel
           orientation: ListView.Horizontal
           delegate: photoDelegate

           Component {
               id: photoDelegate

               PillPhoto{
                   source: "qrc:/img/" + xlm_filename
                   photoCount: xlm_qty
                   //ROW HEIGHT
                   height: 170 - borderWidth * 2
                   width: 150
                   showCount: xlm_qty!=0
               }
           }
       }
    }
 }//Item
