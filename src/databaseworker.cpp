#include "databaseworker.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QStringList>
#include <QList>
#include <QSqlRecord>
#include <QDebug>

#include <QPdfWriter>
#include <QPainter>

DatabaseWorker::DatabaseWorker(QObject *parent) : QObject(parent)
{
    DbSettings settings;
    settings.name = "sophic_medical";
    settings.user = "sophic_medical";
    settings.password = "12345678";
    settings.type = "QMYSQL";
    QString err;
    bool bRes = connect(settings,err);
    if(!bRes) {
        qWarning() << err;
        return;
    }
    createTables();
    /*
     * DELETE FROM sophic_medical.schedule_order
     * UPDATE//TODO INTO schedule_order (prescription_id, device_id, order_json, is_prn) VALUES(1, 1, '{}', is_prn=false)
     * INSERT INTO schedule_order (prescription_id, device_id, order_json, is_prn) VALUES(1, 1, '{}', is_prn=false)
     * SELECT * FROM sophic_medical.schedule_order;
     * SELECT id FROM schedule_order where prescription_id = 1 and device_id = 1
     *
     *
     * DELETE FROM sophic_medical.schedule_order WHERE prescription_id=1 AND device_id=1 AND is_prn=1;
     *
     * INSERT INTO schedule_order (prescription_id, device_id, order_json, is_prn) VALUES(1, 1, '{}', is_prn=false)
     *
     * //CHECK IF EXISTS
     * SELECT * FROM sophic_medical.schedule_order WHERE prescription_id=1 AND device_id=1 AND is_prn=1;
     *
     * //UPDATE
     * UPDATE sophic_medical.schedule_order SET order_json='{\"json\":\"new_json_data\"}' WHERE prescription_id=1 AND device_id=1 AND is_prn=1;
     *
    //create before working
    CREATE TABLE IF NOT EXISTS `schedule_order` (
      `id` int(11) NOT NULL auto_increment,
      `patient_id` int(11) NOT NULL ,
      `device_id` int(11) NOT NULL ,
      `order_json`  MEDIUMTEXT NOT NULL,
      `is_prn`  BOOL default false,
      PRIMARY KEY  (`id`) AUTO_INCREMENT
    );
    */
}

void DatabaseWorker::createTables()
{
    QString schedule_order_create("CREATE TABLE IF NOT EXISTS `schedule_order` ( `id` int(11) NOT NULL auto_increment, `patient_id` int(11) NOT NULL , `device_id` int(11) NOT NULL , `order_json`  MEDIUMTEXT NOT NULL, `is_prn`  BOOL default false, PRIMARY KEY  (`id`) )");
    qWarning() << schedule_order_create;
    QSqlQuery query;
    if(!query.prepare(schedule_order_create)) {
        qWarning() << query.lastError().text();
        return ;
    }
    if(!query.exec()) {
        return ;
    }
}

QVector<Emilia_device> DatabaseWorker::getAllDevices()
{
    QString err;
    QVector<Emilia_device> deviceData;
    if(!getAllDevices(deviceData,err))
    {
        qWarning() << err;
        return QVector<Emilia_device>();
    }
    return deviceData;
}

QStringList DatabaseWorker::getAllPatientsForDevice(int deviceId)
{
    QStringList patients;
    QVector<Schedule> schedules;
    QString err;
    bool bRes = getScheduleByDeviceId(deviceId,schedules,err);
    if(!bRes) return patients;
    for(auto i = 0; i < schedules.size(); i++)
        patients << (schedules.at(i).patient_first_name + " " + schedules.at(i).patient_last_name);
    patients.removeDuplicates();
    return patients;
}

int DatabaseWorker::getPatientIdByFullName(QString fullName)
{
    QVector<PatientData> pData;
    QString err;
    QStringList fullNameSL = fullName.split(" ");
    if(fullNameSL.size() < 2) return -1;
    QString firstName = fullNameSL.at(0);
    QString lastName = fullNameSL.at(1);
    bool bRes = getAllPatients(pData,err);
    if(!bRes) return -1;
    for(auto i = 0; i < pData.size(); i++)
        if(pData.at(i).patient_first_name == firstName && pData.at(i).patient_last_name == lastName)
            return pData.at(i).id;
    return -1;
}


