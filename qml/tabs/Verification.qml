import QtQuick 2.15
import QtQuick.Controls 2.15
import "../custom"
import "../panels"
import ".."
import QtQuick.XmlListModel 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: control
    color: "black"

    XmlListModel {
        id: xmlModel
        source: "qrc:/xml/cartridges.xml"
        query: "/cartridges/cartridge"
        XmlRole { name: "xlm_caption"; query: "caption/string()" }
        XmlRole { name: "xlm_color"; query: "color/string()" }
        XmlRole { name: "xlm_data"; query: "data/string()" }
        XmlRole { name: "xlm_name"; query: "name/string()" }
        XmlRole { name: "xlm_date"; query: "date/string()" }
        XmlRole { name: "xlm_facility"; query: "facility/string()" }
        XmlRole { name: "xlm_day_supply"; query: "day_supply/string()" }
        XmlRole { name: "xlm_cartridge"; query: "cartridge/string()" }
        XmlRole { name: "xlm_displayed_bins"; query: "displayed_bins/string()" }
    }

    TabBar {
        id: bar
        width: parent.width
        Repeater {
            model: xmlModel
            TabButton {
                Rectangle {
                    border.color: "#103779"
                    border.width: 3
                    //radius: 10
                    anchors.fill: parent
                    color: {
                        if (xlm_color == "green")
                            return "#98cda9";
                        else if (xlm_color == "red")
                            return "#ff3f3f";
                        else if (xlm_color == "yellow")
                            return "#edeb63";
                        else
                            return "#2b4c81";
                    }
                    Row {
                        spacing: 10
                        topPadding: 10
                        leftPadding: parent.height / 5
                        Row {
                            topPadding: 3
                            Image {
                                anchors.topMargin: 15
                                id: cart_img
                                source: "qrc:/img/CartrigesCur.svg"
                            }
                        }

                        Text {
                            font.pixelSize: 24
                            text: xlm_caption
                            color: {
                                if (xlm_color == "green")
                                    return "white";
                                else if (xlm_color == "red")
                                    return "white";
                                else if (xlm_color == "yellow")
                                    return "black";
                                else
                                    return "white";
                            }

                        }
                    }
                }
                width: bar.width / xmlModel.count
            }
        }
    }
    StackLayout {
        anchors.left:  parent.left
        anchors.right:  parent.right
        anchors.top: bar.bottom
        anchors.bottom:  parent.bottom
        currentIndex: bar.currentIndex

        Repeater {
            model: xmlModel
            Rectangle {
                FillCheckerPanel {
                    id: rightPanel
                    anchors {
                        top: parent.top
                        right: parent.right
                        bottom: parent.bottom
                    }
                    width: 280
                    name: xlm_name
                    date: Qt.formatDateTime(currentDate, "M/dd/yyyy hh:mm AP")
                    facility: xlm_facility
                    day_supply: xlm_day_supply
                    cartridge: xlm_cartridge
                    displayed_bins: xlm_displayed_bins
                }
                PillCheckerArea {
                    width: control.width - rightPanel.width
                    height: parent.height
                    xml_file: "qrc:/xml/cartridges/" + xlm_data
                    anchors {
                        top: parent.top
                        left: parent.left
                        right: rightPanel.left
                        bottom: parent.bottom
                    }
                }
            }
        }
    }
}
