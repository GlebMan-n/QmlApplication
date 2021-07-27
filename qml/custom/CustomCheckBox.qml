import QtQuick 2.13
import QtQuick.Controls 2.13
import ".."

CheckBox {
    id: control
    font: Theme.fontRobotoMedium
    indicator: Rectangle {
        anchors {            
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        implicitWidth: 20
        implicitHeight: implicitWidth
        radius: 2
        border.color: Theme.textColorDark
        color: control.checked ? "#2d73e7" : "transparent"
        Image {
            visible: control.checked
            anchors {
                margins: 1
                fill: parent
            }
            source: "qrc:/img/check.svg"
            //fillMode: Image.PreserveAspectFit
            mipmap: true
        }
    }
    /*contentItem: Text {
        visible: false
        text: control.text
        font: control.font
        color: Theme.textColorDark
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }*/
}