void DatabaseWorker::saveOrders(QString jsonSCH, QString jsonPRN, int deviceId, int patientID)
{
    if(deviceId < 0 || patientID < 0)
        return;
    QString delete_query_string("DELETE FROM sophic_medical.schedule_order WHERE patient_id=" + QString::number(patientID) + " AND device_id=" + QString::number(deviceId));
    QString save_sch_order_query_string("INSERT INTO schedule_order (patient_id, device_id, order_json, is_prn) VALUES(" + QString::number(patientID) + ", " + QString::number(deviceId) + " , '" + jsonSCH + "', is_prn=0)");
    QString save_prn_order_query_string("INSERT INTO schedule_order (patient_id, device_id, order_json, is_prn) VALUES(" + QString::number(patientID) + ", " + QString::number(deviceId) + " , '" + jsonPRN + "', is_prn=1)");
    QSqlQuery query;
    if(!query.exec(delete_query_string))
        return ;
    if(!query.exec(save_sch_order_query_string))
        return ;
    if(!query.exec(save_prn_order_query_string))
        return ;
}

void DatabaseWorker::shipToEmilia(QString json)
{
    const QString filename("/home/gleb/Documents/111.pdf");
    QString testData = "<html> \
   <body>\
            <h3>First header</h3>\
            <p>text text text</p>\
            <div class=\"content\">\
        <h3>Nested header <a href="">My Link</a></h3>\
            </div>\
            </body>\
            </html>";
    QPdfWriter pdfwriter(filename);
    pdfwriter.setPageSize(QPageSize(QPageSize::A4));
    QPainter painter(&pdfwriter);
    painter.drawText(0,0, testData);
#ifdef QT_DEBUG
    qWarning() << "DatabaseWorker::shipToEmilia " << json;
#endif
}

bool DatabaseWorker::getLastPrescriptionId(const QString &name, int &id)
{
    QString query_str ("SELECT id FROM sophic_medical.prescription ORDER BY id DESC LIMIT 1");
    QSqlQuery query(query_str);
    while (query.next()) {
        bool bRes = false;
        int id_ = query.value(0).toInt(&bRes);
        if(bRes) {
            id = id_;
            qWarning() << query.lastError().text();
            return true;
        }
    }
    id = -1;
    qWarning() << query.lastError().text();
    return false;
}

bool DatabaseWorker::getIdByPhyName(const QString &name, int &id)
{
    QStringList list(name.split(" "));
    if (list.size() < 2 )
        return false;
    QString first_name(list.at(0));
    QString last_name(list.at(1));

    QString select_phy_id_by_name("SELECT * FROM sophic_medical.physician where first_name like '"+first_name+"' and last_name like '"+last_name+"'");
    QSqlQuery query(select_phy_id_by_name);
    while (query.next()) {
        bool bRes = false;
        int id_ = query.value(0).toInt(&bRes);
        if(bRes) {
            id = id_;
            qWarning() << query.lastError().text();
            return true;
        }
    }
    id = -1;
    qWarning() << query.lastError().text();
    return false;
}


