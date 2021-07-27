#include "controller.h"

Controller::Controller(QObject *parent) : QObject(parent)
{
    setObjectName("controller");
}

QString Controller::canisterLabel(int index)
{
    QString lbl;
    switch (index) {
    case 0:
        lbl = "Aspirin 500mg";
        break;
    case 1:
        lbl = "Sanimmune 100mg";
        break;
    case 9:
        lbl = "Kao-Tin Capsule 100mg";
        break;
    default:
        lbl = "Medication";
    }
    return lbl;
}

QString Controller::canisterIcon(int index)
{
    QString icon;
    switch (index) {
    case 9:
        icon = "qrc:/img/CanisterRed.svg";
        break;
    default:
        icon = "qrc:/img/CanisterGray.svg";
    }
    return icon;
}

QString Controller::cartrigeIcon(int index)
{
    QString icon;
    switch (index) {
    case 37:
        icon = "qrc:/img/CartrigeRed.svg";
        break;
    default:
        if ((0 <= index) && (37 > index)) {
            icon = "qrc:/img/CartrigeChecked.svg";
        } else {
            icon = "qrc:/img/CartrigeGray.svg";
        }
    }
    return icon;
}
