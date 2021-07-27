#ifndef CANISTERS_H
#define CANISTERS_H

#include <QObject>
#include <QtSql>

class Canisters : public QObject
{
    Q_OBJECT
public:
    Canisters(QObject *parent = nullptr);

signals:
    void returnCanisters(QJsonArray data);

public slots:
    void getCanisters(/*count row view*/);
    void updateCanister(const QMap<QString, QVariant>& data = QMap<QString,QVariant>());
    void addCanister(const QMap<QString, QVariant>& data = QMap<QString,QVariant>());

private:
    QJsonObject emptyCanister(int col, int location);

    QSqlDatabase m_db;

};

#endif // CANISTERS_H
