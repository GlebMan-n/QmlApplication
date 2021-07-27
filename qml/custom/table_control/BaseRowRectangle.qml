import QtQuick 2.15

Rectangle {
    id: root
    property Item pieMenuParent
    property color borderColor: "white"
    property int borderWidth: 1

    property int separatorHeight: 5

    border.width: borderWidth
    border.color: borderColor

    property color first_backgroundColor: "#2077cd"
    property color second_backgroundColor: Qt.darker(root.first_backgroundColor)

    property color text_color: "white"
    property color first_text_color: "white"
    property color second_text_color: "white"

    property int counter: 0
    property var srt: ""
    property int spacing: 0
    property int baseRowHeight: 40
    property int oneCellMinimumWidth: 80

    property int dayCount: 1
    property int binCount: 4
    property int maxMediBinCount: 3

    //margins for all the control
    property int mainMargin: 40

    property real oneCellCoef: 1/10
    property real twoCellCoef: 2/10
    property real threeCellCoef: 3/10
    property real sevenCellCoef: 7/10
    property real eightCellCoef: 8/10
    property real nineCellCoef: 9/10

    property int mainWidth;
    width: mainWidth
}
