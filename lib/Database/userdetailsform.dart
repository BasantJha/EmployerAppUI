import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../Const/responsive.dart';
import 'databasehelper.dart';
import 'Userdetails.dart';
import 'showsavedUserdetails.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SharedPreference(),
    );
  }
}

class SharedPreference extends StatefulWidget {
  const SharedPreference({Key? key,}) : super(key: key);

  @override
  State<SharedPreference> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {

  static Set<String>? prefKeys;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController empnamecontroller = TextEditingController();
  TextEditingController addcontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();
  TextEditingController queryController = TextEditingController();
  int? contact;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  bool isvisible = false;
  final dbHelper = DatabaseHelper.instance;
  List<User> user = [];
  List<User> usersbyName = [];

  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
        child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children:  [
                      Expanded(
                          flex: 1,
                          child: Text("Email Field")
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: emailcontroller,
                          decoration:  InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children:  [
                      Expanded(
                          flex: 1,
                          child: Text("Emp Name")
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: empnamecontroller,
                          decoration:  InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children:  [
                      Expanded(
                          flex: 1,
                          child: Text("Address")
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: addcontroller,
                          decoration:  InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children:  [
                      Expanded(
                          flex: 1,
                          child: Text("Contact Number")
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: contactcontroller,
                          decoration:  InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text('Insert User Details'),
                    onPressed: () {
                      String email = emailcontroller.text.toString();
                      String name = empnamecontroller.text;
                      String address = addcontroller.text;
                      if(contactcontroller.text == null || contactcontroller.text == "" ){
                        contact = 0;
                        print(contact);
                        _insert(email,name, address,contact);
                      }else{
                        contact = int.parse(contactcontroller.text);
                        print(contact);
                        _insert(email,name, address,contact);
                      }
                      print("Created");
                    },),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _queryAll();
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Responsive(
                                mobile: DataCard( data: user,),
                                tablet: Center(
                                  child: Container(
                                    width: 400,
                                    child: DataCard( data: user,),
                                  ),
                                ),
                                desktop: Center(
                                  child: Container(
                                    width: 400,
                                    child: DataCard( data: user,),
                                  ),
                                ),
                              )
                            ));
                      },
                      child: Text("Go to datacard list")
                  ),
                ],
              ),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details Form"),
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
  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', emailcontroller.text);
    prefs.setString("empname", empnamecontroller.text);
    prefs.setString("Address", addcontroller.text);
    prefs.setString("contactnumber", contactcontroller.text);
    print("Data Save ");
  }

  // addStringToSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setInt('empname', empnamecontroller.text.toString());
  // }
  // addDoubleToSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setDouble('doubleValue', 115.0);
  // }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? email = prefs.getString('email');
    String? empname = prefs.getString("empname");
    String? address = prefs.getString("Address");
    String? contact = prefs.getString("contactnumber");
    print(email);
    print(empname);
    print(address);
    print(contact);
  }

  void _insert(email,name,address,contact) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnemail:email,
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnaddress: address,
      DatabaseHelper.columncontact: contact
    };
    User car = User.fromMap(row);
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _showMessageInScaffold(String message){
    // ignore: deprecated_member_use
    // _scaffoldKey.currentState!.showSnackBar(
    //     SnackBar(
    //       content: Text(message),
    //     )
    // );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  void   _queryAll() async {
    final  allRows = await dbHelper.queryAllRows();
    print(allRows);
    user.clear();
    allRows.forEach((k) => user.add(User.fromMap(k)));
    _showMessageInScaffold('Query done.');
  }
  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    usersbyName.clear();
    allRows.forEach((row) => usersbyName.add(User.fromMap(row)));
  }
}
