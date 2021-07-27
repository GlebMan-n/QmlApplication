#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QtSql>

class DataBase : public QObject
{
    Q_OBJECT
public:
    DataBase(QObject *parent = nullptr);

public slots:
    bool disconnect();

private:
    bool connect();

    QSqlDatabase m_db;

};

#endif // DATABASE_H
