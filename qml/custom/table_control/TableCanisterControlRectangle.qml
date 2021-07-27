import QtQuick 2.15

BaseRowRectangle {
    id: root
    property var model_canister
    property bool is_prn: true
    signal signItemClicked(var item, var row_number)

    ListView {
        objectName: "ListView"
        id: list_view
        clip: false
        spacing: 0
        width: parent.width
        height: parent.height
        model: model_canister
        delegate: canisterDelegate
        header: headerCanister
        headerPositioning: ListView.OverlayHeader
    }

    Component {
        id: canisterDelegate
        Row {
            property color background: {index % 2 == 0 ? root.first_backgroundColor : root.second_backgroundColor}
            property color textColor: {index % 2 == 0 ? root.first_text_color : root.second_text_color}
            id: frame
            width: list_view.width
            height: childrenRect.height
            ContainerRow {
                pieMenuParent: root.pieMenuParent
                borderColor: background
                text_color: textColor
                mainWidth: frame.width - (frame.leftPadding + frame.rightPadding)
                height: childrenRect.height
                model: med
                index: number
                onSignClicked: {
                    root.signItemClicked(data, number)
                }
             }
        }
    }

    Component {
        id: headerCanister
        Column {
            height: childrenRect.height
            width: list_view.width
            z:2
             Row {
                 id: header_row
                 spacing: 2
                 height: 40
                 width: root.width
                 Rectangle {
                     id: row_header
                     color: root.first_backgroundColor
                     height: 40
                     width: 25
                     CellText {
                      anchors.fill: parent
                      text: ""
                     }
                 }
                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "1"
                     }
                 }
                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "2"
                     }
                 }

                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "3"
                     }
                 }

                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "4"
                     }
                 }

                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "5"
                     }
                 }

                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "6"
                     }
                 }

                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "7"
                     }
                 }
                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "8"
                     }
                 }
                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "9"
                     }
                 }
                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "10"
                     }
                 }
                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "11"
                     }
                 }
                 Rectangle {
                     color: root.first_backgroundColor
                     height: 40
                     width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                     CellText {
                      anchors.fill: parent
                      text: "12"
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
