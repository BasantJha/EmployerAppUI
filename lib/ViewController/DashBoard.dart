
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AddStaffView/AddStaffcontroller.dart';
import 'MyWorkPlaceView/MyWorkPlaceController.dart';
import 'AttendenceView/AttendenceViewController.dart';
import 'Setting/settingcontroller.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool state = false;
  int currentindex = 0;
  final screens =[
     MyWorkPlace(),
    AddStaff(),
    AttendenceView(),
    AddWork(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title:  Text(' ',
      //   style: TextStyle( color: Colors.black,fontWeight: FontWeight. bold),),
      //   backgroundColor: Colors.white,
      // ),
      body: Center(
        child: screens[currentindex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.blue,
        currentIndex: currentindex,
        onTap: (index) => setState(() {
          currentindex = index;
          state= true;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // state ? Image.asset("assets/work-active.png",
            // height: 30,
            //   width: 30,
            // ) : Image.asset("assets/work.png",
            //   height: 30,
            //   width: 30,
            // ),
            label: 'MyWorkPlace',
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // state ? Image.asset("assets/staff-active.png",
              //   height: 30,
              //   width: 30,
              // ) : Image.asset("assets/staff.png",
              //   height: 30,
              //   width: 30,
              // ),
              label: 'Add staff',
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // state ? Image.asset("assets/user-active.png",
              //   height: 30,
              //   width: 30,
              // ) : Image.asset("assets/user.png",
              //   height: 30,
              //   width: 30,
              // ),
             label: 'Attendence View',
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // state ? Image.asset("assets/setting-active.png",
              //   height: 30,
              //   width: 30,
              // ) : Image.asset("assets/setting.png",
              //   height: 30,
              //   width: 30,
              // ),
            label: 'Setting',
            backgroundColor: Colors.blue
          ),
        ],

      ),

    );
  }
}
