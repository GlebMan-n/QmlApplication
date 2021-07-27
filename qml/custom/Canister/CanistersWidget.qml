import QtQuick 2.15
import QtQuick.Controls 1.4
import "../../custom"
import "../../"
import "../../custom/table_control/logic.js" as Logic
Item {
    id: root
    implicitWidth: 460
    implicitHeight: 460
    property int padding: 10
    property int spacing: 20
    property int standartRowHeight: 60
    property int standartElementWidth: 200

    property var upadateCanisterData

    Column {
        padding: root.padding
        id: root_buttons_col
        anchors.top: root.top
        anchors.left: root.left
        width: parent.width
        height: childrenRect.height + root.padding * 2
        Item {
            width: parent.width - root.padding * 2
            height: root.standartRowHeight

            CustomRoundButton {
                id: add_button
                anchors.top: parent.top
                anchors.left: parent.left
                text: "Add"
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                backgroundColor: "#2077cd"

                onClicked: {
                    Canisters.getCanisters()
                }
            }

            CustomRoundButton {
                id: edit_button
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                text: qsTr("Edit")
                backgroundColor: "#2077cd"

                Component.onCompleted: edit_button.enabled = false
                onClicked: {
                    upadateCanisterData = {
                        "ndc_code": text_ndc.text,
                        "generic_madication_name": text_generic_madication_name.text,
                        "medication_trade_name": text_medication_trade_name.text,
                        "low_threshold": text_low_threshold.text,
                        "uom": text_uom.text,
                        "tallman": text_tall_man.text,
                        "strength": text_strength.text,
                        "quantity": text_qty.text,
                        "location": text_canister.text
                    }
                    Canisters.updateCanister(upadateCanisterData);
                }

                Rectangle {
                    id: budgetUpdate
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 5
                    y: 20
                    height: (edit_button.height / 2) + 10
                    width: 40
                    radius: budgetUpdate.height / 2
                    color: "#5b78a2"
                    border.color: "#bbdefb"

                    visible: false

                    Text {
                        id: budgetUpdateText
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#fff"
                        font.pixelSize: 18
                        text: qsTr("0")
                    }
                }
            }

            CustomRoundButton {
                id: refill_button
                anchors {
                    top: parent.top
                    right: parent.right
                }
                text: qsTr("Refill")
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                backgroundColor: "#2077cd"
            }
        }
    }

    Column {
        anchors.top: root_buttons_col.bottom
        anchors.left: root.left
        padding: root.padding
        id: root_text_col
        width: root.width
        height: childrenRect.height + root.padding * 2
        spacing: root.spacing

        Item {
            width: parent.width - root.padding * 2
            height: childrenRect.height

            CustomRoundTextField {
                id: text_canister
                anchors {
                    top: parent.top
                    left: parent.left
                }
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                placeholderText: qsTr("Canister")
                frameHeight: Theme.buttonHeight
            }

            CustomRoundTextField {
                id: text_medication_trade_name
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                placeholderText: qsTr("Medication Name")
                frameHeight: Theme.buttonHeight
            }

            CustomRoundTextField {
                id: text_tall_man
                anchors {
                    top: parent.top
                    right: parent.right
                }
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                placeholderText: qsTr("Tall Man")
                frameHeight: Theme.buttonHeight
            }
        }
        Item {
            width: parent.width - root.padding * 2
            height: childrenRect.height

            CustomRoundTextField {
                id: text_generic_madication_name
                anchors {
                    top: parent.top
                    left: parent.left
                }
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                placeholderText: qsTr("Generic name")
                frameHeight: Theme.buttonHeight
            }
            CustomRoundTextField {
                id: text_ndc
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                placeholderText: qsTr("NDC")
                frameHeight: Theme.buttonHeight
            }
            CustomRoundTextField {
                id: text_qty
                anchors {
                    top: parent.top
                    right: parent.right
                }
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                placeholderText: qsTr("Quantity")
                frameHeight: Theme.buttonHeight
            }
        }
        Item {
            width: parent.width - root.padding * 2
            height: childrenRect.height

            CustomRoundTextField {
                id: text_strength
                anchors {
                    top: parent.top
                    left: parent.left
                }
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                placeholderText: qsTr("Strength")
                frameHeight: Theme.buttonHeight
            }

            CustomRoundTextField {
                id: text_low_threshold
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                placeholderText: qsTr("Low Threshold")
                frameHeight: Theme.buttonHeight
            }

            CustomRoundTextField {
                id: text_uom
                anchors {
                    top: parent.top
                    right: parent.right
                }
                width: parent.width/3 > root.standartElementWidth ? root.standartElementWidth : parent.width/3
                height: root.standartRowHeight
                placeholderText: qsTr("UOM")
                frameHeight: Theme.buttonHeight
            }
        }
    }

    //Tabs
    Column {
        anchors.top: root_text_col.bottom
        anchors.left: root.left
        padding: root.padding
        width: parent.width
        height: parent.height - root_buttons_col.height - root_text_col.height
        CanisterTabWidget {
            width: parent.width - root.padding * 2
            height: parent.height - root.padding * 2
            onSignItemClicked: {
                text_strength.text = item.strength;
                text_ndc.text = item.ndc;
                text_generic_madication_name.text = item.generic_madication_name;
                text_tall_man.text = item.tall_man;
                text_medication_trade_name.text = item.medication_trade_name;
                text_qty.text = item.qty;
                text_canister.text = item.location
                text_low_threshold.text = item.low_threshold
                text_uom.text = item.uom

                if(item.status !== 0){
                    budgetUpdateText.text = item.location
                    budgetUpdate.visible = true
                    edit_button.enabled = true
                } else {
                    budgetUpdate.visible = false
                    edit_button.enabled = false
                }
            }
            Timer {
                id: updateInstalledCanister
                interval: 1000; running: true; repeat: true;
                onTriggered: {
                    // Slot execute procedure
                    Canisters.getCanisters()
                }
            }
        }
    }
}
