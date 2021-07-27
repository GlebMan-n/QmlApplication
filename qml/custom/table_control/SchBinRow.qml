import QtQuick 2.15
import "logic.js" as Logic
import com.mycompany.utilites 1.0

BaseRowRectangle {
    id: root
    property var prescription;
    signal signAddBin(var name, var time, var medications)
    property var bin_model;
    border.width: 0
    Component.onCompleted: {
        root.signAddBin.connect(Logic.addBin)
    }

    Utilites {
        id: utilites
    }

    function compareTime(time1, time2) {
        return true;
    }

    function sortTime(text, time, index,_bin_model ) {
        if(text === time)
            return;
        var object_current = _bin_model.get(index);
        if(!utilites.checkTime(text))
            text = object_current.time;
        object_current.time = text;
        var currentIndex = index;
        var stop = false;
        while(!stop) {
            object_current = _bin_model.get(currentIndex);
            var bottom_check = 0;
            var top_check = 1;
            var not_top = currentIndex > 0;
            var not_bottom = currentIndex !== _bin_model.count-1;
            if(not_top) {
                var object_before = _bin_model.get(currentIndex-1);
                top_check = utilites.compareTime(object_current.time,object_before.time);
                if(top_check === 0) {
                    _bin_model.move(currentIndex,currentIndex-1,1);
                    currentIndex -=1;
                    continue;
                }
            }
            if(not_bottom) {
                var object_after = _bin_model.get(currentIndex+1);
                bottom_check = utilites.compareTime(object_current.time,object_after.time);
                if(bottom_check === 1) {
                    _bin_model.move(currentIndex,currentIndex+1,1);
                    currentIndex +=1;
                }
            }
            if(top_check === 1 && bottom_check ===0) {
                stop = true;
            }
        }
    }

    ListView {
        objectName: "ListView"
        spacing: root.spacing
        id: view
        height: childrenRect.height
        width: root.width
        model: root.bin_model
        delegate: binDelegate
    }

    Component {
        id: binDelegate

        Column {
            width: root.width
            height: childrenRect.height
            Row {
                id: row
                spacing: root.spacing
                width: root.width
                height: childrenRect.height
                CellRectangle {
                    type: 2
                    pieMenuParent: root.pieMenuParent
                    color: root.borderColor
                    height: schMediRow.height
                    mainWidth: root.width * root.oneCellCoef - root.spacing

                    CellText {
                        text:  {
                            name = "Bin#"+(index + 1);
                            return name  }
                        fontColor: root.text_color
                    }

                    onSignalCopy: {
                        BinsModel.copyPasteBin = root.bin_model.get(index)
                    }

                    onSignalPaste: {
                        var copied_bin = JSON.parse(JSON.stringify(BinsModel.copyPasteBin));
                        copied_bin.name = root.bin_model.get(index).name
                        copied_bin.time = root.bin_model.get(index).time
                        root.bin_model.set(index, copied_bin);
                    }

                    onSignalAdd: {
                        var last_element = '{"medications":[{"medi_prn":0,"medi_freq":"BID","medi_qty":0,"medi_name":"empty"}],"time":"00:00AM","name":"Bin#"}';
                        last_element = JSON.parse(last_element);
                        view.model.insert(0,last_element);
                    }

                    onSignalDel: {
                        if(!view.model.count === 0)
                            return;
                        view.model.remove(index,1);
                    }
                }
                CellRectangle {
                    type: 3
                    pieMenuParent: root.pieMenuParent
                    color: background
                    height: schMediRow.height
                    mainWidth: root.width * root.oneCellCoef - root.spacing
                    isCheckable: true
                    CellTextEdit {
                        id: p1
                        text: time
                        fontColor: root.text_color
                        signal checkTime
                        Timer {
                            id: timer
                            interval: 1500; running: false; repeat: false
                            onTriggered: {
                                p1.checkTime()
                            }
                        }
                        onTextChanged: {
                            timer.stop();
                            timer.start();
                        }
                        onCheckTime: root.sortTime(text,time,index,root.bin_model)
                    }
                }
                SchMediRow {
                    borderColor: root.borderColor
                    text_color: root.text_color
                    id: schMediRow
                    mainWidth: root.width * root.eightCellCoef - root.spacing
                    medi: medications
                    pieMenuParent: root.pieMenuParent
                    parentModel: view.model
                    currentIndex: index
                }
            }
        }
    }
}
