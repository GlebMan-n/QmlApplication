#ifndef DEVICESMODEL_H
#define DEVICESMODEL_H

#include <QAbstractListModel>
#include <QMap>
#include "databaseworker.h"

class DevicesModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(DatabaseWorker *database READ getDatabase WRITE setDatabase)

public:
    explicit DevicesModel(QObject *parent = nullptr);

    enum EnumDevices {
        name = Qt::UserRole,
        AreaIdRole,
        AreaNameRole,
        HouseholdAddressRole,
        IsActiveRole,
        DeviceIdRole
    };
    Q_ENUM(EnumDevices)

    Q_INVOKABLE QString getDeviceName(int index) const;
    Q_INVOKABLE int getDeviceId(int index);

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    virtual QHash<int,QByteArray> roleNames() const override;

    DatabaseWorker *getDatabase() const;
    void setDatabase(DatabaseWorker *list);
signals:
    void signDataUpdated();
private:
    DatabaseWorker* _databaseWorker;
    EMILIA_DEVICES _devices;
};

#endif // DEVICESMODEL_H
