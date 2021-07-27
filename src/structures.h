#ifndef STRUCTURES_H
#define STRUCTURES_H
#include <QMap>
#include <QVector>
#include <QVariant>
#include <QString>
#include <QSqlDatabase>
#include <QDate>
#include <QPair>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include "utilites.h"

static QVector<QDate> getDates(const QDate& start_date,const QDate& stop_date)
{
    QVector<QDate> result;
    if(!start_date.isValid())
        return result;
    result.append(start_date);
    if(!stop_date.isValid() || start_date == stop_date)
        return result;
    qint64 start_date_int = start_date.toJulianDay();
    qint64 stop_date_int = stop_date.toJulianDay();
    if(stop_date_int < start_date_int)
        return result;
    qint64 current = start_date_int;
    while (true)
    {
        current++;
        if(current > stop_date_int)
            return result;
        result.append(QDate::fromJulianDay(current));
    }
    return result;
}

static int getSizeFromeFreq(const QString& freq) {
    if(freq == "QID")
        return 3;
    if(freq == "TID")
        return 3;
    if(freq == "BID")
        return 2;
    if(freq == "QD" || freq == "ONCE" ) // ONCE A DAY
        return 1;
    qWarning() << freq;
    return 0;
}

static int calculateQtyPerBin(const QString& freq, const int& days, const int& presc_qty)
{
    int perDay = getSizeFromeFreq(freq);
    int perDose = (presc_qty/days) / perDay;
    if(perDose == 0) perDose = 1;
    return perDose;
}

struct DbSettings {
    QString type;
    QString name;
    QString user;
    QString password;
};

struct Schedule {
    Schedule() {}

    const Schedule &operator = (const Schedule  &ext)
    {
        if(this == &ext)
            return *this;
        id                  = ext.id;
        prescription_id             = ext.prescription_id;
        medication_name           = ext.medication_name;
        device_id                   = ext.device_id;
        medication_strength_amount   = ext.medication_strength_amount;
        medication_strength_uom           = ext.medication_strength_uom;
        medication_strength_uom           = ext.medication_strength_uom;
        frequency_code           = ext.frequency_code;
        frequency_description           = ext.frequency_description;
        is_prn           = ext.is_prn;
        patient_first_name           = ext.patient_first_name;
        patient_last_name           = ext.patient_last_name;
        start_date           = ext.start_date;
        stop_date           = ext.stop_date;
        schedule_is_discontinued           = ext.schedule_is_discontinued;
        prescription_is_discontinued           = ext.prescription_is_discontinued;
        last_modified           = ext.last_modified;
        override_times = ext.override_times;
        return *this;
    }
    int             id;
    int             prescription_id;
    int             device_id;
    QString         medication_name;
    QString         medication_strength_amount;
    QString         medication_strength_uom;
    QString         frequency_code;
    QString         frequency_description;
    QString         is_prn;
    QString         patient_first_name;
    QString         patient_last_name;
    QString         start_date;
    QString         stop_date;
    QString         schedule_is_discontinued;
    QString         prescription_is_discontinued;
    QString         last_modified;
    QString         override_times;
};

struct Physician {
    Physician() {}
    const Physician &operator = (const Physician  &presc)
    {
        if(this == &presc)
            return *this;
        id = presc.id;
        name = presc.name;
        return *this;
    }
    int id;
    QString name;
};

struct Prescription {
    Prescription() {}
    Prescription(const Prescription& presc)
    {
        id = presc.id;
        date_written = presc.date_written;
        patient_id = presc.patient_id;
        physician = presc.physician;
        medication_name = presc.medication_name;
        admin_route = presc.admin_route;
        admin_method = presc.admin_method;
        admin_device = presc.admin_device;
        admin_site = presc.admin_site;
        frequency = presc.frequency;
        is_prn = presc.is_prn;
        strength_amount = presc.strength_amount;
        strength_uom = presc.strength_uom;
        measure_uom = presc.measure_uom;
        volume = presc.volume;
        container_uom = presc.container_uom;
        prescribed_qty = presc.prescribed_qty;
        daw = presc.daw;
        refill = presc.refill;
        is_discontinued = presc.is_discontinued;
        schedule_cnt = presc.schedule_cnt;
        physician_name = presc.physician_name;
        schedule = presc.schedule;
    }

