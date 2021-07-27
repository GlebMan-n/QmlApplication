import QtQuick 2.13
import QtQuick.Controls 2.13
import "../custom"
import "../panels"
import ".."

Rectangle {
    id: control

    readonly property int cols: 20
    readonly property int rows: controller.cartrigeCount / control.cols + (0 === controller.cartrigeCount % control.cols ? 0 : 1)
    readonly property int mainWidth: control.width - rightPanel.width - leftRowLabel.width - control.leftRowLabelHMargin - control.controlFlowHMargin - control.controlFlickableHMargin
    readonly property real itemWidth: (control.mainWidth - (control.cols - 1) * controlFlow.spacing)/control.cols
    readonly property int controlFlickableHMargin: 5
    readonly property int leftRowLabelHMargin: 10
    readonly property int controlFlowHMargin: 10

    color: "white"

    CartrigeRightPanel {
        id: rightPanel
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }
        width: 250
    }

    Row {
        id: colLabel
        anchors {
            top: parent.top
            topMargin: 15
            left: controlFlickable.left
            leftMargin: control.leftRowLabelHMargin + control.controlFlowHMargin
        }
        width: control.mainWidth
        z: 3
        spacing: 5
        Repeater {
            model: control.cols
            Label {
                width: control.itemWidth
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                text: index + 1
                font {
                    family: Theme.robotoMedium.name
                    pointSize: Theme.smallFontPointSize
                }
                color: "black"
            }
        }
    }
    Flickable {
        id: controlFlickable
        anchors {
            top: colLabel.bottom
            topMargin: -5
            left: parent.left
            leftMargin: control.controlFlickableHMargin
            right: rightPanel.left
            rightMargin: control.controlFlickableHMargin
            bottom: parent.bottom
        }
        contentWidth: controlFlow.width
        contentHeight: controlFlow.height
        clip: true
        boundsMovement: Flickable.StopAtBounds
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.VerticalFlick
        ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }
        Flow {
            id: controlFlow
            anchors {
                left: leftRowLabel.left
                leftMargin: control.controlFlowHMargin
            }
            width: control.mainWidth + 5
            spacing: 5
            Repeater {
                model: controller.cartrigeCount
                Item {
                    width: control.itemWidth
                    height: width
                    Image {
                        anchors.centerIn: parent
                        width: 0.9 * parent.width
                        height: width
                        mipmap: true
                        fillMode: Image.PreserveAspectFit
                        source: controller.cartrigeIcon(index)
                    }
                }
            }
        } //flow
        Column {
            id: leftRowLabel
            anchors {
                top: controlFlow.top
                left: parent.left
                leftMargin: control.leftRowLabelHMargin
                bottom: controlFlow.bottom
            }
            z: 3
            spacing: 5
            Repeater {
                model: control.rows
                Label {
                    height: control.itemWidth
                    clip: true
                    verticalAlignment: Text.AlignVCenter
                    text: index + 1
                    font {
                        family: Theme.robotoMedium.name
                        pointSize: Theme.smallFontPointSize
                    }
                    color: "black"
                }
            }
        }
    }
}
