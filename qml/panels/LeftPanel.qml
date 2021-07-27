import QtQuick 2.13
import QtQuick.Controls 2.13
import "../custom"
import ".."

Rectangle {
    color: "#454545"
    CustomRoundButton {
        id: startLoading
        anchors {
            top: parent.top
            topMargin: 20
            left: parent.left
            leftMargin: 20
            right: parent.right
            rightMargin: 20
        }
        height: Theme.buttonHeight
        backgroundColor: "#28a457"
        text: qsTr("Start loading")
    }
    Item {
        id: listHdr
        anchors {
            top: startLoading.bottom
            topMargin: 25
            left: parent.left
            leftMargin: 10
            right: parent.right
            rightMargin: 10
        }
        Label {
            id: shippedLbl
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            font: Theme.fontRobotoMedium
            text: qsTr("Shipped for loading")
            color: "#979797"
        }
        Image {
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            height: 25
            width: height
            fillMode: Image.PreserveAspectFit
            mipmap: true
            source: "qrc:/img/SortOrderWhite.svg"
        }
    }
    ListView {
        id: shippedModel
        anchors {
            top: listHdr.bottom
            topMargin: 10
            left: listHdr.left
            right: listHdr.right
            bottom: parent.bottom
            bottomMargin: 10
        }
        spacing: 0
        clip: true
        snapMode: ListView.SnapToItem
        model: controller.shippedItemModel
        delegate: ShippedItemDelegate {
            id: delegate
            width: parent.width
            height: Theme.listItemHeight
            statusIndex: status
            text: title
            onCheckedChanged: {
                if (checked) {
                    delegate.subModel = shippedModel.model.pillsModel(index)
                    delegate.height = (delegate.subModel.rowCount + 1) * Theme.listItemHeight
                } else {
                    delegate.subModel = undefined
                    delegate.height = Theme.listItemHeight
                }
            }
        }
    }
}
