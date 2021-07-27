import QtQuick 2.15

BaseRowRectangle {
    id: root
    property var prescription;
    property string textDay;
    property var model;
    signal signalCopy
    signal signalPaste
    border.width: 0
    Row {
        spacing: root.spacing
        width: parent.width
        height: childrenRect.height
        id: root_row
        CellRectangle {
            id: day
            color: root.borderColor
            pieMenuParent: root.pieMenuParent
            //type: 1
            height: schBinRow.height != 0 ? schBinRow.height : root.baseRowHeight
            mainWidth: root.width * root.oneCellCoef + 10 - root.spacing
            CellText {
                color: root.text_color
                mainText: root.textDay
            }
        }
        PrnBinRow {
            id: schBinRow
            mainWidth: root.width * root.nineCellCoef
            height: childrenRect.height
            model: root.model
            pieMenuParent: root.pieMenuParent
            borderColor: background
            text_color: textColor
        }
    }
}
