#include "orderintaketable.h"
#include <QQmlEngine>

#include <QQuickView>
#include <QObject>


OrderIntakeTable::OrderIntakeTable(QObject *parent) : QAbstractTableModel(parent)
{
    //qmlRegisterInterface<OrderIntakeTable>("OrderIntakeTable");
    //qmlRegisterType<OrderIntakeTable>("OrderIntakeTable", 1, 0, "OrderIntakeTable");
}

int OrderIntakeTable::rowCount(const QModelIndex& /*index*/) const
{
    return _userData.size();
}

int OrderIntakeTable::columnCount(const QModelIndex& /*index*/) const
{
    return _userData.empty() ? 0 : ColumnName::Count;
}

QVariant OrderIntakeTable::getDataForCell(const int& row, const int&  col, const int& role) const {
    QVariant out;
    switch (role) {
    case Qt::DisplayRole:
        if ((0 <= row) && (_userData.size() > row)) {
            const auto &userData = _userData.at(row);
            switch (col) {
            case ColumnName::Checked:
                out = false;
            break;
            case ColumnName::Status:
                out = userData.status;
            break;
            case ColumnName::Auth:
                out = userData.auth;
            break;
            case ColumnName::Edit:
                out = userData.edit;
            break;
            case ColumnName::PatientName:
                out = userData.patientName;
            break;
            case ColumnName::MedicationName:
                out = userData.medicationName;
            break;
            case ColumnName::DataWritten:
                out = userData.dateWritten.toString("MM/dd/yyyy");
            break;
            case ColumnName::StartDate:
                out = userData.startDate.toString("MM/dd/yyyy");
            break;
            case ColumnName::StopDate:
                out = userData.stopDate.toString("MM/dd/yyyy");
            break;
            }
        }
        break;
    default:
        break;
    }
    return out;
}

QVariant OrderIntakeTable::data(const QModelIndex &index, int role) const
{
    if(_userData.empty()) return false;
    switch (role) {
        case Qt::DisplayRole:
            return getDataForCell(index.row(), index.column(), role);
        default:
        break;
    }
    return QVariant();
}

QHash<int, QByteArray> OrderIntakeTable::roleNames() const
{
    static const auto roles = QHash<int, QByteArray>{
        { Qt::DisplayRole, "display" }
    };
    return roles;
}

QString OrderIntakeTable::columnName(int index) const
{
    QString out;
    switch (index) {
    case Status:
        out = "";
        break;
    case Auth:
        out = tr("Auth.");
        break;
    case Edit:
        out = tr("Edit");
        break;
    case PatientName:
        out = tr("Patient Name");
        break;
    case MedicationName:
        out = tr("Medication Name");
        break;
    case DataWritten:
        out = tr("Data Written");
        break;
    case StartDate:
        out = tr("Start Date");
        break;
    case StopDate:
        out = tr("Stop Date");
        break;
    }
    return out;
}

bool OrderIntakeTable::checked(int row, int col) const
{
    if(_userData.empty()) return false;
    if ((col == Checked) && (0 <= row) && (row < _userData.size())) {
        return _userData.at(row).checked;
    }
    return false;
}

void OrderIntakeTable::setChecked(int row, bool value)
{
    if ((0 <= row) && (_userData.size() > row) && (_userData.at(row).checked != value)) {
        emit layoutAboutToBeChanged();
        _userData[row].checked = value;
        emit layoutChanged();
    }
}

void OrderIntakeTable::onTableClicked(int row, int col)
{
    Q_UNUSED(row)
    Q_UNUSED(col)
}

QString OrderIntakeTable::get_patient_name(int row)
{

    return _userData.empty()? "" : _userData.at(row).patientName;
}

QString OrderIntakeTable::get_medication_name(int row) {
    return _userData.empty()? "" :_userData.at(row).medicationName;
}

QString OrderIntakeTable::get_frequency(int row) {
    return _userData.empty()? "" :_userData.at(row).prescription.frequency;
}

bool OrderIntakeTable::get_is_prn(int row) {
    if(_userData.empty()) return "";
    return _userData.at(row).prescription.is_prn;
}

QString OrderIntakeTable::get_prescribed_qty(int row) {
    if(_userData.empty()) return "";
    return QString::number(_userData.at(row).prescription.prescribed_qty);
}

QString OrderIntakeTable::get_refill(int row) {
     if(_userData.empty()) return "";
    return QString::number(_userData.at(row).prescription.refill);
}

QString OrderIntakeTable::get_physician_name(int row) {
    return _userData.empty()? "" :_userData.at(row).prescription.physician_name;
}

QString OrderIntakeTable::get_date_written(int row) {
     if(_userData.empty()) return "";
   return _userData.at(row).prescription.date_written.toString("MM/dd/yyyy");
}

QString OrderIntakeTable::get_discription(int row) {
    Q_UNUSED(row)
    return "NO COMMENT";
}

QString OrderIntakeTable::get_disp_as_written(int row) {
    return _userData.empty()? "" :QString::number(_userData.at(row).prescription.daw);
}

void OrderIntakeTable::onTimer()
{
    const QDate now = QDate::currentDate();
    QString err;

    if(!m_worker) {
        m_worker = new DatabaseWorker(this);
        bool bRes;

        DbSettings settings;
        settings.name = "sophic_medical";
        settings.user = "sophic_medical";
        settings.password = "12345678";
        settings.type = "QMYSQL";
        bRes = m_worker->connect(settings,err);
        if(!bRes) {
            qWarning() << err;
            return;
        }
    }
    _userData.clear();
    QVector<PatientData> patientData;
    m_worker->getAllPatients("select_patient",patientData,err);
    for(int i=0; i < patientData.size(); i++)
    {
        UserData data(
                    StatusCartrige,
                    AuthUserGreen,
                    EditNone,
                    patientData.at(i).patient_first_name + " " + patientData.at(i).patient_last_name,
                    patientData.at(i).prescription.medication_name,
                    patientData.at(i).prescription.date_written,
                    now,
                    now,
                    patientData.at(i).prescription
                    );
        _userData.append(data);
    }
    setRowCount(_userData.size());

    emit updateUI();

    QVector<Emilia_device> deviceData;
    m_worker->getAllDevices(deviceData,err);

    for (int i=0; i < deviceData.size(); i++) {
        qWarning() << deviceData.at(i).household_address << " "  << deviceData.at(i).area_name;
    }
}