void DatabaseWorker::insertPrescription(QString json)
{
    Prescription presc;
    Schedule schedule;
    QJsonObject jsonObj;
    QJsonDocument jsonOutDoc;
    QJsonParseError error;
    jsonOutDoc  = QJsonDocument::fromJson(json.toLatin1(),&error);
    jsonObj     = jsonOutDoc.object();
    if(error.offset > 0)
        return;

    /*
            patient_name: patientName.text, +
            medication_name: medicationName.text, +
            frequency: frequency.text, +
            is_prn: isPrn.text, +
            prescribed_qty: prescrQuantity.text, +
            refill: refills.text, +
            physician_name: physician.text, +
            date_written: dateWritten.text, +
            discription: comment.text, -
            start_date: dateBegin.text,+
            stop_date: dateEnd.text+
*/
    QJsonValue val = jsonObj.take("device_id");
    int _dev_id = val.toInt();


    QString date = (jsonObj.take("date_written").toString());
    presc.date_written = QDate::fromString(date,"ddMMyyyy");
    presc.patient_id = jsonObj.take("patient_id").toInt();

    //physician_name -> toID
    int id = 0;
    QString name = jsonObj.take("physician_name").toString();
    getIdByPhyName(name, id);
    presc.id = -1;
    presc.physician = id;

    //medication_name
    presc.medication_name = jsonObj.take("medication_name").toString();

    presc.admin_route = jsonObj.take("admin_route").toString();
    presc.admin_method = jsonObj.take("admin_method").toString();
    presc.admin_device = jsonObj.take("admin_device").toString();
    presc.admin_site = jsonObj.take("admin_site").toString();

    // frequency
    presc.frequency = jsonObj.take("frequency").toString();

    //is_prn
    QJsonValue val_is_prn = jsonObj.take("is_prn");
    int _is_prn = val_is_prn.toInt();
    presc.is_prn = _is_prn;

    presc.strength_amount = jsonObj.take("strength_amount").toString();
    presc.strength_uom = jsonObj.take("strength_uom").toString();
    presc.measure_uom = jsonObj.take("measure_uom").toString();
    presc.volume = jsonObj.take("volume").toInt();
    presc.container_uom = jsonObj.take("container_uom").toString();

    //prescribed_qty
    QString qty =  jsonObj.take("prescribed_qty").toString();
    presc.prescribed_qty = qty.toInt();

    QString daw =  jsonObj.take("daw").toString();
    presc.daw = daw.toInt();

    //refill
    QString refill =  jsonObj.take("refill").toString();
    presc.refill = refill.toInt();

    presc.is_discontinued = jsonObj.take("is_discontinued").toString();
    presc.schedule_cnt = jsonObj.take("schedule_cnt").toInt();

    presc.date_written = QDate::currentDate();

    schedule.frequency_code = jsonObj.take("frequency_code").toInt();
    schedule.frequency_description = jsonObj.take("frequency_description").toInt();

    //is_prn
    schedule.is_prn = _is_prn;

    //date_written
    schedule.last_modified = QDate::currentDate().toString("yyy-MM-dd");
    schedule.medication_name = jsonObj.take("medication_name").toInt();
    schedule.medication_strength_amount = jsonObj.take("strength_amount").toInt();
    schedule.medication_strength_uom = jsonObj.take("strength_uom").toInt();


    schedule.device_id = _dev_id;
    schedule.override_times = 1;
    //patient_name
    QStringList sss = jsonObj.take("patient_name").toString().split(" ");
    schedule.patient_first_name = sss.size() > 0 ? sss.first(): "UNKNOWN";
    schedule.patient_last_name = sss.size() > 1 ? sss.at(1) : "UNKNOWN";

    schedule.prescription_is_discontinued = jsonObj.take("prescription_is_discontinued").toInt();
    schedule.schedule_is_discontinued = jsonObj.take("schedule_is_discontinued").toInt();
    //start_date
    schedule.start_date = jsonObj.take("start_date").toString();
    //stop_date
    schedule.stop_date = jsonObj.take("stop_date").toString();
    presc.schedule = schedule;
    QString err;
    insertPrescription(presc,err);
}

bool DatabaseWorker::insertPrescription(const Prescription &presc, QString &error)
{
    QSqlQuery query;
    QString sql_query;
    sql_query = "CALL insert_prescription (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    if(!query.prepare(sql_query)) {
        error = "Fail preparation stored procedure " + sql_query;
        return false;
    }
    query.bindValue(0, QVariant(presc.date_written), QSql::In);
    query.bindValue(1, QVariant(presc.patient_id), QSql::In);
    query.bindValue(2, QVariant(presc.physician), QSql::In);
    query.bindValue(3, QVariant(presc.medication_name), QSql::In);
    query.bindValue(4, QVariant(presc.admin_route), QSql::In);
    query.bindValue(5, QVariant(presc.admin_method), QSql::In);
    query.bindValue(6, QVariant(presc.admin_device), QSql::In);
    query.bindValue(7, QVariant(presc.admin_site), QSql::In);
    query.bindValue(8, QVariant(presc.frequency), QSql::In);
    query.bindValue(9, QVariant(presc.is_prn ? "Y" : "N"), QSql::In);
    query.bindValue(10, QVariant(presc.strength_amount), QSql::In);
    query.bindValue(11, QVariant(presc.strength_uom), QSql::In);
    query.bindValue(12, QVariant(0), QSql::In);
    query.bindValue(13, QVariant(presc.measure_uom), QSql::In);
    query.bindValue(14, QVariant(presc.volume), QSql::In);
    query.bindValue(15, QVariant(presc.container_uom), QSql::In);
    query.bindValue(16, QVariant(presc.prescribed_qty), QSql::In);
    query.bindValue(17, QVariant(presc.daw), QSql::In);
    query.bindValue(18, QVariant(presc.refill), QSql::In);
    if(!query.exec()) {
        error = query.lastError().text();
        qWarning() << error;
        return false;
    }
    int _id = -1;
    QString data;
    getLastPrescriptionId(data,_id);
    Schedule schedule = presc.schedule;
    schedule.prescription_id = _id;
    bool bRes = insertSchedule(schedule,error);
    if(bRes)
       emit signPrescSaved(bRes);
    return true;
}

