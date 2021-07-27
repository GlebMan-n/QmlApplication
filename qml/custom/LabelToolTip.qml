import QtQuick 2.12
import QtQuick.Controls 2.13
import ".."

Label {
    id: controlLabel
    property alias toolTipZ: controlToolTip.z
    clip: true
    elide: Text.ElideRight
    font: Theme.fontRobotoMedium
    MouseArea {
        id: controlLabelMouseArea
        enabled: controlLabel.truncated
        anchors.fill: parent
        hoverEnabled: true
    }
    ToolTip {
        id: controlToolTip
        visible: controlLabelMouseArea.containsMouse
        text: controlLabel.text
    }
}
