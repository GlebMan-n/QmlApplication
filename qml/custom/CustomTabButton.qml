import QtQuick 2.13
import QtQuick.Controls 2.13
import ".."

TabButton {
    id: control
    property alias source: btnImg.source
    property bool isCurrent: false
    contentItem: Row {
        spacing: 10
        Image {
            id: btnImg
            anchors.verticalCenter: btnLtext.verticalCenter
            height: 1.25 * btnLtext.height
            width: height
            fillMode: Image.PreserveAspectFit
            mipmap: true
        }
        Text {
            id: btnLtext
            text: control.text
            font: control.font
            color: control.isCurrent ? "#454545" : "#b5b5b5"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        radius: 5
        color: control.isCurrent ? "white" : Theme.headerColor
    }
}
