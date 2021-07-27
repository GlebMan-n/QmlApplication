import QtQuick 2.13

pragma Singleton

QtObject {
    id: control

    readonly property int fontPointSize: Qt.application.font.pointSize + 2
    readonly property int smallFontPointSize: Qt.application.font.pointSize - 2

    readonly property color headerColor: "#2b4c81"
    readonly property color textColor: "#979797"
    readonly property color textColorDark: "#2d2d2d"
    readonly property int listItemHeight: 40
    readonly property int buttonHeight: 50
    readonly property int tableHeaderHeight: 45
    readonly property color borderColor: "#dcdbdc"
    readonly property color tableHeaderColor: "#f2f2f2"

    property FontLoader robotoLight: FontLoader {
        source: "qrc:/font/Roboto-Light.ttf"
    }
    property FontLoader robotoMedium: FontLoader {
        source: "qrc:/font/Roboto-Medium.ttf"
    }
    property FontLoader robotoRegular: FontLoader {
        source: "qrc:/font/Roboto-Regular.ttf"
    }
    property FontLoader robotoThin: FontLoader {
        source: "qrc:/font/Roboto-Thin.ttf"
    }
    property font fontRobotoLight: Qt.font({family: robotoLight.name, pointSize: control.fontPointSize})
    property font fontRobotoMedium: Qt.font({family: robotoMedium.name, pointSize: control.fontPointSize})
    property font fontRobotoRegular: Qt.font({family: robotoRegular.name, pointSize: control.fontPointSize})
    property font fontRobotoThin: Qt.font({family: robotoThin.name, pointSize: control.fontPointSize})
}
