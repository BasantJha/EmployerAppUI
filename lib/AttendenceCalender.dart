
/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Const/responsive.dart';

class AttendenceCalender extends StatefulWidget {
  const AttendenceCalender({Key? key}) : super(key: key);
  @override
  _AttendenceCalenderState createState() => _AttendenceCalenderState();
}

class _AttendenceCalenderState extends State<AttendenceCalender> {
  List<String> _locations = ['Attendance Approval','Work Approval'];
  String? _selectedLocation;

  CalendarController? _controller;
  //final selectedday = DateTime.now();
   String present = "Present";
  final Map<DateTime,List<dynamic>> _events = {
    DateTime(2022,8,9): ["Absent"],
    DateTime(2022,8,14): ["Present"],
    DateTime(2022,8,11): ["Absent"],
    DateTime(2022,8,8): ["Present"],
    DateTime(2022,8,12): ["Absent"]
  };
 // List<DateTime>? events = [DateTime(2022,8,13)];


  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }
  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 5.0,right: 5.0),
        child: Column(
          children: [
            Card(
                color: Colors.grey[50],
                child: Column(
                  children: [
                    Container(
                      //padding: EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
                      color: Colors.grey[200],
                      child: DropdownButtonFormField(
                        icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 20,),
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/calender.png',
                              width: 20,
                              height: 20,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        hint: Text('Current month'),
                        value: _selectedLocation,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLocation = newValue.toString();
                          });
                        },
                        items: _locations.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                    TableCalendar(
                      events: _events,
                      startDay: DateTime.utc(2022,8,1),
                      endDay: DateTime.utc(2030, 3, 14),
                      calendarController: _controller,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      builders: CalendarBuilders(
                        selectedDayBuilder: (context, date, events) {
                          setState(() {
                            _events[date] = ["Present"];
                          });
                          return Container(
                              margin: const EdgeInsets.all(4.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text(
                                date.day.toString(),
                                style: TextStyle(color: Colors.white),
                              ));
                        },
                        singleMarkerBuilder: (context, date, events)
                        {
                          print("show the first request $events");
                          var containerObj=Container();

                            String obj=events;
                            print("show the object value  $obj");

                           if(events=="Present")
                            {
                              print("show the third request");
                              containerObj=  Container(
                                  alignment: Alignment.center,
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          shape: BoxShape.rectangle,
                                          color: Colors.green), //Change color
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          date.day.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                  );
                              return containerObj;
                            }
                            else{
                              print("show the fourth request");
                              containerObj= Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      shape: BoxShape.rectangle,
                                      color: Colors.red), //Change color
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      date.day.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                              );
                              return containerObj;
                            }

                        },
                      ),
                    )
                  ],
                )
            ),

            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.grey[50],
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 5.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        children: [
                                          Text("Aarushi Siwan",
                                            style: TextStyle(fontSize: 15,color: Colors.black),),
                                          Text("Data Entry Operator",
                                            style: TextStyle(fontSize: 10,color: Colors.black),),
                                        ],
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 5.0),
                                child: Container(
                                  padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 5.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        children: [
                                          Text("Emp Code",
                                            style: TextStyle(fontSize: 10,color: Colors.black),),
                                          Text("5407",
                                            style: TextStyle(fontSize: 15,color: Colors.black),),
                                        ],
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0,left: 10.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 5.0),
                                    // color: Colors.greenAccent,
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    //height: 40,
                                    child: Align(
                                      //alignment: Alignment.centerLeft,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text("Select Leave Type",style: TextStyle(fontSize: 15),),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("PL",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        entryTextField()
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("CL",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        entryTextField()
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              children: [
                                                Text("Absent",style: TextStyle(fontSize: 15),),
                                                entryTextField()
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              children: [
                                                Text("Full day",style: TextStyle(fontSize: 15),),
                                               entryTextField()
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              children: [
                                                Text("Half days",style: TextStyle(fontSize: 15),),
                                                entryTextField()
                                              ],
                                            )
                                          ],
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 5.0),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0,right: 5.0,top: 10.0,bottom: 10.0),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children:   [
                            Container(
                              width: 200,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Remarks",
                                    border: OutlineInputBorder()
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                onPressed: (){},
                                child: Text("save"),
                              style: ElevatedButton.styleFrom(
                                 primary: Colors.orange
                              ),

                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          title: const Text('Attendence',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            Container(
              color: Colors.white,
              child: IconButton(
                icon:  Image.asset('assets/uploadicon.png'),
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (_)=>  Work()));
                },
              ),
            )
          ],
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
    );
  }
  Widget entryTextField(){
    return Container(
      width: 25,
      height: 20,
      child:  TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          contentPadding: EdgeInsets.only(
              top: 5, left: 3),
          hintText: "",
          border:
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0)),
        ),
        onChanged: (value)
        {},

      ),
    );
  }

}
 */


import 'package:flutter/material.dart';
import 'package:loginpge/Const/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:circles_background/circles_background.dart';

class DynamicEvent extends StatefulWidget {
  @override
  _DynamicEventState createState() => _DynamicEventState();
}

class _DynamicEventState extends State<DynamicEvent> with TickerProviderStateMixin{


  TabController? tabController;
  CalendarController? _controller;
  Map<DateTime, List<dynamic>> _events = {
    DateTime.utc(2022,11,9,12): ["Absent"],
    DateTime.utc(2022,11,14,12): ["Present"],
    DateTime.utc(2022,11,11,12): ["Absent"],
    DateTime.utc(2022,11,8,12): ["Present"],
    DateTime.utc(2022,11,12,12): ["Half Days"]
  };

  Map<DateTime,List<dynamic>> assignedEvent = {};

