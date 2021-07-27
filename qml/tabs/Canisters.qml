import QtQuick 2.13
import QtQuick.Controls 2.13
import "../custom/Canister"
import "../custom"
import ".."

Rectangle {
    id: control
    color: "white"

    CanistersWidget {
        id: canistersWidget
        anchors.fill: parent
    }  
}
