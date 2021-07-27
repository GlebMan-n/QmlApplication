import QtQuick 2.12
import QtQuick.Controls 2.12
import ".."

ComboBox {
    id: control
    property var backgroundColor: "red"
    property var color: pressed ? Qt.darker(control.backgroundColor) : control.backgroundColor
    property int radius: 2
    property var borderColor: "white"
    property var borderWidth: visualFocus ? 2 : 1
    property var implicitWidth: 120
    property var implicitHeight: 40
    property var canvasWidth: 12
    property var canvasHeight: 8
    property var contentItemColor: "white"
    property int leftTextMargin: 15
    currentIndex: 0
  //  model: ["NODATA"]
    delegate: ItemDelegate {
        width: control.width
        contentItem: Text {
            text: name
            color: "white"
            font {
                family: Theme.robotoMedium.name
                pointSize: Theme.fontPointSize
                capitalization: Font.AllUppercase
            }
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: control.highlightedIndex === index
    }
    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: control.canvasWidth
        height: control.canvasHeight
        contextType: "2d"
        Connections {
            target: control
            function onPressedChanged() { canvas.requestPaint(); }
        }
        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = "white"
            context.fill();
        }
    }
    contentItem: Text {
        rightPadding: control.indicator.width + control.spacing
        leftPadding: control.leftTextMargin
        text: control.displayText
        font {
            family: Theme.robotoMedium.name
            pointSize: Theme.fontPointSize
            capitalization: Font.AllUppercase
        }
        color: "white"
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
    background: Rectangle {
        implicitWidth: control.implicitWidth
        implicitHeight: control.implicitHeight
        border.color: control.borderColor
        border.width: control.borderWidth
        color: control.color
        radius: control.radius
    }
    popup: Popup {
        y: control.height - 1
        width: control.width
        implicitHeight: contentItem.implicitHeight
        padding: 1
        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex
            ScrollIndicator.vertical: ScrollIndicator { }
        }
        background: Rectangle {
            border.color: "white"
            color: "#2077cd"
            radius: height / 8
        }
    }
}
