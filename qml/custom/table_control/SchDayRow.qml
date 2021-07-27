import QtQuick 2.15

BaseRowRectangle {
    id: root
    property var prescription;
    property string textDay;
    property var model;
    signal signalCopy
    signal signalPaste
    signal signalFillRest
    border.width: 0
    function getCurrentDay()
    {
        //Read all the nested UI and collect the data
        //prepare it to save into variable
        var result = {"bins":[{"medications":[{"medi_prn":0,"medi_freq":"TID","medi_qty":1,"medi_name":"HYDROcodone Bitartrate C12A 30 MG"},{"medi_prn":0,"medi_freq":"TID","medi_qty":1,"medi_name":"Ezetimibe-Simvastatin TABS 10-20 MG"},{"medi_prn":0,"medi_freq":"TID","medi_qty":1,"medi_name":"Lisinopril TABS 20 MG"}],"time":"10:06AM","name":"Bin 1"},{"medications":[{"medi_prn":0,"medi_freq":"TID","medi_qty":1,"medi_name":"HYDROcodone Bitartrate C12A 30 MG"},{"medi_prn":0,"medi_freq":"TID","medi_qty":1,"medi_name":"Lisinopril TABS 20 MG"}],"time":"15:00PM","name":"Bin 2"},{"medications":[{"medi_prn":0,"medi_freq":"TID","medi_qty":1,"medi_name":"HYDROcodone Bitartrate C12A 30 MG"},{"medi_prn":0,"medi_freq":"TID","medi_qty":1,"medi_name":"Ezetimibe-Simvastatin TABS 10-20 MG"},{"medi_prn":0,"medi_freq":"TID","medi_qty":1,"medi_name":"Lisinopril TABS 20 MG"}],"time":"21:00PM","name":"Bin 3"}],"day":"12.15.2020"};
        return result;
    }
    Row {
        spacing: root.spacing
        width: parent.width
        height: childrenRect.height
        id: root_row

        CellRectangle {
            id: day
            color: root.borderColor
            pieMenuParent: root.pieMenuParent
            type: 1
            height: schBinRow.height != 0 ? schBinRow.height : root.baseRowHeight
            mainWidth: root.width * root.oneCellCoef + 10 - root.spacing
            onSignalShowFillRest: {
                console.log("onSignalShowFillRest")
                root.signalFillRest()
            }

            onSignalCopy: {
                root.signalCopy()
            }
            onSignalPaste: {
                root.signalPaste()
            }
            /*Rectangle {
                width: parent.width
                height: root.separatorHeight + root.borderWidth
                color: "white"
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
            }*/
            //border.width: root.separatorHeight + root.borderWidth
            //border.color: "white"
            CellText {
                color: root.text_color
                mainText: root.textDay
            }

            /*Rectangle {
                width: parent.width
                height: root.separatorHeight + root.borderWidth
                color: "white"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
            }*/
        }
        SchBinRow {
            id: schBinRow
            mainWidth: root.width * root.nineCellCoef
            height: childrenRect.height
            bin_model: root.model
            pieMenuParent: root.pieMenuParent
            borderColor: background
            text_color: textColor
        }
    }
}
