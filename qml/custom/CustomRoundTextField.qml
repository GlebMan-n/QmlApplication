import QtQuick 2.13
import QtQuick.Controls 2.13
import ".."

Item {
    id: control
    property alias placeholderText: field.placeholderText
    property alias text: field.text
    property alias fieldActiveFocus: field.activeFocus
    property alias frameHeight: controlFrame.height
    property alias textColor: field.color
    height: childrenRect.height
    Rectangle {
        id: controlFrame

        border {
            width: 1
            color: "#b5b5b5"
        }
        color: "transparent"
        radius: height / 2
        width: parent.width
        TextField {
            id: field
            background: Item {}
            anchors {
                left: parent.left
                leftMargin: 15
                right: parent.right
                rightMargin: 15
                verticalCenter: parent.verticalCenter
            }
            font: Theme.fontRobotoMedium
            height: controlFrame.height - 2
            verticalAlignment: TextInput.AlignBottom
            color: Theme.textColorDark
        }
    }
    Label {
        id: controlTitle
        anchors {
            top: controlFrame.bottom
            topMargin: 5
            left: controlFrame.left
            leftMargin: 15
        }
        color: field.color
        text: control.placeholderText
        font {
            family: Theme.robotoMedium.name
            pointSize: Theme.fontPointSize - 4
        }
    }
}