bool DatabaseWorker::insertSchedule(const Schedule &schedule, QString &error)
{
    //mysql 42000 FUNCTION sophic_medical.sm_send_packet does not exist
    QSqlQuery query;
    QString sql_query;

    //sql_query = "CALL create_schedule (?,?,?,?,?)"; doesn`t work
    sql_query = "INSERT INTO sophic_medical.schedule (prescription, device, start_date, stop_date) VALUES('" + QString::number(schedule.prescription_id) +"','" + QString::number(schedule.device_id) + "','" + schedule.start_date + "','" + schedule.stop_date + "')";
    qWarning() << sql_query;
    if(!query.exec(sql_query)) {
        error = query.lastError().text();
        qWarning() << error;
        return false;
    }

    /*
     * FOR STORED PROCEDURE
     * if(!query.prepare(sql_query)) {
        error = "Fail preparation stored procedure " + sql_query;
        return false;
    }

    query.bindValue(0, QVariant(schedule.prescription_id), QSql::In);
    query.bindValue(1, QVariant(schedule.device_id), QSql::In);
    query.bindValue(2, QVariant(schedule.start_date), QSql::In);
    query.bindValue(3, QVariant(schedule.stop_date), QSql::In);
    query.bindValue(4, QVariant(schedule.override_times), QSql::In);
    */

    return true;
}

bool DatabaseWorker::connect(const DbSettings &setting, QString &error)
{
    m_db = QSqlDatabase::addDatabase(setting.type);
    m_db.setDatabaseName(setting.name);
    m_db.setUserName(setting.user);
    m_db.setPassword(setting.password);
    if(m_db.open())
        return true;
    error.append(m_db.lastError().text());
    return false;
}

bool DatabaseWorker::insertPatient(const PatientData &data, QString& error)
{
    QPair<QString,QVariant> keyValue;
    QVector<QPair<QString,QVariant>> values;
    keyValue = QPair<QString,QVariant>("patient_first_name", data.patient_first_name);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("patient_last_name", data.patient_last_name);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("patient_sex", data.patient_sex);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("patient_birthdate", data.patient_birthdate.toString(Qt::ISODate));
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("patient_phone", data.patient_phone);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("patient_address", data.patient_address);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("patient_ssn", data.patient_ssn);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("patient_photo", data.patient_photo);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("device_speaker_volume", data.device_speaker_volume);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("device_speaker_volume_prox", data.device_speaker_volume_prox);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("device_audio_alerts_number", data.device_audio_alerts_number);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("device_audio_alerts_interval", data.device_audio_alerts_interval);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("medication_overdue_period", data.medication_overdue_period);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("device_action_notrcg", data.device_action_notrcg);
    values.append(keyValue);
    keyValue = QPair<QString,QVariant>("patient_is_active", data.patient_is_active);
    values.append(keyValue);
    return callProcedureInput("insert_patient", values, error);
}

bool DatabaseWorker::getAllPatients(QVector<PatientData> &patients, QString& error)
{
    QString sql_text = "CALL select_patient";
    QSqlQuery query;
    if(!query.exec(sql_text)) {
        error = query.lastError().text();
        return false;
    }
    while (query.next()) {
        PatientData pData;
        int ind_id     = query.record().indexOf("id");
        int ind_fn      = query.record().indexOf("first_name");
        int ind_ln       = query.record().indexOf("last_name");
        pData.id = query.value(ind_id).toInt();
        pData.patient_first_name = query.value(ind_fn).toString();
        pData.patient_last_name = query.value(ind_ln).toString();
        patients.append(pData);
    }
    return true;
}