  String status = "Nothing";
  //List<DateTime> listOfSelectedDate = [];
  Map<DateTime,List<dynamic>> listOfSelectedDate = {};


  final List<CircleInfo> circles = [
    CircleInfo(
      size:  Size(double.infinity, 60),
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff93d9fd),
            Color(0xff3cbbfb)
          ]
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      alignment: Alignment.topCenter,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    assignedEvent = _events;
    tabController = TabController(length: 2, vsync: this);
  }



  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }
  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: Color(0xff93d9fd),
      flexibleSpace: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Expanded(
                flex: 1,
                child: Container(
                  child: IconButton(
                    icon: Image.asset('assets/hamburgermenuicon.png'),
                    onPressed: (){
                    },
                  ),
                )
            ),
            SizedBox(
              width: 250,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Image.asset('assets/Usericon.png'),
                  onPressed: (){},
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: IconButton(
                    icon: Image.asset('assets/testimonialicon.png'),
                    onPressed: (){},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),

      body: Responsive(
        mobile: MainfunctionUI(),
        tablet: MainfunctionUI(),
        desktop: Center(
          child: Container(
            width: 400,
            child: MainfunctionUI(),
          ),
        )

      )
    );
  }

  CirclesBackground MainfunctionUI(){
    return CirclesBackground(
      circles:circles,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text("Attendance",
                  style: TextStyle(fontSize: 20,fontFamily: "Roboto",fontWeight: FontWeight.bold,color: Colors.white),),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(

                      )
                  ),
                  child:  TabBar(
                    controller: tabController,
                    indicator: BoxDecoration(
                      color: Colors.blue,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs:  [
                      Text("Today",
                        style: TextStyle(

                        ),
                      ),
                      Text("Monthly",
                        style: TextStyle(

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 500,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      child: Center(
                        child: Text("Map Wodget",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 30,right: 30),
                          child: Container(
                            child: TableCalendar(
                              events: assignedEvent,
                              initialCalendarFormat: CalendarFormat.month,
                              startingDayOfWeek: StartingDayOfWeek.sunday,
                              onDaySelected: (date, events,holidays) {
                                print("On Click Called");
                                print(_controller!.selectedDay.toUtc());
                                listOfSelectedDate[date] = events;
                                setState(() {
                                  events.clear();
                                  assignedEvent[_controller!.selectedDay] = [
                                    "$status"
                                  ];
                                  status = "Nothing";
                                });
                              },
                              builders: CalendarBuilders(
                                  singleMarkerBuilder: (context, date, events){
                                    var containerobj;
                                    if(events == "Present"){
                                      containerobj = Container(
                                          alignment: Alignment.center,
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            //borderRadius: BorderRadius.circular(20.0),
                                              shape: BoxShape.rectangle,
                                              color: Colors.green), //Change color
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              date.day.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          )
                                      );
                                      return containerobj;
                                    }
                                    else if(events == "Absent"){
                                      containerobj = Container(
                                          alignment: Alignment.center,
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            // borderRadius: BorderRadius.circular(20.0),
                                              shape: BoxShape.rectangle,
                                              color: Colors.red), //Change color
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              date.day.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          )
                                      );
                                      return containerobj;
                                    }
                                    else if(events == "Half Days"){
                                      containerobj = Container(
                                          alignment: Alignment.center,
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            //borderRadius: BorderRadius.circular(20.0),
                                              shape: BoxShape.rectangle,
                                              color: Colors.yellow), //Change color
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              date.day.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          )
                                      );
                                      return containerobj;
                                    }
                                    else{
                                      containerobj = Container(
                                        alignment: Alignment.center,
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          // borderRadius: BorderRadius.circular(20.0),
                                          shape: BoxShape.rectangle,
                                          color: Colors.white,),
                                        child: Image.asset("assets/selectIcon.png"),
                                      );
                                      return containerobj;
                                    }
                                  }
                              ),
                              calendarController: _controller,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff187A00),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                onPressed: (){
                                  setState(() {
                                    status = "Present";
                                    listOfSelectedDate.forEach((key, value) {
                                      value.clear();
                                      assignedEvent[key] = [
                                        "$status"
                                      ];
                                    });
                                    setState(() {
                                      listOfSelectedDate.clear();
                                      status = "Nothing";
                                    });
                                  });
                                  print("Events List $assignedEvent");
                                  print("List Of Selected Date : ${listOfSelectedDate.values}");
                                },
                                child: Text("Present"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffFE0000),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                onPressed: (){
                                  setState(() {
                                    status = "Absent";
                                    listOfSelectedDate.forEach((key, value) {
                                      value.clear();
                                      _events![key] = [
                                        "$status"
                                      ];
                                    });
                                    setState(() {
                                      listOfSelectedDate.clear();
                                      status = "Nothing";
                                    });
                                  });
                                  print("Events List $_events");
                                  print("List Of Selected Date : ${listOfSelectedDate.values}");
                                },
                                child: Text("Absent"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffFFA800),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                onPressed: (){
                                  setState(() {
                                    status = "Half Days";
                                    listOfSelectedDate.forEach((key, value) {
                                      value.clear();
                                      _events![key] = [
                                        "$status"
                                      ];
                                    });
                                    setState(() {
                                      listOfSelectedDate.clear();
                                      status = "Nothing";
                                    });
                                  });
                                  print("Events List $_events");
                                  print("List Of Selected Date : ${listOfSelectedDate.values}");
                                },
                                child: Text("Half day"),

                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(100, 50),
                                backgroundColor: Colors.blue,
                                //darkBlueColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10)), //////// HERE
                              ),
                              onPressed: () {},
                              child: Text("Mark Attendence")),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }


}






