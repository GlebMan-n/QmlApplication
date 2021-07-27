import QtQuick 2.13
import QtQuick.Controls 2.13
import ".."

Rectangle {
    id: control

    property alias sourceIcon: fieldIcon.source
    property alias placeholderText: field.placeholderText
    property alias text: field.text
    property alias fieldActiveFocus: field.activeFocus

    readonly property color backgroundColor: "#5b78a2"
    readonly property color backgroundColorSel: "white"
    readonly property color borderColor: "#889ab6"

    border {
        width: 1
        color: control.borderColor
    }
    color: field.activeFocus ? control.backgroundColorSel : control.backgroundColor
    radius: height / 2
    TextField {
        id: field
        background: Item {}
        anchors {
            left: parent.left
            leftMargin: control.radius
            right: fieldIcon.left
            rightMargin: fieldIcon.rightMargin
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: 5
        }
        font: Theme.fontRobotoMedium
        height: control.height - 2
        verticalAlignment: TextInput.AlignBottom
        color: field.activeFocus ? "black" : control.borderColor
    }
    Image {
        id: fieldIcon
        anchors {
            right: parent.right
            rightMargin: 0.05*parent.width
            verticalCenter: parent.verticalCenter
        }
        width: 0.6*parent.height
        height: width
        mipmap: true
        fillMode: Image.PreserveAspectFit
    }
}
