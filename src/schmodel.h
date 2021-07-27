#ifndef SCHMODEL_H
#define SCHMODEL_H

#include <QAbstractListModel>

class SchModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit SchModel(QObject *parent = nullptr);

    Q_INVOKABLE void setId(int patientId, int deviceId);

    enum EnumPrescription {
        MedicationName = Qt::UserRole,
        Freq,
        QTY,
        PRN,
        Start,
        Stop,
        LastChange
    };
    Q_ENUM(EnumPrescription)

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

private:
};

#endif // SCHMODEL_H
