import QtQuick 2.13
import QtQuick.Controls 2.13

Image {
    id: root
    width: 150
    //ROW HEIGHT
    height: 170
    signal clicked
    property int photoCount: 0
    property bool showCount: false
    clip: true
    Text {
        id: photoCount
        color: "white"
        visible: showCount
        anchors {
            top: parent.top
            right: parent.right
            rightMargin: 5
        }
        font {
            pixelSize: 40
            family: "Ubuntu"
        }

        text: parent.photoCount
    }
    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
