import QtQuick 2.15
import "../table_control"
import "../../custom"
import "../../custom/table_control/logic.js" as Logic

BaseRowRectangle {
    id: root
    property var model_all_data: canisterInstalledModel
    property bool is_prn: true
    signal signItemClicked(var item, var row_number)

    signal signFilterMedication(var filter)
    signal signFilterQrCode(var filter)
    signal signFilterQty(var filter)
    signal signFilterLocation(var filter)
    signal signFilterTallMan(var filter)
    signal signClearAllFilters()

    onSignFilterMedication: console.log("filter: ", filter)
    onSignFilterQrCode: console.log("filter: ", filter)
    onSignFilterQty: console.log("filter: ", filter)
    onSignFilterLocation: console.log("filter: ", filter)
    onSignFilterTallMan: console.log("filter: ", filter)
    onSignClearAllFilters: console.log("All filters removed")
    ListView {
        objectName: "ListView"
        id: list_view
        clip: true
        spacing: 0
        width: parent.width
        height: parent.height
        model: model_all_data
        delegate: canisterDelegate
        header: headerCanister
        headerPositioning: ListView.OverlayHeader
    }

    Component {
        id: canisterDelegate

        Column {
            id: root_col
            property color background: {index % 2 == 0 ? root.first_backgroundColor : root.second_backgroundColor}
            property color textColor: {index % 2 == 0 ? root.first_text_color : root.second_text_color}
            property int currentIndex: index
            property int currentNumber: model_all_data.get(root_col.currentIndex).number
            width: list_view.width
            height: childrenRect.height
            Repeater {
                id: repeater
                model: model_all_data.get(root_col.currentIndex).med
                width: root_col.width
                height: childrenRect.height

                Row {
                    visible: String(generic_madication_name).length > 0
                    width: root_col.width
                    height: childrenRect.height
                    Rectangle {
                        width: root_col.width
                        height: String(generic_madication_name).length > 0 ? 40 : 0
                        border.width: 1
                        border.color: "black"
                        color: "white"

                        Row {
                            height: parent.height
                            id: data_row
                            spacing: 2
                            anchors {
                                left: parent.left
                                top: parent.top
                                right: parent.right
                            }
                            Rectangle {
                                id: num_row
                                color: root.first_backgroundColor
                                height: parent.height
                                width: 25
                                CellText {
                                    anchors.fill: parent
                                }
                            }

                            Rectangle {
                                color: Logic.statusToColor(status)
                                height: parent.height
                                width: root.width / (data_row.children.length - 1) - data_row.spacing - (num_row.width/ (data_row.children.length - 1))
                                CellText {
                                    anchors.fill: parent
                                    text:  generic_madication_name
                                    color: Logic.statusToTextColor(status)
                                }
                            }

                            Rectangle {
                                color: root.first_backgroundColor
                                height: parent.height
                                width: root.width / (data_row.children.length - 1) - data_row.spacing - (num_row.width/ (data_row.children.length - 1))
                                CellText {
                                    anchors.fill: parent
                                    text: qr_code
                                }
                            }
                            Rectangle {
                                color: root.first_backgroundColor
                                height: parent.height
                                width: root.width / (data_row.children.length - 1) - data_row.spacing - (num_row.width/ (data_row.children.length - 1))
                                CellText {
                                    anchors.fill: parent
                                    text: qty
                                }
                            }
                            Rectangle {
                                color: root.first_backgroundColor
                                height: parent.height
                                width: root.width / (data_row.children.length - 1) - data_row.spacing - (num_row.width/ (data_row.children.length - 1))
                                CellText {
                                    anchors.fill: parent
                                    text: currentNumber + " " + col_num
                                }
                            }
                            Rectangle {
                                color: root.first_backgroundColor
                                height: parent.height
                                width: root.width / (data_row.children.length - 1) - data_row.spacing - (num_row.width/ (data_row.children.length - 1))
                                CellText {
                                    anchors.fill: parent
                                    text: tall_man
                                }
                            }

                        }
                        Rectangle {
                            height: String(generic_madication_name).length > 0 ? 1 : 0
                            color: "white"
                            anchors {
                                left: parent.left
                                bottom: parent.bottom
                                right: parent.right
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                root.signItemClicked(model_all_data.get(root_col.currentIndex).med.get(index),currentNumber)
                            }
                        }
                    }
                }
            }
        }
    }

    Component {
        id: headerCanister
        Column {
            height: childrenRect.height
            width: list_view.widthsignClearAllFilters
            z:2
            Row {
                id: header_row
                spacing: 2
                height: 40
                width: root.width
                Rectangle {
                    id: row_header
                    color: root.first_backgroundColor
                    height: 40
                    width: 25
                    CellText {
                        anchors.fill: parent
                        text: ""
                    }
                }
                Rectangle {
                    color: root.first_backgroundColor
                    height: 40
                    width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                    CellText {
                        anchors.fill: parent
                        text: "Medication"
                    }
                }
                Rectangle {
                    color: root.first_backgroundColor
                    height: 40
                    width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                    CellText {
                        anchors.fill: parent
                        text: "QR-Code"
                    }
                }

                Rectangle {
                    color: root.first_backgroundColor
                    height: 40
                    width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                    CellText {
                        anchors.fill: parent
                        text: "Qty"
                    }
                }

                Rectangle {
                    color: root.first_backgroundColor
                    height: 40
                    width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                    CellText {
                        anchors.fill: parent
                        text: "Location"
                    }
                }

                Rectangle {
                    color: root.first_backgroundColor
                    height: 40
                    width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                    CellText {
                        anchors.fill: parent
                        text: "Tall Man"
                    }
                }

            }
            Row {
                id: filter_row
                spacing: 2
                height: 40
                width: root.width
                Rectangle {
                    id: row_filter_header
                    color: root.first_backgroundColor
                    height: 40
                    width: 25
                    border.color: Qt.darker(root.first_backgroundColor)
                    Text {
                        text: "X"
                        color: "white"
                        anchors.fill: parent
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            verticalCenter: parent.verticalCenter
                        }
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            filter_medication.clear();
                            filter_qr_code.clear();
                            filter_qty.clear();
                            filter_location.clear();
                            filter_tall_man.clear();
                            root.signClearAllFilters();
                        }
                        onPressed: row_filter_header.color = Qt.darker(root.first_backgroundColor)
                        onReleased: row_filter_header.color = root.first_backgroundColor
                    }
                }

                Rectangle {
                    color: root.first_backgroundColor
                    height: 40
                    width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                    CellTextEdit {
                        id: filter_medication
                        anchors.fill: parent
                        placeholderText: "Filter medication"
                        Keys.onReleased: root.signFilterMedication(text)
                    }
                }
                Rectangle {
                    color: root.first_backgroundColor
                    height: 40
                    width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                    CellTextEdit {
                        id: filter_qr_code
                        anchors.fill: parent
                        placeholderText: "Filter qr-code"
                        Keys.onReleased: root.signFilterQrCode(text)
                    }
                }

                Rectangle {
                    color: root.first_backgroundColor
                    height: 40
                    width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                    CellTextEdit {
                        anchors.fill: parent
                        id: filter_qty
                        placeholderText: "Filter qty"
                        Keys.onReleased: root.signFilterQty(text)
                    }
                }

                Rectangle {
                    color: root.first_backgroundColor
                    height: 40
                    width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                    CellTextEdit {
                        anchors.fill: parent
                        id: filter_location
                        placeholderText: "Filter location"
                        Keys.onReleased: root.signFilterLocation(text)
                    }
                }

                Rectangle {
                    color: root.first_backgroundColor
                    height: 40
                    width: root.width / (header_row.children.length - 1) - header_row.spacing - (row_header.width/ (header_row.children.length - 1))
                    CellTextEdit {
                        anchors.fill: parent
                        id: filter_tall_man
                        placeholderText: "Filter Tallman"
                        Keys.onReleased: root.signFilterTallMan(text)
                    }
                }
            }
            Rectangle {
                width: parent.width
                height: 1
                color: "white"
            }
        }
    }
}
