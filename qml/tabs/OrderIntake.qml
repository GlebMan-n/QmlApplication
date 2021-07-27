import QtQuick 2.15
import QtQuick.Controls 1.4
import "../custom"
import "../panels"
import "../custom/table_control"
import ".."
import QtQuick.XmlListModel 2.15
import "../custom/table_control/logic.js" as Logic
import Devices 1.0
import Prescriptions 1.0
import AutoDosingS 1.0

Rectangle {
    id: control
    color: "white"
    signal updateIt

    onUpdateIt: {}

    Component.onCompleted: {
    }

    ListModel {
        id: patientsModel
    }

    DevicesModel {
        id: devices_model
        database: databaseWorker
        onSignDataUpdated: {
            comboMashine.currentIndex = 0;
            comboMashine.update_model();
        }
    }

    AutoDosingSch {
        id: autoDosingSch
        database: databaseWorker
        property var patientId: comboPatients.patientId
        property var deviceId: comboMashine.deviceId

        onPatientIdChanged: {
            setPatientId(patientId);
        }

        onDeviceIdChanged: {
            setDeviceId(deviceId);
        }
    }

    PrescriptionModel {
        id: prescriptions_model
        database: databaseWorker

        onSignDataUpdated: {
        }

        onSignPrescriptionSaved: {
            if(result) {
                comboMashine.update_model();
                rightPanel.clear();
                rightPanel.generic_medication_name = "";
                BinsModel.model.clear();
            }
            else {
                console.log("Prescription do not saved!")
            }
        }

    }

    RightPanel {
        id: rightPanel
        anchors {
            top: parent.top
            right: parent.right
        }
        width: 0
        visible: rightPanel.width == 300
        height: parent.height
        onSignAddPrescription: {
            databaseWorker.insertPrescription(json);
        }

        function setWidth(width){
            rightPanel.width = width;
        }
    }

    Row {
        id: row_button_1
        anchors {
            top: parent.top
            left: parent.left
            right: rightPanel.left
            leftMargin: 35
            topMargin: 15
        }
        spacing: 10
        height: childrenRect.height
        CustomComboBox {
            id: comboMashine
            editable: false
            width: 400
            height: Theme.buttonHeight
            model: devices_model
            displayText: devices_model.getDeviceName(comboMashine.currentIndex)
            currentIndex: -1
            backgroundColor: "#2077cd"
            radius: height / 2
            property var deviceId: devices_model.getDeviceId(comboMashine.currentIndex);
            onActivated: {
                update_model();
            }
            onDeviceIdChanged: prescriptions_model.setDeviceId(deviceId);
            function update_model() {
                var curIndexPat = comboPatients.currentIndex;
                var curIndexDev = comboMashine.currentIndex;
                patientsModel.clear();
                var patients = databaseWorker.getAllPatientsForDevice(comboMashine.deviceId);
                if(patients.length === 0) {
                    prescriptions_model.clear();
                    return;
                }
                for (const patient of patients){
                    patientsModel.append({ name: patient});
                }
                comboPatients.currentIndex = curIndexPat === -1 ? 0 : curIndexPat;
                comboMashine.currentIndex = curIndexDev === -1 ? 0 : curIndexDev;
                comboPatients.patientId = databaseWorker.getPatientIdByFullName(patientsModel.get(comboPatients.currentIndex).name)
            }
        }

        CustomComboBox {
            id: comboPatients
            editable: false
            width: 200
            height: Theme.buttonHeight
            model: patientsModel
            currentIndex: -1
            backgroundColor: "#2077cd"
            displayText: patientsModel.count > 0 ? patientsModel.get(currentIndex).name : "empty"
            radius: height / 2
            onActivated: {
                patientId = databaseWorker.getPatientIdByFullName(patientsModel.get(comboPatients.currentIndex).name);
            }
            onPatientIdChanged: prescriptions_model.setPatientId(comboPatients.patientId);
            property var patientId
            property var planeModel
            property var planeModel_prn
        }
        CustomRoundButton {
            id: shipToEmilia
            height: Theme.buttonHeight
            width: 250
            backgroundColor: "#2077cd"
            text: qsTr("Ship to Emilia for loading")
            imageSource: "qrc:/img/ShipTo.svg"
            imageVisible: true
            onClicked: {
                var json = "json data to ship";
                databaseWorker.shipToEmilia(json);
            }
        }
    }

    Row {
        spacing: 10
        id: row_button_2
        anchors {
            top: row_button_1.bottom
            left: parent.left
            right: rightPanel.left
            leftMargin: 35
        }
        height: childrenRect.height

        CustomRoundButton {
            id: startLoading
            height: shipToEmilia.height
            width: shipToEmilia.width
            backgroundColor: "#c74647"
            text: qsTr("Add new prescription")
            imageSource: "qrc:/img/AddNew.svg"
            imageVisible: true
            checkable: true
            onClicked: {
                rightPanel.width = rightPanel.width == 300 ?  0 : 300

            }
        }

        CustomRoundButton {
            id: saveOrder

            height: startLoading.height
            width: startLoading.width
            backgroundColor: "#c74647"
            text: qsTr("Save orders")
            imageSource: "qrc:/img/check.svg"
            imageVisible: true
            checkable: true
            onClicked: {
                var jsonSCH = JSON.stringify(BinsModel.model.get(1));
                var jsonPRN = JSON.stringify(BinsModel.model.get(0));
                prescriptions_model.database.saveOrders(jsonSCH,jsonPRN,comboMashine.deviceId,comboPatients.patientId);
            }
        }
        CustomRoundButton {
            id: splitDoses
            height: saveOrder.height
            width: saveOrder.width
            backgroundColor: "#c74647"
            text: qsTr("Auto Dosing")
            imageSource: "qrc:/img/Vials.svg"
            imageVisible: true
            checkable: true
            onClicked: {
                BinsModel.model.clear();
                autoDosingSch.splitDoses();
                var prn = autoDosingSch.getModelPrn();
                var sch = autoDosingSch.getModelSch();
                BinsModel.model.set(0,JSON.parse(sch));
                BinsModel.model.set(1,JSON.parse(prn));

                dosesArea.model_doses_area_sch = BinsModel.model.get(0).plane;
                dosesArea.model_doses_area_prn = BinsModel.model.get(1).plane;
            }
        }
    }

    Column {
        objectName: "Column"
        id: col_tables
        anchors {
            top: row_button_2.bottom
            bottom: parent.bottom
            left: parent.left
            right: rightPanel.left
            topMargin: 10
            leftMargin: 10
        }
        leftPadding: 20
        rightPadding:  20

        property color main_color: "#2077cd"
        property color textColor: "white"
        PrescriptionArea {
            id: prescriptionArea
            width: parent.width - 40
            height: parent.height/3
            backgroundColor: col_tables.main_color
            textColor: col_tables.textColor
            prescription_model: prescriptions_model
            onClicked: {
                rightPanel.patient_id = comboPatients.patientId;
                rightPanel.device_id = comboMashine.deviceId;
                rightPanel.current_prescription_id = prescriptions_model.getPrescription(curInd);
                rightPanel.is_prn = prescriptions_model.getPrn(curInd);
                rightPanel.patient_name = comboPatients.displayText;
                rightPanel.medication_name = prescriptions_model.getMedicationName(curInd);
                rightPanel.frequency = prescriptions_model.getFreq(curInd);
                rightPanel.prescribed_qty = prescriptions_model.getQty(curInd);
                rightPanel.refill = prescriptions_model.getRefill(curInd);
                rightPanel.physician_name = prescriptions_model.getPhysicianName(curInd);
                rightPanel.date_written = prescriptions_model.getDateWritten(curInd);
                rightPanel.discription = prescriptions_model.getDescription(curInd);
                rightPanel.disp_as_written =prescriptions_model.getMDispAsWritten(curInd);
                rightPanel.dateBegin = prescriptions_model.getStartDate(curInd);
                rightPanel.dateEnd = prescriptions_model.getStopDate(curInd);
            }
        }

        DosesArea {
            objectName: "DosesArea"
            id: dosesArea
            width: parent.width - 40
            height: parent.height - prescriptionArea.height
            backgroundColor: col_tables.main_color
            textColor: col_tables.textColor
        }
    }
}
