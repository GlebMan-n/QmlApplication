#pragma once

#include <QAbstractListModel>
#include <QVector>

class PillsModel;

class ShippedItemModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum ShippedItemRoles {
        Title = Qt::UserRole + 1,
        Status
    };
    enum StatusType {
        StatusSuccess,
        StatusWarning,
        StatusWaiting
    };
    Q_ENUM(StatusType)

    explicit ShippedItemModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int,QByteArray> roleNames() const override;

    Q_INVOKABLE PillsModel* pillsModel(int index);
private:
    struct ModelData {
        ModelData(const QString &t, int s) : title(t), status(s) {}
        QString title;
        int status = StatusWaiting;
    };
    QVector<ModelData> _modelData;
    PillsModel *_pillsModel = nullptr;
};
