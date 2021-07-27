#pragma once

#include "qmlhelpers.h"
#include "shippeditemmodel.h"
#include "orderintaketable.h"

class Controller : public QObject
{
    Q_OBJECT
    QML_CONSTANT_PROPERTY_PTR(ShippedItemModel, shippedItemModel)
    QML_CONSTANT_PROPERTY_PTR(OrderIntakeTable, orderIntakeTable)
    QML_READABLE_PROPERTY(int, canisterCount, setCanisterCount, 100)
    QML_READABLE_PROPERTY(int, cartrigeCount, setCartrigeCount, 500)
public:
    Controller(QObject *parent = nullptr);
    Q_INVOKABLE QString canisterLabel(int index);
    Q_INVOKABLE QString canisterIcon(int index);
    Q_INVOKABLE QString cartrigeIcon(int index);
};