bool DatabaseWorker::getAllPatients(const QString &procedureName, QVector<PatientData> &patients, QString& error)
{
    Q_UNUSED(procedureName)
    Q_UNUSED(patients)
    Q_UNUSED(error)
    return false;
    /* QSqlQuery query;
    QString sql_query;
    sql_query = "CALL select_patient (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    if(!query.prepare(sql_query)) {
        error = "Fail preparation stored procedure " + sql_query;
        return false;
    }
    query.bindValue(0, QVariant(presc.date_written), QSql::In);
    query.bindValue(1, QVariant(presc.patient_id), QSql::In);
    query.bindValue(2, QVariant(presc.physician), QSql::In);
    query.bindValue(3, QVariant(presc.medication_name), QSql::In);
    query.bindValue(4, QVariant(presc.admin_route), QSql::In);
    query.bindValue(5, QVariant(presc.admin_method), QSql::In);
    query.bindValue(6, QVariant(presc.admin_device), QSql::In);
    query.bindValue(7, QVariant(presc.admin_site), QSql::In);
    query.bindValue(8, QVariant(presc.frequency), QSql::In);
    query.bindValue(9, QVariant(presc.is_prn ? "Y" : "N"), QSql::In);
    query.bindValue(10, QVariant(presc.strength_amount), QSql::In);
    query.bindValue(11, QVariant(presc.strength_uom), QSql::In);
    query.bindValue(12, QVariant(0), QSql::In);
    query.bindValue(13, QVariant(presc.measure_uom), QSql::In);
    query.bindValue(14, QVariant(presc.volume), QSql::In);
    query.bindValue(15, QVariant(presc.container_uom), QSql::In);
    query.bindValue(16, QVariant(presc.prescribed_qty), QSql::In);
    query.bindValue(17, QVariant(presc.daw), QSql::In);
    query.bindValue(18, QVariant(presc.refill), QSql::In);
    if(!query.exec()) {
        error = query.lastError().text();
        qWarning() << error;
        return false;
    }
    int _id = -1;
    QString data;
    getLastPrescriptionId(data,_id);
    Schedule schedule = presc.schedule;
    schedule.prescription_id = _id;
    insertSchedule(schedule,error);
    return true;

    return -1;
    QVector<QMap<QString, QVariant>> outputData;
    bool bRes = callProcedureOutput("patient", procedureName,outputData, error);
    if(!bRes)
        return false;
    for(int i = 0; i < outputData.size(); i++ ) {
        QMap<QString, QVariant> map = outputData.at(i);
        PatientData pData;
        pData.id = map["id"].toInt();
        pData.patient_first_name = map["first_name"].toString();
        pData.patient_last_name = map["last_name"].toString();
        pData.patient_sex = map["sex"].toString();
        pData.patient_birthdate = QDate::fromString(map["date_of_birth"].toString(),"yyyy-MM-dd");
        pData.patient_phone = map["phone"].toString();
        pData.patient_address = map["address"].toString();
        pData.patient_ssn = map["ssn"].toString();
        pData.patient_photo = map["photo"].toString();
        pData.device_speaker_volume = map["speaker_volume"].toInt();
        pData.device_speaker_volume_prox = map["speaker_volume_prox"].toInt();
        pData.device_audio_alerts_number = map["audio_alerts_number"].toInt();
        pData.device_audio_alerts_interval = map["audio_alerts_interval"].toInt();
        pData.medication_overdue_period = map["overdue_period"].toInt();
        pData.device_action_notrcg = map["action_notrcg"].toString();
        pData.patient_is_active = map["is_active"].toString();
        pData.lastModify = map["last_modified"].toDate();
        pData.patient_is_active = map["is_active"].toString();
        patients.append(pData);
    }
    return bRes;*/
}

bool DatabaseWorker::getAllDevices (QVector<Emilia_device> &devices, QString& error)
{
    QString sql_text = "CALL select_device";
    QSqlQuery query;
    if(!query.exec(sql_text)) {
        error = query.lastError().text();
        return false;
    }
    while (query.next()) {
        Emilia_device pData;
        int ind_id     = query.record().indexOf("id");
        int ind_area_id       = query.record().indexOf("area");
        int ind_area_name       = query.record().indexOf("area_name");
        int ind_household_address     = query.record().indexOf("household_address");
        int ind_is_active        = query.record().indexOf("is_active");
        pData.id = query.value(ind_id).toInt();
        pData.area_id = query.value(ind_area_id).toInt();
        pData.household_address = query.value(ind_household_address).toString();
        pData.is_active = query.value(ind_is_active).toBool();
        pData.area_name = query.value(ind_area_name).toString();
        devices.append(pData);
    }
    return true;
}

bool DatabaseWorker::getAllPhysician(QMap<int, Physician> &physicians, QString &error)
{
    QString sql_text = "CALL select_physician";
    QSqlQuery query;
    if(!query.exec(sql_text)) {
        error = query.lastError().text();
        return false;
    }
    while (query.next()) {
        Physician physician;
        int ind_physician     = query.record().indexOf("physician");
        int ind_id        = query.record().indexOf("id");

        physician.name = query.value(ind_physician).toString();
        physician.id = query.value(ind_id).toInt();
        physicians[physician.id] = physician;
    }
    return true;
}

