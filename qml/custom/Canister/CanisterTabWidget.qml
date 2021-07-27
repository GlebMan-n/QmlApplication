import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../table_control"

BaseRowRectangle {
    id: root
    signal signItemClicked(var item, var row_number)

    TabBar {
        id: bar
        anchors {
            top: root.top
            left: root.left
            right: root.right
        }

        TabButton {
            id: tab1
            checkable: true
            text: qsTr("Installed in device")
            contentItem: Text {
                text: tab1.text
                font: tab1.font
                opacity: enabled ? 1.0 : 0.3
                color: tab1.pressed ? Qt.darker(root.first_text_color) : root.first_text_color
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                radius: 2
                color: tab1.checked ?  Qt.darker(root.first_backgroundColor) : root.first_backgroundColor
            }
        }
        TabButton {
            id: tab2
            checkable: true
            text: qsTr("All available")
            contentItem: Text {
                text: tab2.text
                font: tab2.font
                opacity: enabled ? 1.0 : 0.3
                color: tab2.pressed ? Qt.darker(root.first_text_color) : root.first_text_color
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                radius: 2
                color: tab2.checked ?  Qt.darker(root.first_backgroundColor) : root.first_backgroundColor
            }
        }
    }

    StackLayout {
        anchors {
            top: bar.bottom
            left: root.left
            topMargin: 2
        }
        width: parent.width
        height: root.height - bar.height
        currentIndex: bar.currentIndex
        Item {
            id: inDevTab

            InstalledInDevice {
                id: installedInDevice
                anchors.fill: parent
                model: canisterInstalledModel
                onSignItemClicked: root.signItemClicked(item, row_number)

                Connections {
                    // Signal get data
                    target: Canisters
                    function onReturnCanisters(data){
                        canisterInstalledModel.clear()
                        for (var prop in data) {
                            canisterInstalledModel.append({"number": data[prop]["number"],
                                                 "med": data[prop]["med"]})
                        }
                    }
                }
            }

            ListModel {id: canisterInstalledModel}

        }

        Item {
            id: allTab

            AllAvailable {
                anchors.fill: parent
                id: allAvailable
                onSignItemClicked: root.signItemClicked(item, row_number)
            }
        }
    }
}
