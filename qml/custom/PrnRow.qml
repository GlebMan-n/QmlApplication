import QtQuick 2.15
import QtQuick.Controls 2.15
import "../custom"
import "../panels"
import ".."
import QtQuick.XmlListModel 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    property var model_prn_row
    anchors.fill: parent
    property var backgroundColor: "gray"
    property var textColor: "black"
    property var borderColor: "black"
    property int borderWidth: 2
    property int cellSpacing: 3
    height: childrenRect.height

    Column {
        spacing: root.cellSpacing
        width: root.width
        height: childrenRect.height
        Repeater {
            id: col_repeater
            model: model_prn_row
            height: childrenRect.height
            Row {
                spacing: root.cellSpacing
                height: childrenRect.height
                Rectangle {
                    id: dose_id
                    width: ( root.width - root.cellSpacing * 2 ) * 1/10
                    height: rect.height
                    color: root.backgroundColor
                    border.color: root.borderColor
                    border.width: root.borderWidth
                    Text {
                        anchors.centerIn: parent
                        text: name + index
                        color: root.textColor
                        font {
                            family: Theme.robotoMedium.name
                            pointSize: Theme.fontPointSize
                            capitalization: Font.AllUppercase
                        }
                    }
                    Component.onCompleted: {
                        root.sumHeight = col_repeater.count * 40
                    }
                }

                Rectangle {
                    id: rect
                    width: ( root.width - root.cellSpacing * 2 ) * 9/10
                    height: mediPrn.height
                    PrnMediRow {
                        id: mediPrn
                        height: 40 * medications.count
                        width: parent.width
                        backgroundColor: root.backgroundColor
                        textColor: root.textColor
                        model_prn_row_medi: medications
                    }
                }
            }
        }
    }
}
