import QtQuick 2.15
import QtQml.Models 2.15
import "logic.js" as Logic

BaseRowRectangle {
    id: root
    height: childrenRect.height
    property var medi;
    border.width: 0
    signal signAddMedi(var medi_name, var medi_qty, var medi_freq, var medi_prn)
    property bool isEmpty: true
    Component.onCompleted: {
        root.signAddMedi.connect(addMedi)
    }

    function addMedi(medi_name, medi_qty, medi_freq, medi_prn) {
        medi.append({"medi_name": medi_name, "medi_qty": medi_qty,medi_freq, "medi_prn": medi_prn})
    }

    ListView {
        objectName: "ListView"
        spacing: root.spacing
        id: view
        width: root.width
        height: childrenRect.height
        model: root.medi
        delegate: mediDelegate
    }

    Component {
        id: mediDelegate
        Row {
            spacing: root.spacing
            width: root.width
            height: root.baseRowHeight
            CellRectangle {
                pieMenuParent: root.pieMenuParent
                color: root.borderColor
                id: idMedi
                height: root.baseRowHeight
                mainWidth: root.width * root.nineCellCoef
                CellText {
                    text: medi_name
                    color: root.text_color
                }
            }
            CellRectangle {
                pieMenuParent: root.parent.parent
                color: root.borderColor
                id: idMediQty
                height: root.baseRowHeight
                mainWidth: root.width * root.oneCellCoef
                CellText {
                    text: medi_qty
                    color: root.text_color
                }
            }

        }
    }
}
