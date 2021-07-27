import QtQuick 2.12
import QtQuick.Controls 2.5
import ".."

Rectangle {
    id: control
    property bool isHeader: true
    property alias checked: controlCheckBox.checked
    color: control.isHeader ? Theme.tableHeaderColor : "transparent"
    border {
        width: 1
        color: Theme.borderColor
    }
    CheckBox {
        id: controlCheckBox
        anchors.centerIn: parent
        contentItem: Item {}
        checkable: true
        indicator: Rectangle {
            anchors.centerIn: parent
            implicitWidth: control.width / 2
            implicitHeight: implicitWidth
            radius: 2
            border.color: "#cfcfcf"
            color: controlCheckBox.checked ? "#2d73e7" : "transparent"
            Image {
                visible: controlCheckBox.checked
                anchors {
                    margins: 1
                    fill: parent
                }
                source: "qrc:/img/check.svg"
                fillMode: Image.PreserveAspectFit
                mipmap: true
            }
        }
    }
}
