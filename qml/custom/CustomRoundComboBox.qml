import QtQuick 2.13
import QtQuick.Controls 2.13
import ".."

Item {
    id: control
    property alias placeholderText: controlTitle.text
    property alias model: combo.model
    property alias frameHeight: controlFrame.height
    property color backgroundColor: "transparent"
    height: childrenRect.height
    Rectangle {
        id: controlFrame

        border {
            width: 1
            color: "#b5b5b5"
        }
        color: "transparent"
        radius: height / 2
        width: parent.width

        ComboBox {
            id: combo
            background: Rectangle {
                radius: control.height
                color: control.pressed ? Qt.darker(control.backgroundColor) : control.backgroundColor
            }
            anchors {
                left: parent.left
                leftMargin: 15
                right: parent.right
                rightMargin: 15
                verticalCenter: parent.verticalCenter
            }
            font: Theme.fontRobotoMedium
            height: controlFrame.height - 2
            contentItem: Text {
                leftPadding: 0
                rightPadding: combo.indicator.width + control.spacing

                text: combo.displayText
                font: combo.font
                color: controlTitle.color
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            indicator: Canvas {
                id: canvas
                x: combo.width - width - combo.rightPadding
                y: combo.topPadding + (combo.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                Connections {
                    target: combo
                    function onPressedChanged() {
                        canvas.requestPaint()
                    }
                }

                onPaint: {
                    context.reset()
                    context.moveTo(0, 0)
                    context.lineTo(width, 0)
                    context.lineTo(width / 2, height)
                    context.closePath()
                    context.fillStyle = Theme.textColorDark
                    context.fill()
                }
            }
        }

    }
    Label {
        id: controlTitle
        anchors {
            top: controlFrame.bottom
            topMargin: 5
            left: controlFrame.left
            leftMargin: 15
        }
        color: Theme.textColorDark
        text: control.placeholderText
        font {
            family: Theme.robotoMedium.name
            pointSize: Theme.fontPointSize - 4
        }
    }
}
