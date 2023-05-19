// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpge/Const/responsive.dart';

var dateRadioValue;

StatefulBuilder datePresets1() {
  return StatefulBuilder(
      builder: (BuildContext context, StateSetter state) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.72,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Date Presets", textAlign: TextAlign
                                  .center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),),
                            ),
                          )
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close, color: Colors.grey, size: 30,),
                      ),
                    ],
                  )
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 20),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text('Maximum'),
                  subtitle: Text('16 April 2021 - 21 May 2022'),
                  trailing: Radio(
                    value: 0,
                    groupValue: dateRadioValue,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      state(() {
                        dateRadioValue = value;
                      });
                    },),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(
                      left: 10, right: 10, bottom: 10),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text('Today'),
                  subtitle: Text('24 June'),
                  trailing: Radio(
                    value: 1,
                    groupValue: dateRadioValue,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      state(() {
                        dateRadioValue = value;
                      });
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(
                      left: 10, right: 10, bottom: 10),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text('Yesterday'),
                  subtitle: Text('23 June'),
                  trailing: Radio(
                    value: 2,
                    groupValue: dateRadioValue,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      state(() {
                        dateRadioValue = value;
                      });
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(
                      left: 10, right: 10, bottom: 30),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text('Last 7 days'),
                  subtitle: Text('18 June - 24 June'),
                  trailing: Radio(
                    value: 3,
                    groupValue: dateRadioValue,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      state(() {
                        dateRadioValue = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

Responsive datepresets(){
  return Responsive(
      mobile: datePresets1(),
      tablet:  Center(
        child: Container(
          width: 300,
          child: datePresets1(),
        ),
      ),
      desktop: Center(
        child: Container(
          width: 300,
          child:datePresets1(),
        ),
      )
  );
}

