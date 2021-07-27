#ifndef AUTODOSINGSCH_H
#define AUTODOSINGSCH_H

#include <QObject>
#include <QMap>
#include <QDate>
#include "databaseworker.h"


class AutoDosingSch : public QObject
{
    Q_OBJECT
    Q_PROPERTY(DatabaseWorker *database READ getDatabase WRITE setDatabase)
public:
    explicit AutoDosingSch(QObject *parent = nullptr);

    Q_INVOKABLE void setPatientId(int patiendId) {
        _patientId = patiendId;
    }

    Q_INVOKABLE void setDeviceId(int devId) {
        _deviceId = devId;
    }
    Q_INVOKABLE QString getModelSch();
    Q_INVOKABLE QString getModelPrn();
    Q_INVOKABLE void setModelSch(QString json);
    Q_INVOKABLE void setModelPrn(QString json);
    Q_INVOKABLE bool shipToDevice();
    Q_INVOKABLE bool splitDoses();

    DatabaseWorker *getDatabase() const;
    void setDatabase(DatabaseWorker *database);
private:
    DatabaseWorker* _databaseWorker;
    Plane _dosingSch;
    Plane _dosingPrn;
    int _patientId = -1;
    int _deviceId = -1;

    bool addDaysFromPresc(const QVector<Prescription>& in);


};

#endif // AUTODOSINGSCH_H
