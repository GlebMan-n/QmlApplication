#include "autodosingsch.h"
#include <QDebug>

AutoDosingSch::AutoDosingSch(QObject *parent) : QObject(parent)
{

}

QString AutoDosingSch::getModelSch()
{
    QString result;
    result = QString::fromLatin1(_dosingSch.toJson());
    result = result.remove("\n");
    result = result.remove("\\");
   /* result = result.remove(" ");*/
    result = result.replace("\"{","{");
    result = result.replace("}\"","}");
    return result;
}

QString AutoDosingSch::getModelPrn()
{
    QString result;
    result = QString::fromLatin1(_dosingPrn.toJson());
    result = result.remove("\n");
    result = result.remove("\\");
   /* result = result.remove(" ");*/
    result = result.replace("\"{","{");
    result = result.replace("}\"","}");
    return result;
}

void AutoDosingSch::setModelSch(QString json)
{
    _dosingSch.fromJson(json.toLatin1());
}

void AutoDosingSch::setModelPrn(QString json)
{
    _dosingPrn.fromJson(json.toLatin1());
}

bool AutoDosingSch::shipToDevice()
{
     qWarning() << "AutoDosingSch::shipToDevice()";
     return true;
}

bool AutoDosingSch::splitDoses()

{
    if(_patientId <0 || _deviceId < 0)
        return false;
    QVector<Prescription> prescriptions;
    QString err;
    _databaseWorker->getPrescriptionsPatientAndDevice(_patientId,_deviceId,prescriptions,err);
    addDaysFromPresc(prescriptions);
    return true;
}

DatabaseWorker *AutoDosingSch::getDatabase() const
{
    return _databaseWorker;
}

void AutoDosingSch::setDatabase(DatabaseWorker *database)
{
    _databaseWorker = database;
}

bool AutoDosingSch::addDaysFromPresc(const QVector<Prescription> &in)
{
    Plane dosingPrn;
    Plane dosingSch;

    for(int i = 0; i < in.size(); i++) {

        Prescription presc = in.at(i);
        QDate start_date = QDate::fromString(presc.schedule.start_date,"yyyy-MM-dd");
        QDate stop_date = QDate::fromString(presc.schedule.stop_date,"yyyy-MM-dd");
        if(presc.is_prn)
            dosingPrn.addMedition(start_date,stop_date,presc.frequency,presc.medication_name,presc.prescribed_qty,presc.is_prn);
        else
            dosingSch.addMedition(start_date,stop_date,presc.frequency,presc.medication_name,presc.prescribed_qty,presc.is_prn);
    }
    _dosingPrn = dosingPrn;
    _dosingSch = dosingSch;
    return true;
}
