#pragma once

#include <QObject>
#include "structures.h"

#define EMILIA_DEVICES QVector<Emilia_device>

class DatabaseWorker : public QObject
{
    Q_OBJECT
public:
    explicit DatabaseWorker(QObject *parent = nullptr);

    Q_INVOKABLE EMILIA_DEVICES getAllDevices();
    Q_INVOKABLE QStringList getAllPatientsForDevice(int deviceId);
    Q_INVOKABLE int getPatientIdByFullName(QString fullName);
    Q_INVOKABLE void insertPrescription(QString json);
    //SaveOrders
     Q_INVOKABLE void saveOrders(QString jsonSCH,QString jsonPRN, int deviceId, int patientId);
    //ShipToEmilia
    Q_INVOKABLE void shipToEmilia(QString json);

    bool getLastPrescriptionId(const QString& name, int& id);
    bool getIdByPhyName(const QString& name, int& id);
    bool connect(const DbSettings &setting, QString &error);
    bool insertPatient (const PatientData& data, QString& error);
    bool insertPrescription (const Prescription& presc, QString& error);
    bool insertSchedule (const Schedule& schedule, QString& error);
    //bool get_schedule_order_id (, int& id, QString& error);
    bool getAllPatients (const QString &procedureName, QVector<PatientData> &patients, QString& error);
    bool getAllPatients (QVector<PatientData> &patients, QString& error);
    bool getAllDevices (QVector<Emilia_device> &devices, QString& error);
    bool getPhysicianById (const int& id, Physician &physicians, QString& error);

    bool getAllPhysician (QMap<int, Physician> &physicians, QString& error);
    bool getScheduleByDeviceId (const int& id, QVector<Schedule> &schedules, QString& error);
    bool getScheduleByPatientId (const int& patient_id,const int& device_id, QVector<Schedule> &schedules, QString& error);

    bool getPrescriptionsByPatientId(const int &patient_id, QVector<Prescription> &prescriptions, QString& error);
    bool getPrescriptionByPrescriptionId(const int &prescription_id, Prescription &prescription, QString& error);

    bool getPrescriptionsPatientAndDevice(const int &patient_id, const int &device_id, QVector<Prescription> &prescriptions, QString &error);
private:
    void createTables();
    bool callProcedureInput (const QString& procedureName,
                             const QVector<QPair<QString,QVariant>> &values,
                             QString& error);

    bool callProcedureOutput(const QString& tableName,
                             const QString &procedureName,
                             QVector<QMap<QString,
                             QVariant>>& outputData,
                             QString &error,
                             const QMap<QString,QVariant>& paramenters = QMap<QString,QVariant>());
private:
    QSqlDatabase m_db;
    signals:
        void signPrescSaved(bool result);
};
