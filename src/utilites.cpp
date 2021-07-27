#include "utilites.h"
#include <QDebug>

Utilites::Utilites(QObject *parent) : QObject(parent)
{
}

int Utilites::compareTime(QString time1, QString time2)
{

    QTime qTime1 = QTime::fromString(time1, getTimeMask());
    QTime qTime2 = QTime::fromString(time2, getTimeMask());
    if(!qTime1.isValid() || !qTime2.isValid() || qTime1 == qTime2) {
        qWarning() << time1 << " == " << time2;
        return -1;
    }
    if(qTime1 > qTime2) {
        qWarning() << time1 << " > " << time2;
        return 1;
    }
    else {
        qWarning() << time1 << " < " << time2;
        return 0;
    }
}
