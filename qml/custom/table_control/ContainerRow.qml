import QtQuick 2.15

BaseRowRectangle {
    id: root
    property var model;
    property var index: 0
    border.width: 0
    signal signClicked(var data, var row_number)
    Row {
        width: parent.width
        height: childrenRect.height
        spacing: 2
        bottomPadding: 1.25
        Rectangle {
            id: row_header
            width: 25
            height: 118.75
            color: "#2077cd"
            Text {
                text: root.index
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
            }
        }
        Row {
            spacing: 2
            height: childrenRect.height
            Repeater {
                width: parent.width
                height: childrenRect.height
                model: root.model
                Canister {
                    width: root.width / root.model.count - 2 - (row_header.width / root.model.count)
                    height: 120
                    status: model.status
                    amount: model.qty
                    name: model.medication_trade_name
                    qrCodeString: model.qr_code
                    item: root.model.get(index)
                    onSignClicked: {                       
                        root.signClicked(data,-1)
                    }
                }
            }
        }
    }

}
