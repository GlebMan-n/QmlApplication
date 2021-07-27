import QtQuick 2.13
import QtQuick.Controls 2.13
import ".."

Button {
    id: control
    property color backgroundColor: "transparent"
    property alias imageSource: controlImage.source
    property alias imageVisible: controlImage.visible
    background: Rectangle {
        radius: control.height / 2
        color: control.pressed ? Qt.darker(control.backgroundColor) : control.backgroundColor
    }

    contentItem: Item {
        width: control.width
        Image {
            id: controlImage
            anchors {
                left: parent.left
                leftMargin: 5
                verticalCenter: parent.verticalCenter
            }
            visible: false
            height: 0.6 * parent.height
            width: height
            fillMode: Image.PreserveAspectFit
            mipmap: true
            source: ""
        }
        Text {
            anchors {
                left: controlImage.visible ? controlImage.right : parent.left
                leftMargin: 5
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 5
            }
            font {
                family: Theme.robotoMedium.name
                pointSize: Theme.fontPointSize
                capitalization: Font.AllUppercase
            }
            text: control.text
            color: "white"
            height: parent.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            clip: true
            elide: Text.ElideRight
        }
    }
}
