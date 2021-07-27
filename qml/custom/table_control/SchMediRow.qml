import QtQuick 2.15
import QtQml.Models 2.15
import "logic.js" as Logic

BaseRowRectangle {
    id: root
    height: childrenRect.height
    property var medi;
    property var parentModel;
    property var currentIndex;
    signal signAddMedi(var medi_name, var medi_qty, var medi_freq, var medi_prn)
    property bool isEmpty: true
    border.width: 0
    signal removeMe
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
                type: 4
                pieMenuParent: root.pieMenuParent
                color: root.borderColor
                id: idMedi
                height: root.baseRowHeight
                mainWidth: root.width * root.nineCellCoef - root.spacing
                CellText {
                    text: medi_name
                    color: root.text_color
                }
                onSignalCut: {
                    BinsModel.cutPasteMediModel = view.model;
                    BinsModel.cutPasteMedi = JSON.parse(JSON.stringify(view.model.get(index)));
                    BinsModel.cutPasteMediIndex = index
                    view.model.remove(index,1);
                     if(view.model.count === 0)
                         root.parentModel.remove(root.currentIndex,1);
                }

                onSignalPaste: {
                    var target_object = BinsModel.cutPasteMedi
                    var target_model = BinsModel.cutPasteMediModel

                    if(target_object === undefined || target_model === undefined)
                        return;
                    var target_object_copy = JSON.parse(JSON.stringify(target_object));
                    if(target_object_copy === undefined)
                        return;
                    if(view.model.get(index).medi_name === "empty")
                        root.medi.set(index,target_object_copy);
                    else
                        root.medi.append(target_object_copy);
                }
            }

            CellRectangle {
                pieMenuParent: root.parent.parent
                color: root.borderColor
                id: idMediQty
                height: root.baseRowHeight
                mainWidth: root.width * root.oneCellCoef - root.spacing
                CellText {
                    text: medi_qty
                    color: root.text_color
                }
            }
        }
    }
}