    const Prescription &operator = (const Prescription  &presc)
    {

        if(this == &presc)
            return *this;
        id = presc.id;
        date_written = presc.date_written;
        patient_id = presc.patient_id;
        physician = presc.physician;
        medication_name = presc.medication_name;
        admin_route = presc.admin_route;
        admin_method = presc.admin_method;
        admin_device = presc.admin_device;
        admin_site = presc.admin_site;
        frequency = presc.frequency;
        is_prn = presc.is_prn;
        strength_amount = presc.strength_amount;
        strength_uom = presc.strength_uom;
        measure_uom = presc.measure_uom;
        volume = presc.volume;
        container_uom = presc.container_uom;
        prescribed_qty = presc.prescribed_qty;
        daw = presc.daw;
        refill = presc.refill;
        is_discontinued = presc.is_discontinued;
        schedule_cnt = presc.schedule_cnt;
        physician_name = presc.physician_name;
        schedule = presc.schedule;
        return *this;
    }
    int     id;
    QDate   date_written;
    int     patient_id;
    int     physician;
    QString medication_name;
    QString admin_route;
    QString admin_method;
    QString admin_device;
    QString admin_site;
    QString frequency;
    bool    is_prn;
    QString strength_amount;
    QString strength_uom;
    QString measure_uom;
    int     volume;
    QString container_uom;
    int     prescribed_qty;
    int     daw;
    int     refill;
    QString is_discontinued;
    int     schedule_cnt;
    QString physician_name;
    Schedule schedule;
};

struct Medi {
    Medi() {}
    Medi(const QString &medi_name, const int &medi_qty, const QString &medi_freq, const int &medi_prn) {
        this->medi_name = medi_name;
        this->medi_qty = medi_qty;
        this->medi_freq = medi_freq;
        this->medi_prn = medi_prn;
    }
    QByteArray toJson() const{
        QJsonObject jsonObj;
        jsonObj.insert("medi_name", QJsonValue(medi_name));
        jsonObj.insert("medi_qty", QJsonValue(medi_qty));
        jsonObj.insert("medi_freq", QJsonValue(medi_freq));
        jsonObj.insert("medi_prn", QJsonValue(medi_prn));
        QJsonDocument jsonOutDoc;
        jsonOutDoc.setObject(jsonObj);
        QByteArray bytes = jsonOutDoc.toJson().simplified();
        return bytes.replace(QByteArray("\n"), QByteArray(""));
    }
    bool fromJson(const QByteArray &ba) {
        QJsonObject jsonObj;
        QJsonDocument jsonOutDoc;
        QJsonParseError error;
        jsonOutDoc  = QJsonDocument::fromJson(ba,&error);
        jsonObj     = jsonOutDoc.object();

        if(error.offset > 0){
            return false;
        }
        medi_name			= jsonObj.take("medi_name").toString();
        medi_qty            = jsonObj.take("medi_qty").toInt();
        medi_freq           = jsonObj.take("medi_freq").toString();
        medi_prn            = jsonObj.take("medi_prn").toInt();
        return true;
    }
    QString medi_name;
    int     medi_qty;
    QString medi_freq;
    int     medi_prn;
};

struct Bin {
    Bin() {
    }
    Bin(const QString& name, const QTime& time) {
        this->name = name;
        this->time = time;
    }
    QByteArray toJson() const {
        QJsonObject jsonObj;
        jsonObj.insert("name", QJsonValue(name));
        jsonObj.insert("time", QJsonValue(time.toString(Utilites::getTimeMask())));
        QStringList list;
        for (auto i = 0; i < medications.size(); i++) {
            QString json_str = QString::fromLatin1((medications.at(i).toJson()));
            list.append(json_str);
        }
        jsonObj.insert("medications", QJsonArray::fromStringList(list));
        QJsonDocument jsonOutDoc;
        jsonOutDoc.setObject(jsonObj);
        QByteArray bytes = jsonOutDoc.toJson().simplified();
        return bytes.replace(QByteArray("\n"), QByteArray(""));
    }
    bool fromJson(const QByteArray &ba) {
        medications.clear();
        QJsonArray ar;
        QJsonObject jsonObj;
        QJsonDocument jsonOutDoc;
        QJsonParseError error;
        jsonOutDoc  = QJsonDocument::fromJson(ba,&error);
        jsonObj     = jsonOutDoc.object();
        if(error.offset > 0)
            return false;
        name			= jsonObj.take("name").toString();
        QString t = jsonObj.take("time").toString();
        time            = QTime::fromString(t,Utilites::getTimeMask());
        ar           = jsonObj.take("medications").toArray();
        QVariantList list = ar.toVariantList();
        for (int i = 0; i < list.size(); i++)
        {
            QJsonObject obj = list.at(i).toJsonObject();
            QJsonDocument doc(obj);
            QByteArray bytes = doc.toJson();
            Medi medi;
            medi.fromJson(bytes);
            medications.append(medi);
        }
        return true;
    }
    void addMedition(const QString &freq, const QString &medi_name, const int& qty, const int& prn)
    {
        Medi medi(medi_name,qty,freq,prn);
        medications.append(medi);
    }
    QString name;
    QTime   time;
    QVector<Medi> medications;
};

