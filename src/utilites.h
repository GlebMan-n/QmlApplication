#ifndef UTILITES_H
#define UTILITES_H

#include <QObject>
#include <QTime>
#include <QDebug>

class Utilites : public QObject
{
    Q_OBJECT
public:
    explicit Utilites(QObject *parent = nullptr);
    static QString getTimeMask () {return "hh:mmAP";}
    Q_INVOKABLE int compareTime(QString time1, QString time2);
    Q_INVOKABLE bool checkTime(QString time) {
        return QTime::fromString(time,getTimeMask()).isValid();
    }
signals:
private:
};

#endif // UTILITES_H
