
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpge/ViewController/AddStaffView/Staff.dart';
import 'package:loginpge/ViewController/MyWorkPlaceView/Delivery.dart';
import '../../Const/MyService.dart';
import '../../Const/responsive.dart';
import 'DatePresets.dart';
import 'Filter.dart';
import 'Responsive.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';



class MyWorkPlace extends StatefulWidget {
  const MyWorkPlace({Key? key}) : super(key: key);

  @override
  _MyWorkPlaceState createState() => _MyWorkPlaceState();
}

class _MyWorkPlaceState extends State<MyWorkPlace> {
  var size;
  List<Map<String,dynamic>> satfflist = [
    {"name":"Andy","delivery" :1},
    {"name":"Akash","delivery" :10},
    {"name":"Abhay","delivery" :15},
    {"name":"Boby","delivery" :9},
    {"name":"Priyanshu","delivery" :12},
  ];


  List<String> _locations = ['Attendance Approval','Work Approval'];
  String? _selectedLocation;
   late final ValueChanged<String> onChange;

  List<Map<String, dynamic>> _foundUsers = [];

  StreamSubscription? _connectionChangeStream;
  ConnectionStatusSingleton? connectionStatus;
  bool isOffline = false;
  bool isVisibledailog = false;
  //BuildContext? dialogContext;
  initState() {
    // at the beginning, all users are shown
    _foundUsers = satfflist;
    _getSignatureCode();
    super.initState();
    // if(!isOffline){
    //   print("Api should be called for myworkplace");
    //   // await _longOperation();
    //  // Navigator.pop(dialogContext!);
    //   EasyLoading.dismiss();
    // }
    // else{
    //   print("Api should not be called for myworkplace");
    //   EasyLoading.show();
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //       content: Text('No Internet Connection')));
    // }
    WidgetsBinding.instance.addPostFrameCallback((_){
      connectionStatus = ConnectionStatusSingleton.getInstance();
      _connectionChangeStream = connectionStatus!.connectionChange.listen(connectionChanged);
    });
  }
  void connectionChanged(dynamic hasConnection) {
    if(mounted){
      setState(() {
        isOffline = !hasConnection;
      });
    }
    if(!isOffline){
      print("Api should be called for myworkplace");
     // await _longOperation();
      //Navigator.pop(dialogContext!);
      EasyLoading.dismiss();
    }
    else{
      print("Api should not be called for myworkplace");
      EasyLoading.show();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No Internet Connection')));
    }
    print(" Inside widget My workPlace");
  }

 //Show Alert Dailog for internet loading
 //  void showAlert(BuildContext context) {
 //    showDialog(
 //      context: context, // <<----
 //      barrierDismissible: false,
 //      builder: (BuildContext context) {
 //        dialogContext = context;
 //        return Dialog(
 //          child: Container(
 //            child: Row(
 //              children: [
 //                CircularProgressIndicator(),
 //                SizedBox(
 //                  width: 10,
 //                ),
 //                Text("Loading"),
 //              ],
 //            ),
 //          )
 //        );
 //      },
 //    );
 //  }


