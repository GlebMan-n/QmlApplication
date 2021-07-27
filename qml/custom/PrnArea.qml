import QtQuick 2.15
import QtQuick.Controls 2.15
import "../custom"
import "../panels"
import ".."
import QtQuick.XmlListModel 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    property var file_area: "qrc:/xml/prn_area.xml"
    property var backgroundColor: "#2077cd"
    property var textColor: "white"
    property var borderColor: "black"
    property int borderWidth: 2
    property var model_table_prn

    Rectangle {
        anchors.fill: parent

        ListView {
            id: lw
            clip: true
            //+ margins + bins spacing
            spacing: 3
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                bottomMargin: 3
                topMargin: 3
            }
            height: childrenRect.height
            model: model_table_prn
            delegate: numberDelegate
        }
         Component {
            id: numberDelegate

                Row {
                    height: childrenRect.height
                    width: root.width
                    spacing: 3
                    Rectangle {
                        width:  ( root.width - 6) * 1/10
                        height: prnRows.height
                        color: root.backgroundColor
                        Text {
                            anchors.centerIn: parent
                            text: day
                            color: root.textColor
                            font {
                                family: Theme.robotoMedium.name
                                pointSize: Theme.fontPointSize
                                capitalization: Font.AllUppercase
                            }
                        }
                    }

                    Rectangle {
                        width: ( root.width - 6) * 9/10
                        height: childrenRect.height
                        clip: true
                        PrnRow {
                            id: prnRows
                            anchors.fill: parent
                            model_prn_row: bins
                            backgroundColor: root.backgroundColor
                            textColor: root.textColor
                            height: childrenRect.height
                        }
                    }
                }
            }
        }
    }
