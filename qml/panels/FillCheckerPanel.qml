import QtQuick 2.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.13
import "../custom"
import ".."

Item {
    id: root
    width: parent.width / 5
    height: parent.height

    property var name: ""
    property var date: ""
    property var facility: ""
    property var day_supply: ""
    property var cartridge: ""
    property var displayed_bins: ""

    property var locale: Qt.locale()
    property date currentDate: new Date()

    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(parent.width, 0)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "white" }
            GradientStop { position: 1.0; color: "#cdcdcd" }
        }
    }
    //Whole left panel
    Rectangle {
            id: whole
            width: root.width
            height: root.height

            anchors {
                top: parent.top
                left: parent.left
            }

             //JobInfo
            Rectangle {
                id: jobinfo
                height: childrenRect.height + 10
                anchors {
                    margins: 10
                    left: parent.left
                    right: parent.right
                    top:parent.top
                }
                 //jobinfoCaption
                 Rectangle {
                     id: jobinfoCaption
                     width: parent.width
                     height: childrenRect.height
                     Image {
                         id: hdrImage
                         anchors {
                             top: parent.top
                             topMargin: 12
                             left: parent.left
                             leftMargin: 20
                         }
                         height: 25
                         width: height
                         fillMode: Image.PreserveAspectFit
                         mipmap: true
                         source: "qrc:/img/OrderIntakeCur.svg"
                     }

                     Label {
                         id: prescrDetails
                         anchors {
                             top: parent.top
                             left: hdrImage.right
                             leftMargin: 10
                         }
                         font {
                             family: Theme.robotoMedium.name
                             pointSize: Theme.fontPointSize
                             capitalization: Font.AllUppercase
                         }
                         height: Theme.buttonHeight
                         verticalAlignment: Text.AlignVCenter
                         text: qsTr("Job Info")
                         color: "#454545"
                     }
                 } //End job info caption


                 //patientNameCheck
                 CustomRoundTextField {
                     id: patientNameCheck
                     anchors {
                         top: jobinfoCaption.bottom
                         topMargin: 20
                         left: jobinfoCaption.left
                         right: parent.right
                     }
                     placeholderText: qsTr("Patient Name")
                     text: root.name
                     frameHeight: Theme.buttonHeight
                 }//patientName

                 //adminTime
                 CustomRoundTextField {
                     id: adminTime
                     anchors {
                         top: patientNameCheck.bottom
                         topMargin: 20
                         left: patientNameCheck.left
                         right: parent.right
                     }
                     placeholderText: qsTr("Admin Time")
                     text: root.date
                     frameHeight: Theme.buttonHeight
                 }//adminTime

                 //facility
                 CustomRoundTextField {
                     id: facility
                     anchors {
                         top: adminTime.bottom
                         topMargin: 20
                         left: adminTime.left
                         right: parent.right
                     }
                     placeholderText: qsTr("Facility")
                     text: root.facility
                     frameHeight: Theme.buttonHeight
                 }//Facility

                 //daySupply
                 CustomRoundTextField {
                     id: daySupply
                     anchors {
                         top: facility.bottom
                         topMargin: 20
                         left: facility.left
                         right: parent.right
                     }
                     placeholderText: qsTr("Day Supply")
                     text: root.day_supply
                     frameHeight: Theme.buttonHeight
                 }//DaySupply

                 //pouches
                 CustomRoundTextField {
                     id: pouches
                      anchors {
                         top: daySupply.bottom
                         topMargin: 20
                         left: daySupply.left
                         right: parent.right
                     }
                     placeholderText: qsTr("Cartridge")
                     text: root.cartridge
                     frameHeight: Theme.buttonHeight
                 }//Pouches

                 //comment
                 CustomRoundTextArea {
                     id: comment
                     anchors {
                         top: pouches.bottom
                         topMargin: 20
                         left: parent.left
                         right: parent.right
                     }
                     placeholderText: qsTr("Displayed Bins")
                     text: root.displayed_bins
                     frameHeight: 2.5 * Theme.buttonHeight
                 }

             } //JobInfo

             //ReqPills
            Rectangle {
                id: reqpills

                height: parent.height - jobinfo.height

                anchors {
                    margins: 10
                    top: jobinfo.bottom
                    left: parent.left
                    right: parent.right
                }

                //Required pills caption
                Rectangle {
                    id: requiredPillsCaption
                    width: parent.width
                    height: 30
                    anchors.leftMargin: 5
                    Image {
                        id: rpImage
                        anchors {
                            top: parent.top
                            topMargin: 12
                            left: parent.left
                            leftMargin: 20
                        }
                        height: 25
                        width: height
                        fillMode: Image.PreserveAspectFit
                        mipmap: true
                        source: "qrc:/img/OrderIntakeCur.svg"
                    }

                    Label {
                        id: rpDetails
                        anchors {
                            top: parent.top
                            left: rpImage.right
                            leftMargin: 10
                        }
                        font {
                            family: Theme.robotoMedium.name
                            pointSize: Theme.fontPointSize
                            capitalization: Font.AllUppercase
                        }
                        height: Theme.buttonHeight
                        verticalAlignment: Text.AlignVCenter
                        text: qsTr("Required Pills")
                        color: "#454545"
                    }
                } //Required pills caption

                Rectangle {
                    id: scroll1
                    width: parent.width
                    height: parent.height- requiredPillsCaption.height
                    anchors {
                        top: requiredPillsCaption.bottom
                        left: reqpills.left
                        right: parent.right
                        topMargin: 15
                    }

                    //Etalon pills
                    ScrollView {
                        clip: true
                        anchors {
                            fill: scroll1
                        }
                        Column {
                            spacing: 5
                                Row {
                                    spacing: 5
                                    CustomRoundButton {
                                        id: editBtn1
                                        backgroundColor: "#277db7"
                                        imageVisible: false
                                        text: qsTr("Commit All Bins")
                                        height: 60
                                        width: 240
                                    }
                                }

                                Row {
                                    spacing: 5
                                    Column {
                                        Label {
                                            id: shippedLbl
                                            font: Theme.fontRobotoMedium
                                            text: qsTr("> Outline Cenecf Pills")
                                            color: "#979797"
                                        }
                                        Label {
                                            id: incorrect
                                            font: Theme.fontRobotoMedium
                                            text: qsTr("> Outline Incorrect Pills")
                                            color: "#979797"
                                        }
                                    }
                                }
                                Row {
                                    spacing: 5

                                    CustomRoundButton {
                                        id: editBtn2
                                        backgroundColor: "#277db7"
                                        imageVisible: false
                                        text: qsTr("Disapprove")
                                        height: 60
                                        width: 130
                                    }
                                    CustomRoundButton {
                                        id: editBtn3
                                        backgroundColor: "#277db7"
                                        imageVisible: false
                                        text: qsTr("Approve")
                                        height: 60
                                        width: 125
                                    }
                                }
                         }
                    }
                }
            } //ReqPills
    }//End Whole left panel
}//End ROOT