  _getSignatureCode() async {
    String? signature = await SmsVerification.getAppSignature();
    print("signature ID Of App $signature");
  }

  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 20.0,bottom: 20.0),
              child: Row(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed:(){
                        showModalBottomSheet<void>(
                            context: context,
                            constraints: BoxConstraints(
                            maxWidth:Responsiveness.isSmallScreen(context)? size.width:300,
                            ),
                            builder: (BuildContext context){
                              return datepresets();
                            });
                      }, child: Text("Today",
                    style: TextStyle(color:Colors.black),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: (){
                      showModalBottomSheet<void>(
                          context: context,
                          constraints: BoxConstraints(
                            maxWidth:Responsiveness.isSmallScreen(context)? size.width:300,
                          ),
                          builder: (BuildContext context) {
                            return filterPresets();
                          });
                      },
                    icon: ImageIcon(
                      AssetImage("assets/filter.png"),
                      color: Colors.black,
                      size: 24,
                    ),
                    label: Text("Filter",
                      style: TextStyle(color:Colors.black),
                    ),),
                ],
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 70,
                  padding: EdgeInsets.only(left: 10.0,top: 20.0,bottom: 10.0,right: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Card(
                      color: Colors.blue,
                      child: DropdownButtonHideUnderline(
                        child:  DropdownButton(
                          dropdownColor: Colors.grey[50],
                          iconEnabledColor: Colors.white,
                          value: _selectedLocation,
                          style: TextStyle(color: Colors.black),
                          items: _locations.map((location) {
                            return DropdownMenuItem(
                              value: location,
                                child: new Text(location,
                                style: TextStyle(color: Colors.white),
                                ),
                            );
                          }).toList(),
                          hint: Text('Approvals',
                            style: TextStyle(color: Colors.black),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLocation = newValue.toString();
                            });
                          },
                        ),
                      )
                  ),
                )
            ),

            Card(
              margin: EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
              child: TextField(
                textAlign: TextAlign.left,
                onChanged: (value){
                 _runFilter(value);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Container(
                        child:  IconButton(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: Align(
                            alignment: Alignment.centerRight,
                            child: ImageIcon(
                              AssetImage("assets/search.png"),
                            ),
                          ),
                        )
                    ),
                    hintText: 'Search Staff',
                    border: InputBorder.none),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _foundUsers.isNotEmpty ?
                      ListView.builder(
                        itemCount: _foundUsers.isEmpty ? 0:_foundUsers.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext, index){
                          return Container(
                            height: 100,
                            child: Card(
                                margin: EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0),
                                          child: Text(_foundUsers[index]["name"].toString(),
                                          style: TextStyle(fontSize: 15),
                                          ),
                                          //Text("Rajesh",style: TextStyle(fontSize: 15),),
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        height: 1,
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 80,
                                                height: 35,
                                                child: Padding(
                                                  padding: EdgeInsets.only(left: 10.0,top: 10.0,bottom: 10.0),
                                                  child:Text("Delivery(${_foundUsers[index]["delivery"].toString()})",
                                                    style: TextStyle(fontSize: 15,color: Colors.black),
                                                  ),
                                                  // Text("Delivery(2)",
                                                  //   style: TextStyle(fontSize: 15,color: Colors.black),),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                                width: 80,
                                                height: 35,
                                                child: IconButton(
                                                  icon: Image.asset('assets/rightarrow.png'),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,MaterialPageRoute(builder: (_)=> const Delivery()),
                                                    );
                                                  },
                                                )
                                            )
                                          ],
                                        ),),
                                    ],
                                  ),
                                )
                            ),
                          );
                        },
                      ):
                      const Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                )
              ],
            ),
            // Visibility(
            //      visible: isVisibledailog,
            //     child: showdailog()
            // )
          ],
        ),
      ),);
  }

  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          centerTitle: true,
          title:  Text('My WorkPlace',
            style: TextStyle( color: Colors.black,fontWeight: FontWeight. bold),),
          actions: <Widget>[
            Container(
              color: Colors.white,
              child: IconButton(
                icon: Icon(
                  Icons.add,
                ),
                iconSize: 30,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (_)=> const StaffScreen()),
                  );
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
              width: 300,
              child: MainfunctionUi(),
            ),
          ),
          desktop: Center(
            child: Container(
              width: 300,
              child: MainfunctionUi(),
            ),
          ),
        )
    );
  }
  // Future buildFilter(){
  //   return showModalBottomSheet(
  //       context: context,
  //       constraints: BoxConstraints(
  //         maxWidth:Responsiveness.isSmallScreen(context)? size.width:size.width/3,
  //       ),
  //       builder: (context) {
  //         return StatefulBuilder(
  //             builder: (BuildContext context, StateSetter state){
  //               return Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Container(
  //                     width: Responsiveness.isSmallScreen(context)? size.width:size.width/3,
  //                     child: Row(
  //                       crossAxisAlignment: CrossAxisAlignment.end,
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: <Widget>[
  //                         Expanded(
  //                           flex: 1,
  //                           child: Container(
  //                             // color: Colors.greenAccent,
  //                             width: 80,
  //                             height: 35,
  //                             child: Align(
  //                               alignment: Alignment.center,
  //                               child: Text("Date Presets",
  //                                 style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold,
  //                                     color: Colors.black),),
  //                             ),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           width: 10,
  //                         ),
  //                         Container(
  //                           // color: Colors.grey[300],
  //                             width: 80,
  //                             height: 35,
  //                             child: IconButton(
  //                                 onPressed: (){
  //                                   Navigator.of(context).pop();
  //                                 },
  //                                 icon: Icon(Icons.close))
  //                         )
  //                       ],
  //                     ),),
  //                   Container(
  //                     width: Responsiveness.isSmallScreen(context)? size.width:size.width/3,
  //                     child: RadioListTile(
  //                     value: datepresets.maximum,
  //                     groupValue: _character1,
  //                     onChanged: (datepresets? value) {
  //                       setState(() {
  //                         _character1 = value!;
  //                       });
  //                     },
  //                     title: Text("Maximum"),
  //                     subtitle: Text("16 Aprail - 16 may"),
  //                     toggleable: true,
  //                     controlAffinity: ListTileControlAffinity.trailing,
  //                   ),
  //                   ),
  //                   Container(
  //                     width: Responsiveness.isSmallScreen(context)? size.width:size.width/3,
  //                     child: RadioListTile(
  //                     value: datepresets.today,
  //                     groupValue: _character1,
  //                     onChanged: (datepresets? value) {
  //                       setState(() {
  //                         _character1 = value!;
  //                       });
  //                     },
  //                     title: Text("Today"),
  //                     subtitle: Text("16 May"),
  //                     toggleable: true,
  //                     controlAffinity: ListTileControlAffinity.trailing,
  //                   ),
  //                   ),
  //                   Container(
  //                     width: Responsiveness.isSmallScreen(context)? size.width:size.width/3,
  //                     child: RadioListTile(
  //                     value: datepresets.yesterday,
  //                     groupValue: _character1,
  //                     onChanged: (datepresets? value) {
  //                       setState(() {
  //                         _character1 = value!;
  //                       });
  //                     },
  //                     title: Text("Yesterday"),
  //                     subtitle: Text("15 May"),
  //                     toggleable: true,
  //                     controlAffinity: ListTileControlAffinity.trailing,
  //                   ),
  //                   ),
  //                   Container(
  //                     width: Responsiveness.isSmallScreen(context)? size.width:size.width/3,
  //                     child: RadioListTile(
  //                     value: datepresets.last7days,
  //                     groupValue: _character1,
  //                     onChanged: (datepresets? value) {
  //                       setState(() {
  //                         _character1 = value!;
  //                       });
  //                     },
  //                     title: Text("Last 7 days"),
  //                     subtitle: Text("9 May - 15"),
  //                     toggleable: true,
  //                     controlAffinity: ListTileControlAffinity.trailing,
  //                   ),
  //                   ),
  //                 ],
  //               );
  //             });
  //       });
  // }
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = satfflist;
    } else {
      results = satfflist
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }
}










