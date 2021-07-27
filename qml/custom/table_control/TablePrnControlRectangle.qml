import QtQuick 2.15
import "logic.js" as Logic
import QtQuick.Dialogs 1.1

BaseRowRectangle {
    id: root
    height: childrenRect.height
    property var model_table_prn
    property bool is_prn: true

    ListView {
        objectName: "ListView"
        id: list_view
        property var copyDay
        clip: false
        spacing: 0
        width: parent.width
        height: parent.height
        model: root.model_table_prn
        delegate: dayDelegate
        header: headerPrn
        headerPositioning: ListView.OverlayHeader
    }

    Component {
        id: dayDelegate
        Row {
            property color background: {index % 2 == 0 ? root.first_backgroundColor : root.second_backgroundColor}
            property color textColor: {index % 2 == 0 ? root.first_text_color : root.second_text_color}
            id: frame
            width: list_view.width
            height: childrenRect.height
            PrnDayRow {
                onModelChanged: forceActiveFocus()
                pieMenuParent: root.pieMenuParent
                borderColor: background
                text_color: textColor
                mainWidth: frame.width - (frame.leftPadding + frame.rightPadding)
                height: childrenRect.height
                textDay: day
                model: bins
            }
        }
    }

    Component {
        id: headerPrn
        Column {
            height: childrenRect.height
            width: list_view.width
            z:2
            Row {
                spacing: 2
                height: 40
                width: root.width
                Rectangle {
                    color: root.first_backgroundColor
                    id: date_header1
                    height: 40
                    width: root.width * 0.105
                    CellText {
                        anchors.fill: parent
                        text: "Date"
                    }
                }
                Rectangle {
                    color: root.first_backgroundColor
                    id: bin_header1
                    height: 40
                    width: root.width * 0.1785
                    CellText {
                        anchors.fill: parent
                        text: "Bin"
                    }
                }
                Rectangle {
                    color: root.first_backgroundColor
                    id: medicion_header1
                    height: 40
                    width: root.width - (qty_header1.width + bin_header1.width + date_header1.width)
                    CellText {
                        anchors.fill: parent
                        text: "Medication"
                    }
                }
                Rectangle {
                    color: root.first_backgroundColor
                    id: qty_header1
                    height: 40
                    width: root.width * 0.071
                    CellText {
                        anchors.fill: parent
                        text: "quantity"
                    }
                }
            }
            Rectangle {
                width: parent.width
                height: 1
                color: "white"
            }
        }
    }

}
