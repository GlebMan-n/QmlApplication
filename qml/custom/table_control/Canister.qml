import QtQuick 2.15
import "../../custom/table_control/logic.js" as Logic

Rectangle {
    id: root
    //bottomPadding: 1.25
    property int amount: 5
    property string name: "Vicadin"
    property Image qrCodeImage
    property string qrCodeString: "QR-Code"
    property int status: 0 //0,1,2,3
    property var item
    signal signClicked(var data)
    Rectangle {
        width: parent.width
        height: parent.height - 1.25
        color: Logic.statusToColor(root.status)
        border.color: "black"
        border.width: 1
        radius: 3
        Text {
            id: amountText
            color: Logic.statusToTextColor(root.status)
            anchors {
                left: parent.left
                top:parent.top
                leftMargin: 10
                topMargin: 10
            }
            width: parent.width * 2/3
            height: parent.height * 1/5
            text: (root.status > 0 && root.status < 4 ) ? root.amount : ""
            font.pointSize: 18
        }
        Text {
            color: Logic.statusToTextColor(root.status)
            anchors {
                left: parent.left
                top:amountText.bottom
                leftMargin: 10
                topMargin: 5
            }
            width: parent.width * 2/3
            height: parent.height * 1/5
            id: mediText
            text: (root.status > 0 && root.status < 4 ) ? root.name : ""
            font.pointSize: 16
        }
        Text {
            color: Logic.statusToTextColor(root.status)
            anchors {
                left: parent.left
                top:mediText.bottom
                leftMargin: 10
                topMargin: 5
            }
            width: parent.width * 2/3
            height: parent.height * 1/5
            id: qrcodeText
            text: (root.status > 0 && root.status < 4 ) ? root.qrCodeString : ""
            font.pointSize: 16
        }
    }

    MouseArea {
        onClicked: root.signClicked(item)
        anchors.fill: parent
    }
}

