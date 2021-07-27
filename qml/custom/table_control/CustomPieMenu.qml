import QtQuick 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../../"

PieMenu {
    id: root
    property CellRectangle connectedItem

    property var type: connectedItem === null ? 0 : connectedItem.type
    property string addButtonSource: "qrc:/img/table_imgs/add.svg"
    property string delButtonSource: "qrc:/img/table_imgs/del.svg"
    property string copyButtonSource: "qrc:/img/table_imgs/copy.svg"
    property string pasteButtonSource: "qrc:/img/table_imgs/paste.svg"
    property string upButtonSource: "qrc:/img/table_imgs/up.svg"
    property string downButtonSource: "qrc:/img/table_imgs/down.svg"
    property string cutButtonSource: "qrc:/img/table_imgs/cut.svg"
    property string asTemplate: "qrc:/img/logo.svg"
    property color pieMenuBackgroundColor: "#d8d325"
    property color pieMenuSelectionColor: "#95a9ce"
    property color pieMenuShadowColor: "#95cec8"
    property real pieMenuShadowSpread: 0.5
    property color pieMenuTextColor: "white"
    property color pieMenuTextStyleColor: "black"

    signal fillRest
    style: PieMenuStyle{
        backgroundColor: root.pieMenuBackgroundColor
        selectionColor: root.pieMenuSelectionColor
        shadowColor: root.pieMenuShadowColor
        shadowSpread: root.pieMenuShadowSpread
        title: Text {
            font.pointSize: 20
            text: styleData.text
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: root.pieMenuTextColor
            styleColor: "black"
            antialiasing: true
            style: Text.Outline;
            font {
                family: Theme.robotoMedium.name
                pointSize: Theme.fontPointSize
                capitalization: Font.AllUppercase
            }
        }
    }
    MenuItem {
        visible: pieMenu.type === 1
        text: "Template"
        iconSource: root.asTemplate
        //shortcut: StandardKey.Copy
        onTriggered: {
            if(pieMenu.connectedItem === null)
            {
                return;
            }
            pieMenu.connectedItem.signalShowFillRest()
        }


    }

    MenuItem {
        visible: pieMenu.type === 1 || pieMenu.type === 2 || pieMenu.type === 3
        text: "Copy"
        iconSource: root.copyButtonSource
        shortcut: StandardKey.Copy
        onTriggered: {
            if(pieMenu.connectedItem === null)
            {
                return;
            }
            pieMenu.connectedItem.signalCopy()
        }


    }
    MenuItem {
        text: "Cut"
        visible: pieMenu.type === 4
        iconSource: root.cutButtonSource
        shortcut: StandardKey.Cut
        onTriggered: {
            if(pieMenu.connectedItem === null)
            {
                return;
            }
            pieMenu.connectedItem.signalCut()
        }
    }
    MenuItem {
        text: pieMenu.type === 1 || pieMenu.type === 2 ? "Replace" : "Paste"
        visible: pieMenu.type === 1 ||
                 pieMenu.type === 2 ||
                 pieMenu.type === 3 ||
                 pieMenu.type === 4
        iconSource: root.pasteButtonSource
        shortcut: StandardKey.Paste
        onTriggered: {
            if(pieMenu.connectedItem === null)
            {
                return;
            }
            pieMenu.connectedItem.signalPaste()
        }
    }
    MenuItem {
        text: "Add"
        visible: pieMenu.type === 2
        iconSource: root.addButtonSource
        shortcut: StandardKey.New
        onTriggered: {
            if(pieMenu.connectedItem === null)
            {
                return;
            }
            pieMenu.connectedItem.signalAdd()
        }
    }
    MenuItem {
        text: "Del"
        visible: pieMenu.type === 2
        iconSource: root.delButtonSource
        shortcut: StandardKey.Delete
        onTriggered: {
            if(pieMenu.connectedItem === null)
            {
                return;
            }
            pieMenu.connectedItem.signalDel()
        }
    }
    MenuItem {
        text: "Up"
        visible: false
        shortcut: StandardKey.PreviousChild
        iconSource: root.upButtonSource
        onTriggered: {
            if(pieMenu.connectedItem === null)
            {
                return;
            }
            pieMenu.connectedItem.signalUp()
        }
    }
    MenuItem {
        visible: false
        text: "Down"
        iconSource: root.downButtonSource
        shortcut: StandardKey.NextChild
        onTriggered: {
            if(pieMenu.connectedItem === null)
            {
                return;
            }
            pieMenu.connectedItem.signalDown()
        }
    }
}

