#ifndef PRESCRIPTIONMODEL_H
#define PRESCRIPTIONMODEL_H

#include <QAbstractListModel>
#include "databaseworker.h"

class PrescriptionModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(DatabaseWorker *database READ getDatabase WRITE setDatabase)
public:
    explicit PrescriptionModel(QObject *parent = nullptr);

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
    Q_INVOKABLE void clear();
    Q_INVOKABLE void setPatientId(int patientId);
    Q_INVOKABLE void setDeviceId(int deviceId);

    Q_INVOKABLE QString getMedicationName(int index) {

        return _prescriptions.at(index).medication_name;
    }
    Q_INVOKABLE QString getFreq(int index) {
        return _prescriptions.at(index).frequency;
    }
    Q_INVOKABLE int getPrn(int index) {
        int res = (int)_prescriptions.at(index).is_prn;
        return res;
    }
    Q_INVOKABLE int getQty(int index) {
        return _prescriptions.at(index).prescribed_qty;
    }
    Q_INVOKABLE int getRefill(int index) {
        return _prescriptions.at(index).refill;
    }
    Q_INVOKABLE QString getPhysicianName(int index) {
        return _prescriptions.at(index).physician_name;
    }
    Q_INVOKABLE QString getDateWritten(int index) {
        return _prescriptions.at(index).date_written.toString("ddMMyyyy");
    }
    Q_INVOKABLE QString getDescription(int index) {
        return "Descriptions";
    }
    Q_INVOKABLE int getMDispAsWritten(int index) {
        return _prescriptions.at(index).daw;
    }

    Q_INVOKABLE QString getStartDate(int index) {
        return _prescriptions.at(index).schedule.start_date;
    }
    Q_INVOKABLE QString getStopDate(int index) {
        return _prescriptions.at(index).schedule.stop_date;
    }

    Q_INVOKABLE int getPrescription(int index) {
        return _prescriptions.at(index).id;
    }
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
    void signPrescriptionSaved(bool result);
private:
    DatabaseWorker* _databaseWorker;
    QVector<Prescription> _prescriptions;
    int _deviceId = -1;
private:
};

#endif // PRESCRIPTIONMODEL_H
