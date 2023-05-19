
import 'dart:async';

import 'package:flutter/material.dart';

import '../../Const/MyService.dart';
import '../../Const/responsive.dart';
import 'AddmanuallyStaff.dart';


class AddStaff extends StatefulWidget {
  const AddStaff({Key? key}) : super(key: key);

  @override
  _AddStaffState createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  var cons;
  List<Map<String,dynamic>> images = [
    {"name":"Andy", "contact" :13746684},
    {"name":"Akash","contact" :1357782},
    {"name":"Abhay","contact" :11836838},
    {"name":"Basant","contact" :1098363},
    {"name":"Balram","contact" :1987643},
    {"name":"Brajesh","contact" :1767643},
    {"name":"virat","contact" :12455423},
    {"name":"Priyanshu","contact" :142323},
  ];
  List<Map<String,List<Map<String,dynamic>>>> dynam = [
    {
      "A":[
            {"name":"Andy", "contact" :13746684},
            {"name":"Akesh", "contact" :13746684},
           ]
    },
    {
      "B":[
        {"name":"Boby", "contact" :13746684},
        {"name":"Ballu", "contact" :13746684},
      ]
    },
    {
      "P":[
        {"name":"Priyanshu", "contact" :13746684},
        {"name":"Pihu", "contact" :13746684},
      ]
    },
  ];
  List<Map<String, dynamic>> _foundcontact = [];
  List<Map<String,List<Map<String,dynamic>>>> _foundcon = [];
  StreamSubscription? _connectionChangeStream;
  ConnectionStatusSingleton? connectionStatus;
  bool isOffline = false;

  late BuildContext dialogContext;
  initState() {
    _foundcontact = images;
    _foundcon= dynam;
    super.initState();
    if(!isOffline){
      print("Api should be called for add Staff");
      // await _longOperation();
      //Navigator.pop(dialogContext);
    }
    else{
      print("Api should not be called for add staff");
     // showAlert(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No Internet Connection')));
    }
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
      print("Api should be called for add Staff");
      // await _longOperation();
     // Navigator.pop(dialogContext!);
    }
    else{
      print("Api should not be called for add staff");
     // showAlert(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No Internet Connection')));
    }
    print(" Inside widget addstaff");
  }

  //Show Alert Dailog for internet loading
  // void showAlert(BuildContext context) {
  //   showDialog  (
  //     context: context, // <<----
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       dialogContext = context;
  //       return Dialog(
  //           // child: Container(
  //             child: Row(
  //               children: [
  //                 CircularProgressIndicator(),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Text("Loading"),
  //               ],
  //             ),
  //           )
  //       );
  //     },
  //   );
  // }

  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
      child:Container(
              padding: EdgeInsets.only(left: 10.0,top: 20.0,right: 10.0),
              child: Column(
                children: [
                  Card(
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
                                  alignment: Alignment.centerLeft,
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
                  ListView.builder(
                    itemCount: _foundcontact.isEmpty ? 0:_foundcontact.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(5),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext, index){
                      // String prev = _foundcontact[index]["name"][0];
                      return Column(
                        children: [
                          Container(
                            child: buildlogic(index),
                          ),
                      Card(
                      child: ListTile(
                      title: Text(_foundcontact[index]["name"].toString(),
                      style: TextStyle(fontSize: 15)),
                      subtitle: Text(_foundcontact[index]["contact"].toString()),
                      trailing: buildlogic(index),
                      ),
                      )
                        ],
                      );
                    },
                  )
                ],
              )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: BackButton(
         color: Colors.black,
       ),
       centerTitle: true,
       title:  Text('Add Staff',
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
                 context,MaterialPageRoute(builder: (_)=> const AddStaffManuallyManually()),
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
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = images;
    } else {
      results = images
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundcontact = results;
    });
  }

   buildlogic(int index) {
     // cons = _foundcontact[index]["name"][0];
     if(index == 0){
       cons = _foundcontact[index]["name"][0];
       return Container(
         child: Text(_foundcontact[index]["name"][0]),
       );
     }
     else{
       print(index);
       for(int index = 0 ; index<_foundcontact.length;index++){
         if(_foundcontact[index]["name"][index]==cons) {
           print(cons);
           return Container(
             child: Text(" "),
           );
         }
         else{
           setState(() {
             cons = _foundcontact[index]["name"][index];
             print(cons);
             print("Else");
              Container(
               child: Text(_foundcontact[index]["name"][0]),
             );
           });
         }
       }
     }

  }
}