import QtQuick 2.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.13
import "../custom"
import ".."

Item {


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

    CustomRoundButton {
        id: manualLoad
        anchors {
            top: parent.top
            topMargin: 20
            left: sep.right
            leftMargin: 20
            right: parent.right
            rightMargin: 40
        }
        height: Theme.buttonHeight
        backgroundColor: "#c74647"
        text: qsTr("Manual load")
        imageSource: "qrc:/img/hand.svg"
        imageVisible: true
    }

    Rectangle {
        id: spike
        anchors {
            top: manualLoad.bottom
            topMargin: 20
            horizontalCenter: manualLoad.horizontalCenter
        }
        width: 20
        radius: width / 2
        height: 40
        color: "#dcdbdc"
    }
    Rectangle {
        id: btnFrame
        readonly property int btnCount: 12
        readonly property int btnHeight: 40
        readonly property int vMargin: 10
        function btnColor(index) {
            var col = "#f0f0f0"
            if ((0 <= index) && (8 > index)) {
                col = "#66c88d"
            } else if (8 === index) {
                col = "#e09192"
            }
            return col
        }
        anchors {
            top: spike.bottom
            topMargin: -spike.radius
            horizontalCenter: manualLoad.horizontalCenter
        }
        width: manualLoad.width
        radius: 20
        height: btnFrame.btnCount * btnFrame.btnHeight + (btnFrame.btnCount - 1) * btnCol.spacing + 2 * btnFrame.vMargin
        color: spike.color
        Column {
            id: btnCol
            anchors {
                top: parent.top
                topMargin: btnFrame.vMargin
                left: parent.left
                leftMargin: 10
                right: parent.right
                rightMargin: 10
            }
            spacing: 5
            Repeater {
                model: btnFrame.btnCount
                Rectangle {
                    height: btnFrame.btnHeight
                    radius: height / 2
                    width: parent.width
                    color: btnFrame.btnColor(index)
                    Rectangle {
                        anchors {
                            bottom: parent.bottom
                            bottomMargin: 4
                            horizontalCenter: parent.horizontalCenter
                        }
                        height: 8
                        width: height
                        radius: height / 2
                        color: "#80ffffff"
                    }
                }
            }
        }
    }
}
