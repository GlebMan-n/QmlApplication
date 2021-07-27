import QtQuick 2.15
import "logic.js" as Logic

BaseRowRectangle {
    id: root
    property var prescription;
    signal signAddBin(var name, var time, var medications)
    property var model;
    border.width: 0

    Component.onCompleted: {
        root.signAddBin.connect(Logic.addBin)
    }

    ListView {
        objectName: "ListView"
        spacing: root.spacing
        id: view
        height: childrenRect.height
        width: root.width
        model: root.model
        delegate: binDelegate
    }

    Component {
        id: binDelegate

        Column {
            width: root.width
            height: childrenRect.height
            Row {
                id: row
                spacing: root.spacing
                width: root.width
                height: childrenRect.height
                CellRectangle {
                    //                        type: 2
                    pieMenuParent: root.pieMenuParent
                    color: root.borderColor
                    height: schMediRow.height
                    mainWidth: root.width * root.twoCellCoef - root.spacing

                    CellText {
                        text:  {
                            name = "Bin#"+(index + 1);
                            return name  }
                        fontColor: root.text_color
                    }

                }
                PrnMediRow {
                    borderColor: root.borderColor
                    text_color: root.text_color
                    id: schMediRow
                    mainWidth: root.width * root.eightCellCoef - root.spacing
                    medi: medications
                    pieMenuParent: root.pieMenuParent
                }
            }
        }
    }
}
