import QtQuick 2.13
import QtQuick.Controls 2.13
import ".."

Rectangle {
    id: control
    property bool isHeader: true
    property alias text: controlLabel.text
    color: control.isHeader ? Theme.tableHeaderColor : "transparent"
    border {
        width: 1
        color: Theme.borderColor
    }
    Label {
        id: controlLabel
        anchors.fill: parent
        horizontalAlignment: Text.AlignLeft
        leftPadding: 5
        verticalAlignment: Text.AlignVCenter
        clip: true
        elide: Text.ElideRight
        color: "#585858"
        font: Theme.fontRobotoLight
    }
}
