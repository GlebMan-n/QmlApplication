import QtQuick 2.15
import "../../"
TextInput {
    id: root
    property color fontColor: "white"
    property int pixelSize: 18
    property string mainText;
    property bool editable: true
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    color: root.fontColor
    //font.pixelSize: root.pixelSize
    text: mainText
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    wrapMode: Text.Wrap
    property bool correctValue: false
    onTextEdited: correctValue = false
    font {
        family: Theme.robotoMedium.name
        pointSize: Theme.fontPointSize
        capitalization: Font.AllUppercase
    }
    property string placeholderText: "..."
    Text {
        id: placeholder
        text: root.placeholderText
        color: "#aaa"
        visible: !cursorVisible && root.text.length === 0
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font {
            family: Theme.robotoMedium.name
            pointSize: Theme.fontPointSize
            capitalization: Font.AllUppercase
        }
    }

}
