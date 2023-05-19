import 'package:flutter/material.dart';

import '../Const/responsive.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class Dateselection extends StatefulWidget {
  const Dateselection({Key? key}) : super(key: key);
  @override
  _DateselectionState createState() => _DateselectionState();
}
class _DateselectionState extends State<Dateselection>{
DateTime datenow = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
DateTime d1 = DateTime.now();
bool counter = false;
String _selectedDate1 = 'select start date';
String _selectedDate2 = 'select end date';
Future<void> _selectDate1(BuildContext context) async {
    d1 = (await showDatePicker(
    context: context,
    initialDate: DateTime.now()==d1 ? DateTime.now(): d1,
    firstDate: DateTime.now().subtract(Duration(days: 0)),
    lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
  ))!;
    bool? validdate = datenow.isBefore(d1) || datenow.isAtSameMomentAs(d1);
    if (d1 != null && validdate) {
    setState(() {
      _selectedDate1 = DateFormat.yMMMMd("en_US").format(d1);
      counter = true;
    });
  }
}
Future<void> _selectDate2(BuildContext context) async {
  final DateTime? d = await showDatePicker(
    context: context,
    initialDate: DateTime.now() == d1 ? DateTime.now().subtract(Duration(days: 0)) : DateTime.now().add(d1.difference(DateTime.now())),
    firstDate: DateTime.now() == d1 ? DateTime.now().subtract(Duration(days: 0)) : DateTime.now().add(d1.difference(DateTime.now())),
    lastDate: DateTime(2025),
    initialEntryMode: DatePickerEntryMode.calendarOnly,
  );
  bool? validdate = d1.isBefore(d!) || d1.isAtSameMomentAs(d);
  if (d != null  && validdate)
    setState(() {
      _selectedDate2 = DateFormat.yMMMMd("en_US").format(d);
    });
}
  SingleChildScrollView MainfunctionUi(){
    return  SingleChildScrollView(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: [
            Container(
              child: Text("Start Date"),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black),
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                          _selectedDate1,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF000000))
                      ),
                      onTap: (){
                        _selectDate1(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      tooltip: 'Tap to open date picker',
                      onPressed: () {
                        _selectDate1(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              child: Text("End Date"),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black),
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                          _selectedDate2,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF000000))
                      ),
                      onTap: (){
                        _selectDate2(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      tooltip: 'Tap to open date picker',
                      onPressed: () {
                        if(counter){
                          _selectDate2(context);
                        }
                        else{
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Alert"),
                              content: const Text("Please select the Start Date "),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    color: Colors.green,
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("okay"),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        //_selectDate2(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gig Report",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Calender",
                style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
          ),
          body: Responsive(
            mobile: MainfunctionUi(),
            tablet: Center(
              child: Container(
                width: 400,
                child: MainfunctionUi(),
              ),
            ),
            desktop: Center(
              child: Container(
                width: 400,
                child: MainfunctionUi(),
              ),
            ),
          )
      ),
    );
  }

}