bool DatabaseWorker::getScheduleByDeviceId(const int &id, QVector<Schedule> &schedules, QString &error)
{
    QString sql_text = "CALL select_schedule_by_device(" + QString::number(id) + ")";
    QSqlQuery query;

    if(!query.exec(sql_text))
    {
        error = query.lastError().text();
        return false;
    }
    while (query.next()) {
        Schedule schedule_data;
        int ind_id    = query.record().indexOf("id");
        int ind_prescription_id     = query.record().indexOf("prescription_id");
        int ind_medication_name        = query.record().indexOf("medication_name");
        int ind_medication_strength_amount      = query.record().indexOf("medication_strength_amount");
        int ind_medication_strength_uom       = query.record().indexOf("medication_strength_uom");
        int ind_frequency_code        = query.record().indexOf("frequency_code");
        int ind_frequency_description        = query.record().indexOf("frequency_description");
        int ind_is_prn       = query.record().indexOf("is_prn");
        int ind_patient_first_name      = query.record().indexOf("patient_first_name");
        int ind_patient_last_name       = query.record().indexOf("patient_last_name");
        int ind_start_date     = query.record().indexOf("start_date");
        int ind_stop_date     = query.record().indexOf("stop_date");
        int ind_schedule_is_discontinued = query.record().indexOf("schedule_is_discontinued");
        int ind_prescription_is_discontinued = query.record().indexOf("prescription_is_discontinued");
        int ind_last_modified = query.record().indexOf("last_modified");
        schedule_data.id = query.value(ind_id).toInt();
        schedule_data.prescription_id = query.value(ind_prescription_id).toInt();
        schedule_data.medication_name = query.value(ind_medication_name).toString();
        schedule_data.medication_strength_amount = query.value(ind_medication_strength_amount).toString();
        schedule_data.medication_strength_uom = query.value(ind_medication_strength_uom).toString();
        schedule_data.frequency_code = query.value(ind_frequency_code).toString();
        schedule_data.frequency_description = query.value(ind_frequency_description).toString();
        schedule_data.is_prn = query.value(ind_is_prn).toString();
        schedule_data.patient_first_name = query.value(ind_patient_first_name).toString();
        schedule_data.patient_last_name = query.value(ind_patient_last_name).toString();
        schedule_data.start_date = query.value(ind_start_date).toString();
        schedule_data.stop_date = query.value(ind_stop_date).toString();
        schedule_data.schedule_is_discontinued = query.value(ind_schedule_is_discontinued).toString();
        schedule_data.prescription_is_discontinued = query.value(ind_prescription_is_discontinued).toString();
        schedule_data.last_modified = query.value(ind_last_modified).toString();
        schedules.append(schedule_data);
    }
    return true;
}

bool DatabaseWorker::getPrescriptionsPatientAndDevice(const int &patient_id, const int &device_id, QVector<Prescription> &prescriptions, QString &error)
{
    QString sql_text = "CALL select_schedule_by_patient(" + QString::number(patient_id) + ")";
    QSqlQuery query;
    if(!query.exec(sql_text))
    {
        error = query.lastError().text();
        return false;
    }
    QVector<int> prescriptions_ids;
    while (query.next()) {
        Schedule schedule;
        int ind_sch_id    = query.record().indexOf("id");// <----
        int ind_prescription_id     = query.record().indexOf("prescription");// <----
        int ind_start_date        = query.record().indexOf("start_date");
        int ind_stop_date     = query.record().indexOf("stop_date");
        int ind_device       = query.record().indexOf("device"); // <----
        int ind_last_modified        = query.record().indexOf("last_modified");

        bool check = false;

        int prescription_id = query.value(ind_prescription_id).toInt();
        schedule.prescription_id = prescription_id;
        schedule.id = query.value(ind_sch_id).toInt();
        int device_id_ = query.value(ind_device).toInt();
        schedule.start_date = query.value(ind_start_date).toString();
        schedule.stop_date = query.value(ind_stop_date).toString();
        schedule.last_modified =  query.value(ind_last_modified).toString();
        if(device_id_ == device_id) {
            Prescription presc;
            QString err;
            bool bRes = getPrescriptionByPrescriptionId(prescription_id,presc,err);
            if (bRes) {
                presc.schedule = schedule;
                prescriptions.append(presc);
            }
        }
    }
    return true;
}

