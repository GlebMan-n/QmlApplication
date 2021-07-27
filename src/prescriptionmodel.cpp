#include "prescriptionmodel.h"
#include "QDebug"
PrescriptionModel::PrescriptionModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void PrescriptionModel::clear()
{
    beginResetModel();
    _prescriptions.clear();
    endResetModel();
    emit signDataUpdated();

}


void PrescriptionModel::setPatientId(int patientId)
{
    if(_deviceId < 0 || patientId < 0)
        return;
    beginResetModel();
    QString err;
    _prescriptions.clear();
    _databaseWorker->getPrescriptionsPatientAndDevice(patientId,_deviceId,_prescriptions,err);
    endResetModel();
    emit signDataUpdated();
}

void PrescriptionModel::setDeviceId(int deviceId)
{
    if(deviceId < 0 || deviceId == _deviceId)
        return;
     _deviceId = deviceId;
}

int PrescriptionModel::rowCount(const QModelIndex &parent) const
{

    if (parent.isValid())
        return 0;
    return _prescriptions.size();
}


QVariant PrescriptionModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    const Prescription presc = _prescriptions.at(index.row());
    switch (role) {
        case MedicationName:
            return presc.medication_name;
        case Freq:
            return presc.frequency;
        case QTY:
            return presc.prescribed_qty;
        case PRN:
            return presc.is_prn;
        case Start:
            return presc.schedule.start_date;
        case Stop:
            return presc.schedule.stop_date;
    }
    return QVariant();
}

bool PrescriptionModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (data(index, role) != value) {
        // FIXME: Implement me!
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags PrescriptionModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;
    return Qt::ItemIsEditable; // FIXME: Implement me!
}

QHash<int, QByteArray> PrescriptionModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[MedicationName] = "medi";
    names[Freq] = "freq";
    names[QTY] = "qty";
    names[PRN] = "prn";
    names[Start] = "start";
    names[Stop] = "stop";
    names[LastChange] = "last change";
    return names;
}

DatabaseWorker *PrescriptionModel::getDatabase() const
{
    return _databaseWorker;
}

void PrescriptionModel::setDatabase(DatabaseWorker *list)
{
    beginResetModel();
    if (_databaseWorker)
        _databaseWorker->disconnect(this);

    _databaseWorker = list;
    connect(_databaseWorker, SIGNAL(signPrescSaved(bool)),this, SIGNAL(signPrescriptionSaved(bool)));
    emit signDataUpdated();
    endResetModel();
}
