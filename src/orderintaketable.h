#pragma once

#include "qmlhelpers.h"
#include <QAbstractTableModel>
#include <QVector>
#include <QDate>
#include <qqml.h>
#include "databaseworker.h"
#include <QTimer>

class OrderIntakeTable : public QAbstractTableModel
{
    Q_OBJECT
    QML_CONSTANT_PROPERTY(int, columnCount, ColumnName::Count)
    QML_READABLE_PROPERTY(int, rowCount, setRowCount, 0)
    QML_WRITABLE_PROPERTY(bool, allChecked, setAllChecked, false)
public:
    enum ColumnName { Checked = 0,
                      Status,
                      Auth,
                      Edit,
                      PatientName,
                      MedicationName,
                      DataWritten,
                      StartDate,
                      StopDate,
                      Count
                    };
    Q_ENUM(ColumnName)
    enum StatusName {
        StatusCartrige,
        StatusVial
    };
    Q_ENUM(StatusName)
    enum AuthName {
        AuthUserGreen,
        AuthUserOrange,
        AuthUserBlue,
        AuthUserMagenda,
        AuthUserPx
    };
    Q_ENUM(AuthName)
    enum EditName {
        EditNone,
        EditUserBlue,
        EditUserGreen
    };
    Q_ENUM(EditName)
    explicit OrderIntakeTable(QObject *parent = nullptr);
    int rowCount(const QModelIndex &index = QModelIndex()) const override;
    int columnCount(const QModelIndex &index = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE QString columnName(int index) const;
    Q_INVOKABLE bool checked(int row, int col) const;
    Q_INVOKABLE void setChecked(int row, bool value);
    Q_INVOKABLE void onTableClicked(int row, int col);
    Q_INVOKABLE QString get_patient_name(int row);
    Q_INVOKABLE QString get_medication_name(int row);
    Q_INVOKABLE QString get_frequency(int row);
    Q_INVOKABLE bool get_is_prn(int row);
    Q_INVOKABLE QString get_prescribed_qty(int row);
    Q_INVOKABLE QString get_refill(int row);
    Q_INVOKABLE QString get_physician_name(int row);
    Q_INVOKABLE QString get_date_written(int row);
    Q_INVOKABLE QString get_discription(int row);
    Q_INVOKABLE QString get_disp_as_written(int row);
private:

    struct UserData {
        UserData(int s, int a, int e, const QString &pn, const QString &mn,
                 const QDate &dw, const QDate &sd, const QDate &ed, const Prescription& presc) :
            status(s), auth(a), edit(e), patientName(pn), medicationName(mn),
            dateWritten(dw), startDate(sd), stopDate(ed), prescription(presc) {}
        bool checked = false;
        int status = StatusCartrige;
        int auth = 0;
        int edit = 0;
        QString patientName;
        QString medicationName;
        QDate dateWritten;
        QDate startDate;
        QDate stopDate;
        Prescription prescription;
    };
    QVector<UserData>   _userData;
    QTimer*             m_timer = nullptr;
    DatabaseWorker*     m_worker = nullptr;

private:
    QVariant getDataForCell(const int& row, const int&  col, const int& role ) const;
public slots:
    void onTimer();
signals:
    void updateUI();
};
