
function getBinCount(prescription) {
    return 3;
}

function getBinTime(binNumber, prescription) {
    switch (binNumber)
    {
    case 1:
        return "9:00AM";
    case 2:
        return "15:00PM";
    case 3:
        return "21:00PM";
    default :
        return "10:00AM"
    }
}

function addBin(name, time, meditions) {
    console.log("FUNC-addBin  name: " + name + " time: " + time + " meditions: " + meditions)
    BinsModel.model.append({"name": name, "time":time})
}

function getSchDayList(prescriptions) {
    //choose all prescriptions prn==false
    //choose earlier day
    //choose lastest day
    var dayList = ['12.15.2020', '12.15.2020', '12.16.2020', '12.17.2020', '12.18.2020', '12.19.2020'];
}

function getSchPrescriptionByDay(day, prescriptions) {
    //12.15.2020, ALL TID
    var result = JSON.parse('[{"Medication": "HYDROcodone Bitartrate C12A 30 MG","Frequency": "TID","Qty": 1,"Prn": 0},{"Medication": "Ezetimibe-Simvastatin TABS 10-20 MG","Frequency": "TID","Qty": 1,"Prn": 0},{"Medication": "Lisinopril TABS 20 MG","Frequency": "TID","Qty": 1,"Prn": 0}]');
    return result;
}

function addMedi(medi_name, medi_qty, medi_freq, medi_prn) {
    console.log(medi_name," ",medi_qty, " ",medi_freq, " ", medi_prn )
}

function check(object1, object2) {
    //check count of medicine
    return true;
}

function saveChanges() {

}

function getItemByObjectName(root, point, objectName)
{
    var _result = root;
    var _point = point
    while(true) {
        var _item;
        if(_result.objectName === objectName)
            return _result;
        else if(_result.objectName === "ListView")
            _item = (_result as ListView).itemAtIndex((_result as ListView).indexAt(_point.x+(_result as ListView).contentX,_point.y+(_result as ListView).contentY));
        else
            _item = _result.childAt(_point.x,_point.y);
        if(_item === null)
           return null;
        _point = _result.mapToItem(_item,_point)
        _result = _item;
    }    
}

function rowColFromString(string) {
    var hz = Number(Number(string) / 100)
    console.log("hz: ", hz)
    hz = hz >= 1 ? 100 : 10

    var row = Math.trunc(text_canister.text / hz);
    var col = Number(text_canister.text) % hz;
    let result = {
      row: Math.trunc(text_canister.text / hz),
      col: Number(text_canister.text) % hz
    };
    return result;
}

function statusToColor(status) {
    switch (status) {
    case 0:
        return "#2077cd";
    case 1:
        return "green";
    case 2:
        return "yellow";
    case 3:
        return "red";
    default :
        return "#2077cd";
    }
}

function statusToTextColor(status) {
    switch (status) {
    case 0:
        return "white";
    case 1:
        return "white";
    case 2:
        return "black";
    case 3:
        return "white";
    default :
        return "white";
    }
}
