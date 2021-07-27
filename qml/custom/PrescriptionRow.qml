import QtQuick 2.15
import ".."

Item {
    id:root
    property color first_backgroundColor: "#2077cd"
    property color second_backgroundColor: Qt.darker(root.first_backgroundColor)
    property color first_text_color: "white"
    property color second_text_color: "white"
    property var number_local: "1"
    property var medication_local: "HYDROcodone Bitartrate C12A 30 MG"
    property var freq_local: "BID"
    property var qty_local: "1"
    property var prn_local: 0
    property var start_local: "12.15.2020"
    property var stop_local: "12.19.2020"
    property int rowHeight: 40
    property var backgroundColor: "gray"
    property var textColor: "black"
    property var borderColor: "white"
    property int borderWidth: 1
    signal clicked
    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }

    Row {
        width: parent.width
        Rectangle {
            id: number
            Text {
                anchors.centerIn: parent
                text: root.number_local
                color: root.textColor
                font {
                    family: Theme.robotoMedium.name
                    pointSize: Theme.fontPointSize
                    capitalization: Font.AllUppercase
                }
            }
            width: root.width * 1 / 28
            height: 40
            color: root.backgroundColor
            border.color: root.borderColor
            border.width: root.borderWidth
        }
        Rectangle {
            id: medi
            Text {
                anchors.centerIn: parent
                text: root.medication_local
                color: root.textColor
                font {
                    family: Theme.robotoMedium.name
                    pointSize: Theme.fontPointSize
                    capitalization: Font.AllUppercase
                }
            }
            width: parent.width - ( number.width  + freq.width + prn.width + qty.width + start.width + stop.width )
            height: 40
            color: root.backgroundColor
            border.color: root.borderColor
            border.width: root.borderWidth
        }

        Rectangle {
            id: freq
            Text {
                color: root.textColor
                anchors.centerIn: parent
                text: root.freq_local
                font {
                    family: Theme.robotoMedium.name
                    pointSize: Theme.fontPointSize
                    capitalization: Font.AllUppercase
                }
            }
            width: root.width * 1/14;
            height: 40
            color: root.backgroundColor
            border.color: root.borderColor
            border.width: root.borderWidth
        }
        Rectangle {
            id: qty
            Text {
                color: root.textColor
                text: root.qty_local
                anchors.centerIn: parent
                font {
                    family: Theme.robotoMedium.name
                    pointSize: Theme.fontPointSize
                    capitalization: Font.AllUppercase
                }
            }
            width: root.width * 1/14;
            height: 40
            color: root.backgroundColor
            border.color: root.borderColor
            border.width: root.borderWidth
        }
        Rectangle {
            id: prn
            Text {
                visible: (root.prn_local != 0 && root.prn_local != 1)
                text: root.prn_local
                anchors.centerIn: parent
                color: root.textColor
                font {
                    family: Theme.robotoMedium.name
                    pointSize: Theme.fontPointSize
                    capitalization: Font.AllUppercase
                }
            }
            CustomCheckBox {
                visible: root.prn_local === 0 || root.prn_local === 1
                checked: root.prn_local === 1
                enabled: false
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }

            }

            width: root.width * 1/28;
            height: 40
            color: root.backgroundColor
            border.color: root.borderColor
            border.width: root.borderWidth
        }
        Rectangle {
            id: start
            Text {
                color: root.textColor
                text: root.start_local
                anchors.centerIn: parent
                font {
                    family: Theme.robotoMedium.name
                    pointSize: Theme.fontPointSize
                    capitalization: Font.AllUppercase
                }
            }
            width: root.width * 1/14;
            height: 40
            color: root.backgroundColor
            border.color: root.borderColor
            border.width: root.borderWidth
        }
        Rectangle {
            id: stop
            Text {
                color: root.textColor
                text: root.stop_local
                anchors.centerIn: parent
                font {
                    family: Theme.robotoMedium.name
                    pointSize: Theme.fontPointSize
                    capitalization: Font.AllUppercase
                }
            }
            width: root.width * 1/14;
            height: 40
            color: root.backgroundColor
            border.color: root.borderColor
            border.width: root.borderWidth
        }
    }
}
