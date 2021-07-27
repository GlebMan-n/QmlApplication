import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.XmlListModel 2.15
import "table_control"
import QtQml.Models 2.15

Rectangle {
    id: root
    clip: true
    property var backgroundColor: "#2077cd"
    property var textColor: "white"
    property var prescription_model
    signal clicked(var curInd)

    //HEADER
    PrescriptionRow {
                id: headerRow
                anchors {
                    left: parent.left
                    right: parent.right
                    top: parent.top
                    bottomMargin: 1
                    leftMargin: 6
                }
                backgroundColor: root.backgroundColor
                height: 60
                number_local: " "
                medication_local: "Medication name"
                freq_local: "Freq."
                qty_local: "Qty."
                prn_local: "PRN"
                start_local: "Start"
                stop_local: "Stop"
                textColor: root.textColor
    }

    ListView {
        id: lw
        height: root.height
        clip: true
        //+ margins + bins spacing
        //spacing: 1
        anchors {
            left: parent.left
            right: parent.right
            top: headerRow.bottom
            bottom: parent.bottom
            bottomMargin: 1
        }
        model: prescription_model
        delegate: numberDelegate
    }

    Component {
        id: numberDelegate
        PrescriptionRow {
                    anchors {
                        left: parent.left
                        right: parent.right
                        leftMargin: 6
                    }
                    backgroundColor: {index % 2 == 0 ? first_backgroundColor : second_backgroundColor}
                    height: 40
                    number_local: (index + 1)
                    medication_local: index > -1 ? prescription_model.getMedicationName(index) : "err"
                    freq_local:index > -1 ? prescription_model.getFreq(index): "err"
                    qty_local: index > -1 ?prescription_model.getQty(index): "err"
                    prn_local: index > -1 ?prescription_model.getPrn(index): "err"
                    start_local: index > -1 ?prescription_model.getStartDate(index): "err"
                    stop_local:index > -1 ? prescription_model.getStopDate(index): "err"
                    textColor: {index % 2 == 0 ? first_text_color : second_text_color}
                    onClicked: root.clicked(index)
        }
    }
} //Item