bool DatabaseWorker::getPrescriptionsByPatientId(const int &patient_id, QVector<Prescription> &prescriptions, QString &error)
{
    QString sql_text = "CALL select_prescription_by_patient(" + QString::number(patient_id) + ")";
    QSqlQuery query;
    if(!query.exec(sql_text))
    {
        error = query.lastError().text();
        return false;
    }
    QString phErr;
    QMap<int, Physician> physicians;
    bool bPh = getAllPhysician(physicians, phErr);
    while (query.next()) {
        Prescription prescription;
        int ind_id   = query.record().indexOf("id");
        int ind_date_written     = query.record().indexOf("date_written");
        int ind_patient_id        = query.record().indexOf("patient");
        int ind_physician      = query.record().indexOf("physician");
        int ind_medication_name       = query.record().indexOf("medication_name");
        int ind_admin_route        = query.record().indexOf("admin_route");
        int ind_admin_method        = query.record().indexOf("admin_method");
        int ind_admin_device       = query.record().indexOf("admin_device");
        int ind_admin_site      = query.record().indexOf("admin_site");
        int ind_frequency       = query.record().indexOf("frequency");
        int ind_is_prn     = query.record().indexOf("is_prn");
        int ind_strength_amount     = query.record().indexOf("strength_amount");
        int ind_strength_uom       = query.record().indexOf("strength_uom");
        int ind_measure_uom = query.record().indexOf("measure_uom");
        int ind_volume = query.record().indexOf("volume");
        int ind_container_uom = query.record().indexOf("container_uom");
        int ind_prescribed_qty = query.record().indexOf("prescribed_qty");
        int ind_daw = query.record().indexOf("daw");
        int ind_refilla = query.record().indexOf("refill");
        int ind_is_discontinued = query.record().indexOf("is_discontinued");
        int ind_schedule_cnt = query.record().indexOf("schedule_cnt");
        prescription.id = query.value(ind_id).toInt();
        prescription.date_written = query.value(ind_date_written).toDate();
        prescription.patient_id = query.value(ind_patient_id).toInt();
        prescription.physician = query.value(ind_physician).toInt();
        prescription.medication_name = query.value(ind_medication_name).toString();
        prescription.admin_route = query.value(ind_admin_route).toString();
        prescription.admin_method = query.value(ind_admin_method).toString();
        prescription.admin_device = query.value(ind_admin_device).toString();
        prescription.admin_site = query.value(ind_admin_site).toString();
        prescription.frequency = query.value(ind_frequency).toString();
        prescription.is_prn = query.value(ind_is_prn).toString() == "Y";
        prescription.strength_amount = query.value(ind_strength_amount).toString();
        prescription.strength_uom = query.value(ind_strength_uom).toString();
        prescription.measure_uom = query.value(ind_measure_uom).toString();
        prescription.volume = query.value(ind_volume).toInt();
        prescription.container_uom = query.value(ind_container_uom).toString();
        prescription.prescribed_qty = query.value(ind_prescribed_qty).toInt();
        prescription.daw = query.value(ind_daw).toInt();
        prescription.refill = query.value(ind_refilla).toInt();
        prescription.is_discontinued = query.value(ind_is_discontinued).toString();
        prescription.schedule_cnt = query.value(ind_schedule_cnt).toInt();
        if(bPh)
            prescription.physician_name = physicians[prescription.physician].name;
    }
}