struct Day {
    Day() {}
    Day(const QDate& date, const QString &freq, const QString &medi_name, const int& qty, const int& prn)
    {
        this->date = date;
        addMedition(freq,medi_name,qty,prn);
    }
    QByteArray toJson() const{
        QJsonObject jsonObj;
        jsonObj.insert("day", QJsonValue(date.toString("MM.dd.yyyy")));

        QVariantList list;
        for (auto i = 0; i < bins.size(); i++) {
            QByteArray ba = bins.at(i).toJson();
            list.append(ba);
        }
        jsonObj.insert("bins", QJsonArray::fromVariantList(list));
        QJsonDocument jsonOutDoc;
        jsonOutDoc.setObject(jsonObj);
        QByteArray bytes = jsonOutDoc.toJson().simplified();
        return bytes.replace(QByteArray("\n"), QByteArray(""));
    }
    bool fromJson(const QByteArray &ba) {
        bins.clear();
        QJsonArray ar;
        QJsonObject jsonObj;
        QJsonDocument jsonOutDoc;
        QJsonParseError error;
        jsonOutDoc  = QJsonDocument::fromJson(ba,&error);
        jsonObj     = jsonOutDoc.object();
        if(error.offset > 0)
            return false;
        QString dd = jsonObj.take("day").toString();
        date            = QDate::fromString(dd,"MM.dd.yyyy");
        ar              = jsonObj.take("bins").toArray();
        QVariantList list = ar.toVariantList();
        for (int i = 0; i < list.size(); i++)
        {

            QJsonObject obj = list.at(i).toJsonObject();
            QJsonDocument doc(obj);
            QByteArray bytes = doc.toJson();
            Bin bin;
            bin.fromJson(bytes);
            bins.append(bin);
        }
        return true;
    }

    void addMedition(const QString &freq, const QString &medi_name, const int& qty, const int& prn)
    {
        auto i = getSizeFromeFreq(freq);
        while(bins.size() < i)
        {
            int h = 9 + (6*(i-1));
            bins.append(Bin("Bin#",QTime(h,0)));
        }
        for (auto j = 0; j < i; j++) {
            if(bins.size() >= j+1)
                bins[j].addMedition(freq,medi_name,qty,prn);
        }
    }
    QDate date;
    QVector<Bin> bins;
};

struct Plane {
    Plane(){}
    QByteArray toJson() const{
        QJsonObject jsonObj;
        QVariantList list;
        for (auto i = 0; i < days.values().size(); i++) {
            QByteArray ba = days.values().at(i).toJson();
            list.append(ba);
        }
        jsonObj.insert("plane", QJsonArray::fromVariantList(list));
        QJsonDocument jsonOutDoc;
        jsonOutDoc.setObject(jsonObj);
        QByteArray bytes = jsonOutDoc.toJson().simplified();
        return bytes.replace(QByteArray("\n"), QByteArray(""));
    }
    bool fromJson(const QByteArray &ba) {
        days.clear();
        QJsonArray ar;
        QJsonObject jsonObj;
        QJsonDocument jsonOutDoc;
        QJsonParseError error;
        jsonOutDoc  = QJsonDocument::fromJson(ba,&error);
        jsonObj     = jsonOutDoc.object();
        if(error.offset > 0)
            return false;
        ar              = jsonObj.take("plane").toArray();
        QVariantList list = ar.toVariantList();
        for (int i = 0; i < list.size(); i++)
        {
            QJsonObject obj = list.at(i).toJsonObject();
            QJsonDocument doc(obj);
            QByteArray bytes = doc.toJson();
            Day day;
            day.fromJson(bytes);
            days[day.date] = day;
        }
        return true;
    }
    void addMedition(const QDate &begin, const QDate &end, const QString &freq, const QString &medi_name, const int& qty, const int& prn)
    {
        if(begin > end)
        {
            return;
        }
        QVector<QDate> plane_days = getDates(begin,end);
        int qtyPerDose = calculateQtyPerBin(freq,plane_days.size(),qty);
        for(auto i = 0; i < plane_days.size(); i++)
        {
            if(days.contains(plane_days.at(i)))
                days[plane_days.at(i)].addMedition(freq,medi_name,qtyPerDose,prn);
            else
            {
                Day day(plane_days.at(i),freq,medi_name,qtyPerDose,prn);
                days[plane_days.at(i)] = day;
            }
        }
    }
    QMap<QDate,Day> days;
};

struct PatientData {
    PatientData () {}
    int id;
    QString patient_first_name;
    QString patient_last_name;
    QString patient_sex;
    QDate patient_birthdate;
    QString patient_phone;
    QString patient_address;
    QString patient_ssn;
    QString patient_photo;
    int device_speaker_volume;
    int device_speaker_volume_prox;
    int device_audio_alerts_number;
    int device_audio_alerts_interval;
    int medication_overdue_period;
    QString device_action_notrcg;
    QString patient_is_active;
    QDate lastModify;
    Prescription prescription;
};

struct Emilia_device {
    Emilia_device() {}

    const Emilia_device &operator = (const Emilia_device  &ext)
    {
        if(this == &ext)
            return *this;
        id                  = ext.id;
        area_id             = ext.area_id;
        area_name           = ext.area_name;
        household_address   = ext.household_address;
        is_active           = ext.is_active;
        return *this;
    }
    int         id;
    int         area_id;
    QString     area_name;
    QString     household_address;
    bool        is_active;
};

#endif // STRUCTURES_H
