#pragma once

#include "qmlhelpers.h"
#include <QAbstractListModel>
#include <QVector>

class PillsModel : public QAbstractListModel
{
    Q_OBJECT
    QML_READABLE_PROPERTY(int, rowCount, setRowCount, 0)
public:
    enum ShippedItemRoles {
        PillTitle = Qt::UserRole + 1,
        PillStatus
    };
    enum StatusType {
        StatusSuccess,
        StatusWarning
    };
    Q_ENUM(StatusType)
    explicit PillsModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int,QByteArray> roleNames() const override;
    static void registerObject();
private:
    struct ModelData {
        ModelData(const QString &t, int s) : title(t), status(s) {}
        QString title;
        int status = StatusSuccess;
    };
    QVector<ModelData> _modelData;
};
