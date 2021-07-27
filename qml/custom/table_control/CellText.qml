import QtQuick 2.15
import "../../"
Text {
    id: root
    property color fontColor: "white"
    property string mainText;
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    color: root.fontColor
    text: mainText
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    font {
        family: Theme.robotoMedium.name
        pointSize: Theme.fontPointSize
        capitalization: Font.AllUppercase
    }
}
