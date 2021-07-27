#include "pillsmodel.h"
#include <QQmlEngine>

PillsModel::PillsModel(QObject *parent) : QAbstractListModel(parent)
{
    //TODO
    _modelData = {
        { "Aspirin 500mg", StatusSuccess },
        { "Sandimmune 10mg", StatusSuccess },
        { "Kao-Tin Capsule", StatusWarning },
        { "OA 1 Powder 15.", StatusSuccess }
    };
    setRowCount(_modelData.size());
}

void PillsModel::registerObject()
{
    qmlRegisterInterface<PillsModel>("PillsModel");
    qmlRegisterType<PillsModel>("PillsModel", 1, 0, "PillsModel");
}

int PillsModel::rowCount(const QModelIndex& /*parent*/) const
{
    return _modelData.count();
}

QVariant PillsModel::data(const QModelIndex &index, int role) const
{
    if ((index.row() < 0) || (index.row() > _modelData.count())) {
        return QVariant();
    }
    const auto &item = _modelData.at(index.row());
    QVariant out;
    switch (role) {
    case PillTitle:
        out = item.title;
        break;
    case PillStatus:
        out = item.status;
        break;
    }
    return out;
}

QHash<int,QByteArray> PillsModel::roleNames() const
{
    const static QHash<int, QByteArray> roles {
        { PillTitle, "pillTitle" },
        { PillStatus, "pillStatus" }
    };
    return roles;
}
