#include "canisters.h"

Canisters::Canisters(QObject *parent)
{

}

void Canisters::getCanisters()
{
    QJsonArray jsonArray;

    QJsonArray rowCanisters;

    QSqlQuery q;
    if(!q.exec("CALL select_canister()")){
        //@TODO logger Class
        qDebug()<< m_db.lastError().text();
    } else {

        for(int i = 1; q.next(); ++i){

            // calculate position
            int position = q.value("location").toInt() % 12;
            int location = (position == 0) ? 12 : position;
            double row = ceil(q.value("location").toDouble() / 12.0);

            int ststus = (location) ? 1 : 0;

            QJsonObject canister;
            canister["col_num"] = location;
            canister["status"] = ststus;
            canister["qty"] = q.value("quantity").toInt();
            canister["medication_trade_name"] = q.value("medication_trade_name").toString();
            canister["qr_code"] = "";
            canister["tall_man"] = q.value("tallman").toString();
            canister["generic_madication_name"] = q.value("generic_madication_name").toString();
            canister["ndc"] = q.value("ndc_code").toString();
            canister["strength"] = q.value("strength").toString();
            canister["low_threshold"] = q.value("low_threshold").toString();
            canister["uom"] = q.value("uom").toString();
            canister["location"] = q.value("location").toInt();
            canister["number"] = row;

            rowCanisters.append(canister);
        }

        for(int row = 1; row != 10; ++row){
            QJsonArray arrCanisters;

            for(int col = 1; col != 13; ++col){
                bool isEmptyCanister = false;

                for(int i = 0; i < rowCanisters.size(); ++i){
                    QJsonObject jo = rowCanisters[i].toObject();

                    if(jo["number"].toInt() == row && jo["col_num"].toInt() == col){
                        isEmptyCanister = true;
                        arrCanisters.append(jo);
                        // @TODO del element jo[#]
                        break;
                    }
                }
                if(!isEmptyCanister){
                    int location = (row == 1) ? col : ((row - 1) * 12) + col;

                    arrCanisters.append(emptyCanister(col, location));
                }
            }

            QJsonObject canistersRow;
            canistersRow["number"] = row;
            canistersRow["med"] = arrCanisters;

            jsonArray.append(canistersRow);
        }
    }

    emit returnCanisters(jsonArray);
}

void Canisters::updateCanister(const QMap<QString, QVariant> &data)
{
    QSqlQuery q;

    if(!q.prepare("CALL update_canister(:val0,:val1,:val2,:val3,:val4,:val5,:val6,:val7,:val8)")) {
        qDebug() << "Prepare update_canister error";
        return;
    }

    qDebug() << data;

    q.bindValue(":val0", data["ndc_code"]);
    q.bindValue(":val1", data["generic_madication_name"]);
    q.bindValue(":val2", data["medication_trade_name"]);
    q.bindValue(":val3", data["low_threshold"]);
    q.bindValue(":val4", data["uom"]);
    q.bindValue(":val5", data["tallman"]);
    q.bindValue(":val6", data["strength"]);
    q.bindValue(":val7", data["quantity"]);
    q.bindValue(":val8", data["location"]);

    if(!q.exec()){
        qDebug()<< m_db.lastError().text();
        return;
    }

    getCanisters();
}

void Canisters::addCanister(const QMap<QString, QVariant> &data)
{

}

QJsonObject Canisters::emptyCanister(int col, int location)
{
    QJsonObject canister;

    canister["col_num"] = col;
    canister["status"] = 0;
    canister["qty"] = 0;
    canister["medication_trade_name"] = "";
    canister["qr_code"] = "";
    canister["tall_man"] = "";
    canister["generic_madication_name"] = "";
    canister["ndc"] = "";
    canister["strength"] = "";
    canister["low_threshold"] = "";
    canister["uom"] = "";
    canister["location"] = location;
    return canister;
}
