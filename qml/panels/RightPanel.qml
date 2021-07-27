import QtQuick 2.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.13
import "../custom"
import ".."

Flickable {
    id: root
    property var patient_id: -1
    property var device_id: -1
    property var current_prescription_id: -1
    property alias patient_name: patientName.text
    property alias medication_name: medicationName.text
    property alias frequency: frequency.text
    property alias is_prn: isPrn.checked
    property alias prescribed_qty: prescrQuantity.text
    property alias refill: refills.text
    property alias physician_name: physician.text
    property alias date_written: dateWritten.text
    property alias discription: comment.text
    property alias disp_as_written: dispAsWritten.text
    property alias dateBegin: dateBegin.text
    property alias dateEnd: dateEnd.text
    signal signAddPrescription(var json)
    clip: true
    contentHeight: content.height
    ScrollBar.vertical: ScrollBar { id: vbar; active: true}
    focus: true
    Keys.onUpPressed: ScrollBar.decrease()
    Keys.onDownPressed: ScrollBar.increase()
    function clear() {
        medication_name.text = "";
        dateBegin.text = "";
        dateEnd.text = "";
        dispAsWritten.text = "";
        comment.text = "";
        dateWritten.text = "";
        physician.text = "";
        refills.text = "";
        prescrQuantity.text = "";
        isPrn.checked = false;
        frequency.text = "";
    }

    function toJson() {
        console.log("is_prn:", isPrn.checked)
        let prescription = {
            patient_id: root.patient_id,
            device_id: root.device_id,
            patient_name: patientName.text,
            medication_name: medicationName.text,
            frequency: frequency.text,
            is_prn: isPrn.checked ? 1 : 0,
            prescribed_qty: prescrQuantity.text,
            refill: refills.text,
            physician_name: physician.text,
            date_written: dateWritten.text,
            discription: comment.text,
            start_date: dateBegin.text,
            stop_date: dateEnd.text,
            daw: dispAsWritten.text
        }
        let json = JSON.stringify(prescription);
        console.log(JSON.stringify(json));
        return json;
    }

    Item {
        id: content
        height: childrenRect.height
        width: parent.width
        Rectangle {
            id: sep
            anchors {
                top: parent.top
                left: parent.left
            }
            width: 10
            height: parent.height
            LinearGradient {
                anchors.fill: parent
                start: Qt.point(0, 0)
                end: Qt.point(parent.width, 0)
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "white" }
                    GradientStop { position: 1.0; color: "#cdcdcd" }
                }
            }
        }

        Rectangle {
            anchors {
                top: parent.top
                left: sep.right
                right: parent.right
            }
            height: parent.height
            color: "#f0f0f0"
        }

        Image {
            id: hdrImage
            anchors {
                top: parent.top
                topMargin: 30
                left: parent.left
                leftMargin: 20
            }
            height: 25
            width: height
            fillMode: Image.PreserveAspectFit
            mipmap: true
            source: "qrc:/img/OrderIntakeCur.svg"
        }

        Label {
            id: prescrDetails
            anchors {
                top: parent.top
                topMargin: 20
                left: hdrImage.right
                leftMargin: 10
            }
            font {
                family: Theme.robotoMedium.name
                pointSize: Theme.fontPointSize
                capitalization: Font.AllUppercase
            }
            height: Theme.buttonHeight
            verticalAlignment: Text.AlignVCenter
            text: qsTr("Prescription details")
            color: "#454545"
        }

        CustomRoundButton {
            id: editBtn
            anchors {
                top: prescrDetails.bottom
                topMargin: 20
                left: hdrImage.left
                leftMargin: 10
            }
            backgroundColor: "#277db7"
            imageVisible: false
            text: qsTr("Add")
            height: Theme.buttonHeight
            width: 80
            onClicked: root.signAddPrescription(root.toJson());
        }

        CustomRoundTextField {
            id: patientName
            anchors {
                top: editBtn.bottom
                topMargin: 20
                left: editBtn.left
                right: parent.right
                rightMargin: 10
            }
            onTextChanged: {
                root.patient_name = text
            }

            placeholderText: qsTr("Patient Name")
            text: root.patient_name// qsTr("David Scott")
            frameHeight: Theme.buttonHeight
        }

        CustomRoundTextField {
            id: dateBegin
            anchors {
                top: patientName.bottom
                topMargin: 20
                left: patientName.left
                right: parent.right
                rightMargin: 10
            }
            height: 80
            text: root.dateBegin
            placeholderText: qsTr("Date begin")
            frameHeight: Theme.buttonHeight
            onTextChanged: {
                root.dateBegin = text
            }
        }

        CustomRoundTextField {
            id: dateEnd
            anchors {
                top: dateBegin.bottom
                topMargin: 20
                left: patientName.left
                right: parent.right
                rightMargin: 10
            }
            height: 80
            text: root.dateEnd
            placeholderText: qsTr("Date end")
            frameHeight: Theme.buttonHeight
            onTextChanged: {
                root.dateEnd = text
            }
        }

        CustomRoundTextField {
            id: medicationName
            anchors {
                top: dateEnd.bottom
                topMargin: 20
                left: patientName.left
                right: patientName.right
            }
            onTextChanged: {
                root.medication_name = text
            }
            placeholderText: qsTr("Medication Name")

            text: root.medication_name// qsTr("Zomig TABS 5MG")
            frameHeight: Theme.buttonHeight
        }

        CustomRoundTextField {
            id: frequency
            anchors {
                top: medicationName.bottom
                topMargin: 20
                left: patientName.left
                right: patientName.right
            }
            onTextChanged: {
                root.frequency = text
            }
            placeholderText: qsTr("Frequency")
            text: root.frequency;
            frameHeight: Theme.buttonHeight
        }

        CustomCheckBoxN {
            id: isPrn
            anchors {
                top: frequency.bottom
                topMargin: 10
                left: patientName.left
                leftMargin: 20
                right: patientName.right
            }
            onTextChanged: {
                root.is_prn = isPrn.checked
            }
            text: qsTr("is PRN")
            checked: root.is_prn

        }

        CustomRoundTextField {
            id: prescrQuantity
            anchors {
                top: isPrn.bottom
                topMargin: 10
                left: patientName.left
            }
            onTextChanged: {
                root.prescribed_qty = text
            }
            width: 0.6 * frequency.width
            placeholderText: qsTr("Prescribed quantity")
            text: root.prescribed_qty
            frameHeight: Theme.buttonHeight
        }

        CustomRoundTextField {
            id: refills
            anchors {
                top: prescrQuantity.top
                left: prescrQuantity.right
                leftMargin: 5
                right: patientName.right
            }
            onTextChanged: {
                root.refill = text
            }
            placeholderText: qsTr("Refills")
            text: root.refill
            frameHeight: Theme.buttonHeight
        }

        CustomRoundTextField {
            id: dispAsWritten
            anchors {
                top: prescrQuantity.bottom
                topMargin: 20
                left: patientName.left
                right: patientName.right
            }
            onTextChanged: {
                root.disp_as_written = text
            }
            placeholderText: qsTr("Dispense as written")
            text: root.disp_as_written
            frameHeight: Theme.buttonHeight
        }

        CustomRoundTextField {
            id: physician
            anchors {
                top: dispAsWritten.bottom
                topMargin: 20
                left: patientName.left
                right: patientName.right
            }
            onTextChanged: {
                root.physician_name = text
            }
            placeholderText: qsTr("Physician")
            text: root.physician_name
            frameHeight: Theme.buttonHeight
        }

        CustomRoundTextField {
            id: dateWritten
            anchors {
                top: physician.bottom
                topMargin: 20
                left: patientName.left
                right: patientName.right
            }
            onTextChanged: {
                root.date_written = text
            }
            placeholderText: qsTr("Date written")
            text: root.date_written
            frameHeight: Theme.buttonHeight
        }

        CustomRoundTextArea {
            id: comment
            anchors {
                top: dateWritten.bottom
                topMargin: 20
                left: patientName.left
                right: patientName.right
            }
            onTextChanged: {
                root.discription = text
            }
            placeholderText: qsTr("Comment")
            text: root.discription
            frameHeight: 2.5 * Theme.buttonHeight
        }
    }

}
