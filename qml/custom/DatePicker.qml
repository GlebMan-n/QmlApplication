import QtQuick 2.15
import QtQuick.Controls 1.4
import ".."

Item {
    id: root
    property alias text: textDate.text
     property alias placeholderText: textDate.placeholderText

    CustomRoundTextField {
        id: textDate
        anchors {
            top: root.top
            left: root.left
        }
        width: root.width * 4/5
        height: parent.height
        placeholderText: qsTr("Date")
        text:Qt.formatDate(cal.selectedDate, "dd-MM-yyyy")
        frameHeight: Theme.buttonHeight
    }
    Button {
        id: button
        anchors {
            top: root.top
            left: textDate.right
        }
        width: root.width * 1/5
        height: parent.height
        Image {
            id: img
            anchors.fill: parent
            source: "qrc:/img/calendar.svg"
        }
        onClicked:{
            cal.visible = !cal.visible
        }
    }
    Calendar{
               id:cal
               z: 2
               anchors {
                   left: root.left
                   right: root.right
               }
               width: root.width
               height: 205
               visible: false
               selectedDate: new Date()
               onClicked:  {
                   textDate.text=Qt.formatDate(cal.selectedDate, "dd-MM-yyyy");
                    cal.visible=false
               }
    }
}





