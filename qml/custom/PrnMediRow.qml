import QtQuick 2.15
import QtQuick.Controls 2.15
import "../custom"
import "../panels"
import ".."
import QtQuick.XmlListModel 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    property var model_prn_row_medi
    anchors.fill: parent
    property var backgroundColor: "gray"
    property var textColor: "black"
    property var borderColor: "black"
    property int borderWidth: 2
    property int cellSpacing: 3
    height: 40*model_prn_row_medi.count

    Column {
        id: colId
        spacing: root.cellSpacing
        width: root.width
        height: 40*model_prn_row_medi.count
        Repeater {
            id: repeater
            model: model_prn_row_medi
            height: 40*model_prn_row_medi.count
            Row {
                id: rowId
                spacing: root.cellSpacing
                height: 40
                Rectangle {
                    width: ( root.width  - root.cellSpacing + 1 ) * 9/10
                    height: 40
                    color: root.backgroundColor
                    border.color: root.borderColor
                    border.width: root.borderWidth
                    Text {
                        anchors.centerIn: parent
                        text: medi_name
                        color: root.textColor
                        font {
                            family: Theme.robotoMedium.name
                            pointSize: Theme.fontPointSize
                            capitalization: Font.AllUppercase
                        }
                    }
                }

                Rectangle {
                    width: ( root.width - root.cellSpacing + 1 ) * 1/10
                    height: 40
                    color: root.backgroundColor
                    border.color: root.borderColor
                    border.width: root.borderWidth
                    Text {
                        anchors.centerIn: parent
                        text: medi_qty
                        color: root.textColor
                        font {
                            family: Theme.robotoMedium.name
                            pointSize: Theme.fontPointSize
                            capitalization: Font.AllUppercase
                        }
                    }
                }
            }
        }
    }
}
