import QtQuick 2.15

Item {
    id: root
    width: 1920
    height: 1080
    property int rowHeight: 40
    property int genSpacing: 2
    property var date: "1 20 2015 DEC"
    property var color: "#89eff5"

    Row {
        width: root.width
        spacing: root.genSpacing
        height: childrenRect.height
        Rectangle {
            id: binRec
            height: column.childrenRect.height
            width: textDate.width + 50
            color: root.color
            Text {
                id: textDate
                text: root.date
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.NoWrap
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Column {
            id: column
            spacing: root.genSpacing
            height: childrenRect.height
            width: root.width
            Repeater {
                id: repeat_
                model: 2
                BinElement {
                    rowHeight: 40
                    genSpacing: 2
                    binName: "Bin 1"
                    time: "10:45 AM"
                    color: "#89eff5"
                    width: 450
                    //height: 40
                }
            }
        }
    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
