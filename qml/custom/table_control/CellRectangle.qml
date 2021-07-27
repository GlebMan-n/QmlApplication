import QtQuick 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

BaseRowRectangle {
    objectName: "CellRectangle"
    id: root
    color:  root.first_backgroundColor
    border {
        color: isChecked ? Qt.darker(color) : root.borderColor
        width: isChecked ? 6 : root.borderWidth
    }
    //1 - date
    //2 - bin
    //3 - time
    //4 - medi
    property int type: 0
    property bool isChecked: false
    property bool isCheckable: false

    signal signalCopy
    signal signalPaste
    signal signalAdd
    signal signalDel
    signal signalUp
    signal signalCut
    signal signalDown
    signal signalChecked
    signal signalShowFillRest;

    onSignalChecked: {
        if(!isCheckable)
            return;
        root.isChecked = !root.isChecked
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        Component.onCompleted: clicked.connect(root.signalChecked)
    }
}
