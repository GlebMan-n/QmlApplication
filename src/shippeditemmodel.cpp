#include "shippeditemmodel.h"
#include "pillsmodel.h"
#include <QQmlEngine>
#include <QDebug>

ShippedItemModel::ShippedItemModel(QObject *parent) : QAbstractListModel(parent)
{
    qmlRegisterInterface<ShippedItemModel>("ShippedItemModel");
    qmlRegisterType<ShippedItemModel>("ShippedItemModel", 1, 0, "ShippedItemModel");

    //TODO
    _modelData = {
        { "#634578 Buzz Aldrin", StatusSuccess },
        { "#605605 Neil Armstrong", StatusSuccess },
        { "#455565 Alan Bear", StatusSuccess },
        { "#677899 Buzz Aldrin", StatusWarning },
        { "#566722 Buzz Aldrin", StatusWaiting },
        { "#565432 Alan Bear", StatusWaiting },
        { "#125432 Neil Armstrong", StatusWaiting },
        { "#232323 Buzz Aldrin", StatusWaiting },
        { "#454545 Alan Bear", StatusWaiting },
        { "#677677 Neil Armstrong", StatusWaiting },
        { "#234456 Buzz Aldrin", StatusWaiting },
        { "#090989 Alan Bear", StatusWaiting },
        { "#098987 Neil Armstrong", StatusWaiting }
    };
}

int ShippedItemModel::rowCount(const QModelIndex& /*parent*/) const
{
    return _modelData.count();
}

QVariant ShippedItemModel::data(const QModelIndex &index, int role) const
{
    if ((index.row() < 0) || (index.row() > _modelData.count())) {
        return QVariant();
    }
    const auto &item = _modelData.at(index.row());
    QVariant out;
    switch (role) {
    case Title:
        out = item.title;
        break;
    case Status:
        out = item.status;
        break;
    }
    return out;
}

QHash<int,QByteArray> ShippedItemModel::roleNames() const
{
    const static QHash<int, QByteArray> roles {
        { Title, "title" },
        { Status, "status" }
    };
    return roles;
}

PillsModel* ShippedItemModel::pillsModel(int index)
{
    qInfo() << "pillsModel" << index;
    if (nullptr == _pillsModel) {
        _pillsModel = new PillsModel();
    }
    return _pillsModel;
}
