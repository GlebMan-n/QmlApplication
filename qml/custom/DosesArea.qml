import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./table_control"

Item {
    id:root
    property var backgroundColor: "#2077cd"
    property var textColor: "white"
    property var sch_file: "qrc:/xml/sch_area_1.xml"
    property var prn_file: "qrc:/xml/prn_area_1.xml"
    signal splitToDoses
    property var model_doses_area_sch
    property var model_doses_area_prn

    TabBar {
        id: bar
        anchors.leftMargin: 7
        anchors.left: parent.left
        anchors.right: parent.right

        TabButton {
            id: tab1
            text: qsTr("Scheduled Doses")
            onClicked: stackLayout.currentIndex = 0
            contentItem: Text {
                text: tab1.text
                font: tab1.font
                opacity: enabled ? 1.0 : 0.3
                color: tab1.pressed ? Qt.darker(root.textColor) : root.textColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                radius: 2
                color: tab1.pressed ?  Qt.darker(root.backgroundColor) : root.backgroundColor
            }
        }
        TabButton {
            id: tab2
            onClicked: stackLayout.currentIndex = 1
            text: qsTr("PRN Doses")
            contentItem: Text {
                text: tab2.text
                font: tab2.font
                opacity: enabled ? 1.0 : 0.3
                color: tab2.pressed ?  Qt.darker(root.textColor) : root.textColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                radius: 2
                color: tab2.pressed ?  Qt.darker(root.backgroundColor) : root.backgroundColor
            }
        }
    }

    StackLayout {
        id: stackLayout
        objectName: "StackLayout"
        anchors {
            top: bar.bottom
            left: bar.left
            right: bar.right
            bottom: parent.bottom
        }

        TableSchControlRectangle {
            objectName: "TableSchControlRectangle"
            pieMenuParent: parent
            clip: true
            id: schArea
            anchors.fill: parent
            model_table_sch: root.model_doses_area_sch
        }

        TablePrnControlRectangle {
            pieMenuParent: parent
            clip: true
            id: prnArea
            anchors.fill: parent
            model_table_prn: root.model_doses_area_prn
        }
    }
}