bool DatabaseWorker::getPrescriptionByPrescriptionId(const int &prescription_id, Prescription &prescription, QString &error)
{
    QString sql_text = "CALL select_prescription_by_id(" + QString::number(prescription_id) + ")";
    QSqlQuery query;
    if(!query.exec(sql_text))
    {
        error = query.lastError().text();
        return false;
    }
    QString phErr;
    QMap<int, Physician> physicians;
    bool bPh = getAllPhysician(physicians, phErr);
    while (query.next()) {
        int ind_date_written     = query.record().indexOf("date_written");
        int ind_patient_id        = query.record().indexOf("patient");
        int ind_physician      = query.record().indexOf("physician");
        int ind_medication_name       = query.record().indexOf("medication_name");
        int ind_admin_route        = query.record().indexOf("admin_route");
        int ind_admin_method        = query.record().indexOf("admin_method");
        int ind_admin_device       = query.record().indexOf("admin_device");
        int ind_admin_site      = query.record().indexOf("admin_site");
        int ind_frequency       = query.record().indexOf("frequency");
        int ind_is_prn     = query.record().indexOf("is_prn");
        int ind_strength_amount     = query.record().indexOf("strength_amount");
        int ind_strength_uom       = query.record().indexOf("strength_uom");
        int ind_measure_uom = query.record().indexOf("measure_uom");
        int ind_volume = query.record().indexOf("volume");
        int ind_container_uom = query.record().indexOf("container_uom");
        int ind_prescribed_qty = query.record().indexOf("prescribed_qty");
        int ind_daw = query.record().indexOf("daw");
        int ind_refilla = query.record().indexOf("refill");
        int ind_is_discontinued = query.record().indexOf("is_discontinued");
        int ind_schedule_cnt = query.record().indexOf("schedule_cnt");
        prescription.date_written = query.value(ind_date_written).toDate();
        prescription.patient_id = query.value(ind_patient_id).toInt();
        prescription.physician = query.value(ind_physician).toInt();
        prescription.medication_name = query.value(ind_medication_name).toString();
        prescription.admin_route = query.value(ind_admin_route).toString();
        prescription.admin_method = query.value(ind_admin_method).toString();
        prescription.admin_device = query.value(ind_admin_device).toString();
        prescription.admin_site = query.value(ind_admin_site).toString();
        prescription.frequency = query.value(ind_frequency).toString();
        prescription.is_prn = query.value(ind_is_prn).toString() == "Y";
        prescription.strength_amount = query.value(ind_strength_amount).toString();
        prescription.strength_uom = query.value(ind_strength_uom).toString();
        prescription.measure_uom = query.value(ind_measure_uom).toString();
        prescription.volume = query.value(ind_volume).toInt();
        prescription.container_uom = query.value(ind_container_uom).toString();
        prescription.prescribed_qty = query.value(ind_prescribed_qty).toInt();
        prescription.daw = query.value(ind_daw).toInt();
        prescription.refill = query.value(ind_refilla).toInt();
        prescription.is_discontinued = query.value(ind_is_discontinued).toString();
        prescription.schedule_cnt = query.value(ind_schedule_cnt).toInt();
        if(bPh)
            prescription.physician_name = physicians[prescription.physician].name;
    }
    return true;
}

bool DatabaseWorker::getPhysicianById(const int &id, Physician &physician, QString &error)
{
    bool bRes;
    QMap<int, Physician> map;
    bRes = getAllPhysician(map,error);
    if(!bRes) return false;
    bRes = map.contains(id);
    if(!bRes) {
        error = "Couldn`t find the key";
        return false;
    }
    physician = map[id];
    return bRes;
}


bool DatabaseWorker::callProcedureInput(const QString &procedureName, const QVector<QPair<QString, QVariant>> &values, QString &error)
{
    QSqlQuery query;
    QString data_for_query, sql_query;
    data_for_query.clear();
    QStringList ddd;
    sql_query.clear();
    for (int i = 0; i < values.size(); ++i) {
        QString key = "?";
        ddd.append(key);
    }
    data_for_query = ddd.join(", ");
    sql_query = "CALL " + procedureName + "(" + data_for_query + ")";
    if(!query.prepare(sql_query)) {
        error = "Fail preparation stored procedure " + procedureName;
        return false;
    }
    for (int i = 0; i < values.size(); ++i) {
        QPair<QString,QVariant> keyValue = values.at(i);
        query.bindValue(i, keyValue.second, QSql::In);
    }
    if(!query.exec()) {
        error = query.lastError().text();
        return false;
    }
    return true;
}

bool DatabaseWorker::callProcedureOutput(const QString &tableName,
                                         const QString &procedureName,
                                         QVector<QMap<QString, QVariant> > &outputData,
                                         QString &error, const QMap<QString, QVariant> &paramenters)
{
    QStringList columnNames;
    QSqlQuery query("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '" + tableName + "'");
    while (query.next()) {
        columnNames.append(query.value(0).toString());
    }
    QString data_for_query, sql_query;
    data_for_query.clear();
    QStringList ddd;
    sql_query.clear();
    for (int i = 0; i < paramenters.count(); ++i) {
        ddd.append("?");
    }
    data_for_query = ddd.join(", ");
    sql_query = "CALL " + procedureName;
    if(!query.exec(sql_query)) {
        error = query.lastError().text();
        return false;
    }
    while (query.next()) {
        QMap<QString, QVariant> map;
        for (int i = 0; i < columnNames.size(); i++)
            map[columnNames.at(i)] = query.value(i);
        outputData.append(map);
    }
    return true;
}
