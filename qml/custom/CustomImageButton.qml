import QtQuick 2.13

Image {
    id: control
    property var iconSource: []
    property bool checked: false
    source: control.checked ? control.iconSource[1] : control.iconSource[0]
    height: 25
    width: height
    fillMode: Image.PreserveAspectFit
    mipmap: true
    MouseArea {
        anchors.fill: parent
        onClicked: control.checked = !control.checked
        onPressed: control.scale = 0.9
        onReleased: control.scale = 1.0
    }
}
