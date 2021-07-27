#include "database.h"

DataBase::DataBase(QObject *parent)
{
     connect();
}

bool DataBase::connect()
{
    m_db = QSqlDatabase::addDatabase("QMYSQL");
    m_db.setHostName("localhost");
    m_db.setPort(3306);
    m_db.setDatabaseName("sophic_medical");
    m_db.setUserName("sophic_medical");
    m_db.setPassword("12345678");

    if(m_db.open()){
        qDebug() << m_db.connectionName();

        return true;
    }

    //@TODO logger
    qDebug()<< m_db.lastError().text();

    return false;
}

bool DataBase::disconnect()
{
    m_db.close();
    m_db.removeDatabase(m_db.connectionName());

    if(!m_db.open())
        return true;

    return false;
}
