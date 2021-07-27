import QtQuick 2.0
import "../table_control"

Item {
    id: root
    property var model
        signal signItemClicked(var item, var row_number)

    TableCanisterControlRectangle {
        clip: true
        id: canisterArea
        anchors.fill: parent
        model_canister: model
        onSignItemClicked: root.signItemClicked(item, row_number)
    }
}
