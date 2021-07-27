import QtQuick 2.15
import "logic.js" as Logic
import QtQuick.Dialogs 1.1
import QtQuick.Controls 2.15

import "../../custom"
import "../../panels"
import "../../"
import "../table_control"

BaseRowRectangle {
    id: root
    height: childrenRect.height
    property var model_table_sch
    property bool is_prn: false

    ListView {
        objectName: "ListView"
        id: list_view
        property var copyDay
        clip: false
        spacing: 0
        width: parent.width
        height: parent.height
        model: model_table_sch
        delegate: dayDelegate
        header: headerSch
        headerPositioning: ListView.OverlayHeader
    }

    Component {
        id: dayDelegate
        Row {
            property color background: {index % 2 == 0 ? root.first_backgroundColor : root.second_backgroundColor}
            property color textColor: {index % 2 == 0 ? root.first_text_color : root.second_text_color}
            id: frame
            width: list_view.width
            height: childrenRect.height
            SchDayRow {
                pieMenuParent: root.pieMenuParent
                borderColor: background
                text_color: textColor
                mainWidth: frame.width - (frame.leftPadding + frame.rightPadding)
                height: childrenRect.height
                textDay: day
                model: model_table_sch.get(index).bins

                onSignalFillRest: {
                    var parentModel = root.model_table_sch;
                    dialog.date = parentModel.get(index).day
                    dialog.currentIndex = index
                    dialog.open();

                }

                onSignalCopy: {
                    BinsModel.copyPasteDay = root.model_table_sch.get(index);

                }
                onSignalPaste: {
                    if(BinsModel.copyPasteDay === null) {

                        return;
                    }
                    if(!Logic.check(BinsModel.copyPasteDay, root.model_table_sch.get(index))) {

                        return;
                    }
                    var object_copied = JSON.parse(JSON.stringify(BinsModel.copyPasteDay));
                    object_copied.day = root.model_table_sch.get(index).day;
                    root.model_table_sch.set(index,object_copied);

                }
            }
        }
    }

    Component {
        id: headerSch
        Column {
            height: childrenRect.height
            width: list_view.width
            z:2
            Row {
                height: 40
                width: list_view.width
                spacing: 2
                Rectangle {
                    color: root.first_backgroundColor
                    id: date_header
                    height: 40
                    width: root.width * 0.105

                    CellText {
                        anchors.fill: parent
                        text: "Date"
                    }
                }
                Rectangle {
                    color: root.first_backgroundColor
                    id: bin_header
                    height: 40
                    width: root.width * 0.088
                    CellText {
                        anchors.fill: parent
                        text: "Bin"
                    }
                }
                Rectangle {
                    color: root.first_backgroundColor
                    id: time_header
                    height: 40
                    width: root.width * 0.088
                    CellText {
                        anchors.fill: parent
                        text: "Time"
                    }
                }
                Rectangle {
                    color: root.first_backgroundColor
                    id: medicion_header
                    height: 40
                    width: root.width - (qty_header.width + time_header.width + bin_header.width + date_header.width)
                    CellText {
                        anchors.fill: parent
                        text: "Medication"
                    }
                }
                Rectangle {
                    color: root.first_backgroundColor
                    id: qty_header
                    height: 40
                    width: root.width * 0.073
                    CellText {
                        anchors.fill: parent
                        text: "quantity"
                    }
                }
            }
            Rectangle {
                width: parent.width
                height: 1
                color: "white"
            }
        }
    }
    Dialog {
        id: dialog
        x: parent.width /2 - dialog.width /2
        y: parent.height /2 - dialog.height /2
        parent: root.parent.parent.parent.parent.parent.parent.parent.parent
        property alias date:dateBegin.text
        property var currentIndex: -1
        modal: true
        title: "Fill the rest till date"
        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: {

                var parentModel = root.model_table_sch;
                var templateItem = JSON.parse((JSON.stringify(parentModel.get(currentIndex))));
            console.log("currentIndex ",currentIndex," parentModel.count ", parentModel.count)
                for(var i = currentIndex+1; i < parentModel.count; ++i) {
                    templateItem.day = parentModel.get(i).day
                    parentModel.set(i,templateItem);
                    if(parentModel.get(i).day === dialog.date)
                        break;
                }
        }

        onRejected: console.log("Cancel clicked")
        contentItem: Item {
            implicitWidth: 400
            implicitHeight: 100
            CustomRoundTextField {
                id: dateBegin
                textColor: "white"
                anchors {
                    top: parent.top
                    margins: 20
                    left: parent.left
                    right: parent.right
                }
                height: 80
                text: dialog.date
                placeholderText: qsTr("enter till date")
                frameHeight: Theme.buttonHeight
                onTextChanged: {
                    dialog.date = text
                    console.log(text)
                }
            }
        }
    }
}
