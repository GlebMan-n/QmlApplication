import QtQuick 2.15
import QtQml.Models 2.15
import QtQuick.XmlListModel 2.15

Rectangle {
    id: root
    property int minimumWidth: 150
    property int minimumHeight: 170
    property int photoInBlock: 3
    width: childrenRect.width < 1 ? minimumWidth : childrenRect.width
    height: minimumHeight
    property var model: ListModel{} //List of the photo
    color: "black"
    function calcColCount(size){
        if (size < 4 ) return 1;
        if (size < 7 ) return 2;
        if (size < 10 ) return 3;
        var result;
        result = (size % 3) > 0 ? (size / 3+1) : (size / 3);
        return result;
    }
    GridView {
        cellHeight: root.minimumHeight / root.photoInBlock
        cellWidth: root.minimumWidth
        model: root.model
        height: root.minimumHeight
        width: root.minimumWidth * calcColCount((root.model as ListModel).count)
        delegate: gridDelegate
    }

    Component {
        id: gridDelegate
        Rectangle {
            anchors.leftMargin: 1
            anchors.topMargin: 1
            width: root.minimumWidth
            height: root.minimumHeight / root.photoInBlock
            color: "black"
            border.width: 1
            border.color: "black"
            Rectangle {
                width: parent.width
                height: 6
                color: "#2077cd"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
            }
            Image {
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                source: filename
            }
            Rectangle {
                width: parent.width
                height: 6
                color: "#2077cd"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
            }

        }
    }
}
