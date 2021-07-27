import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "tabs"
import "custom"
import "panels"

import "./custom/table_control"
import "./custom/table_control/logic.js" as Logic

import BinsModel 1.0

ApplicationWindow {
    objectName: "mainWindow"
    visible: true
    title: qsTr("Emilia Cockpit")
    minimumWidth: 968
    minimumHeight: 600
    Component.onCompleted: showMaximized()
    id: app
    onAfterAnimating: {
    }
    header: Rectangle {
        color: Theme.headerColor
        height: bar.height + 5
        Item {
            id: logoFrame
            anchors.left: parent.left
            height: parent.height
            width: 220
            Row {
                height: 0.7 * parent.height
                width: parent.width
                spacing: 15
                leftPadding: 10
                topPadding: 5
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                Image {
                    id: image_logo
                    height: 0.7 * parent.height
                    width: height
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                    source: "qrc:/img/logo.svg"
                }
                Item {
                    height: 0.7 * parent.height
                    width: parent.width - image_logo.width
                    Text {
                        text: "Bob Parrado"
                        anchors.verticalCenter: parent.verticalCenter
                        color: "white"
                        font {
                            family: Theme.robotoMedium.name
                            pointSize: 18
                        }
                    }
                }
            }

        }
        TabBar {
            id: bar
            readonly property var iconNameArr: ["OrderIntake", "Canisters", "Cartriges", "PillChecker", "Vials", "Config"]
            anchors {
                right: searchField.left
                bottom: parent.bottom
                left: logoFrame.right
            }
            Repeater {
                model: tabs.count
                CustomTabButton {
                    isCurrent: (index === bar.currentIndex)
                    text: tabs.itemAt(index).objectName
                    font: Theme.fontRobotoMedium
                    source: "qrc:/img/" + bar.iconNameArr[index] + (isCurrent ? "Cur" : "") + ".svg"
                }
            }
            background: Item {}
        }
        TextFieldWithIcon {
            id: searchField
            anchors {
                right: userAvatar.left
                rightMargin: 20
                verticalCenter: parent.verticalCenter
            }
            sourceIcon: "qrc:/img/Search" + (searchField.fieldActiveFocus ? "Cur" : "") + ".svg"
            placeholderText: qsTr("Search")
            height: bar.height - 5
            width: 250
        }
        Image {
            id: userAvatar
            anchors {
                right: userConfig.left
                rightMargin: 5
                verticalCenter: parent.verticalCenter
            }
            source: "qrc:/img/UserBlue.svg"
            height: searchField.height
            width: height
            fillMode: Image.PreserveAspectFit
            mipmap: true
        }
        Image {
            id: userConfig
            anchors {
                right: parent.right
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
            source: "qrc:/img/UserConfig.svg"
            height: searchField.height
            width: height / 2
            fillMode: Image.PreserveAspectFit
            mipmap: true
        }
    }

    Item {
        id: root
        anchors.fill: parent

        MouseArea {
            anchors.fill: root
            acceptedButtons: Qt.RightButton
            onClicked: {
                var point = root.mapToItem(order_intake,mouseX,mouseY);
                var item = Logic.getItemByObjectName(order_intake, point, "CellRectangle");
                if(item === null) return;
                pieMenu.connectedItem = (item as CellRectangle);
                pieMenu.popup(mouseX, mouseY);
            }
        }

        LeftPanel {
            id: leftPanel
            anchors {
                top: parent.top
                left: parent.left
            }
            height: parent.height
            width: logoFrame.width
        }

        StackLayout {
            id: tabs
            anchors {
                top: parent.top
                left: leftPanel.right
                right: parent.right
            }
            height: parent.height
            currentIndex: bar.currentIndex

            clip: true

            OrderIntake {
                id: order_intake
                objectName: "Order Intake"
            }
            Canisters {
                objectName: qsTr("Canisters")
            }
            Verification {
                objectName: qsTr("Verification")
            }
            Config {
                objectName: qsTr("Config")
            }
        }

        CustomPieMenu {
            id: pieMenu
            onFillRest: {

            }
        }


    }
}
