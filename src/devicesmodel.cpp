#include "devicesmodel.h"
#include <QDebug>
DevicesModel::DevicesModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

QString DevicesModel::getDeviceName(int index) const
{
    QModelIndex in = this->index(index);
    return this->data(in, DevicesModel::EnumDevices::name).toString();
}

int DevicesModel::getDeviceId(int index)
{
    QModelIndex in = this->index(index);
    return this->data(in, DevicesModel::EnumDevices::DeviceIdRole).toInt();
}

int DevicesModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;
    return _devices.size();
}

QVariant DevicesModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    const Emilia_device device = _devices.at(index.row());
    switch (role) {
        case DeviceIdRole:
            return device.id;
        case AreaIdRole:
            return device.area_id;
        case AreaNameRole:
            return device.area_name;
        case HouseholdAddressRole:
            return device.household_address;
        case IsActiveRole:
            return device.is_active;
        case name:
          return device.household_address + "," + device.area_name;
    }
    return QVariant();
}

bool DevicesModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (data(index, role) != value) {
        // FIXME: Implement me!
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags DevicesModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable; // FIXME: Implement me!
}

QHash<int, QByteArray> DevicesModel::roleNames() const
{
    QHash<int,QByteArray> names;
    names[DeviceIdRole] = "device id";
    names[AreaIdRole] = "area id";
    names[AreaNameRole] = "area name";
    names[HouseholdAddressRole] = "household address";
    names[IsActiveRole] = "is active";
    names[name] = "name";
    return names;
}

DatabaseWorker *DevicesModel::getDatabase() const
{
    return _databaseWorker;
}

void DevicesModel::setDatabase(DatabaseWorker *list)
{
    beginResetModel();
    if (_databaseWorker)
        _databaseWorker->disconnect(this);

    _databaseWorker = list;
    _devices = _databaseWorker->getAllDevices();
    emit signDataUpdated();
    /*if (_databaseWorker) {
        connect(mList, &ToDoList::preItemAppended, this, [=]() {
            const int index = mList->items().size();
            beginInsertRows(QModelIndex(), index, index);
        });
        connect(mList, &ToDoList::postItemAppended, this, [=]() {
            endInsertRows();
        });

        connect(mList, &ToDoList::preItemRemoved, this, [=](int index) {
            beginRemoveRows(QModelIndex(), index, index);
        });
        connect(mList, &ToDoList::postItemRemoved, this, [=]() {
            endRemoveRows();
        });
    }*/
    endResetModel();
}
