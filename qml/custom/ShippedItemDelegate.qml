import QtQuick 2.13
import QtQuick.Controls 2.13
import ShippedItemModel 1.0
import PillsModel 1.0
import ".."

Item {
    id: control
    property int statusIndex: -1
    property alias text: itemLabel.text
    property alias checked: itemArrow.checked
    property alias subModel: subList.model
    function statusImage(val) {
        var img = ""
        if (ShippedItemModel.StatusSuccess === val) {
            img = "qrc:/img/StatusSuccess.svg"
        } else if (ShippedItemModel.StatusWaiting === val) {
            img = "qrc:/img/StatusWaiting.svg"
        } else if (ShippedItemModel.StatusWarning === val) {
            img = "qrc:/img/StatusWarning.svg"
        }
        return img
    }
    Row {
        id: itemRow
        spacing: 5
        height: Theme.listItemHeight
        width: parent.width
        CustomImageButton {
            id: itemArrow
            anchors.verticalCenter: itemStatus.verticalCenter
            height: 25
            iconSource: ["qrc:/img/ArrowUp.svg", "qrc:/img/ArrowDown.svg"]
        }
        Image {
            id: itemStatus
            anchors.verticalCenter: itemLabel.verticalCenter
            source: control.statusImage(control.statusIndex)
            height: 0.6 * itemLabel.height
            width: height
            fillMode: Image.PreserveAspectFit
            mipmap: true
        }
        LabelToolTip {
            id: itemLabel
            height: parent.height
            verticalAlignment: Text.AlignVCenter
            width: parent.width - itemArrow.width - itemStatus.width - 2 * itemRow.spacing
            color: "#cdcdcd"
        }
    }
    ListView {
        id: subList
        function statusImage(val) {
            var img = ""
            if (ShippedItemModel.StatusSuccess === val) {
                img = "qrc:/img/StatusSuccess.svg"
            } else if (ShippedItemModel.StatusWarning === val) {
                img = "qrc:/img/StatusWarning.svg"
            }
            return img
        }
        anchors {
            top: itemRow.bottom
            left: parent.left
            leftMargin: 20
            right: parent.right
            bottom: parent.bottom
        }
        delegate: Row {
            id: subItemRow
            height: Theme.listItemHeight
            width: parent.width
            spacing: 5
            Image {
                id: subItemStatus
                anchors.verticalCenter: parent.verticalCenter
                source: subList.statusImage(pillStatus)
                height: 0.6 * itemLabel.height
                width: height
                fillMode: Image.PreserveAspectFit
                mipmap: true
            }
            LabelToolTip {
                text: pillTitle
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                width: parent.width - subItemStatus.width - subItemRow.spacing
                color: "#cdcdcd"
            }
        }
    }
}
