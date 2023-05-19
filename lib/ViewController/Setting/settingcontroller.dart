import 'package:flutter/material.dart';

import '../../Const/responsive.dart';

class AddWork extends StatefulWidget {
  const AddWork({Key? key}) : super(key: key);
  @override
  _AddWorkState createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> {

  bool haspressed1 = false;
  bool haspressed2 = false;
  bool haspressed3 = false;
  bool haspressed4 = false;
  bool haspressed5 = false;
  bool haspressed6 = false;
  bool haspressed7 = false;
  bool haspressed8 = false;


  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15,20,15,20),
      child: Column(
        children: [
          Container(
            // width: Responsive.isSmallScreen(context)?size.width:size.width/3,
            child: Column(
              children: [
                makeInput(hint: 'Staff Name'),
                makeInput(hint: "GiG Name"),
                makeInput(hint: "Location"),
                makeInput(hint: "Select date"),
                Padding(
                  padding: EdgeInsets.all(20),),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Text("SELECT TIME SLOT",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.greenAccent,
                          width: 80,
                          height: 35,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Full Time",
                              style: TextStyle(fontSize: 12,color: Colors.black),),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        // color: Colors.grey[300],
                          width: 80,
                          height: 35,
                          child: MaterialButton(
                            color: haspressed1? Colors.grey:Colors.blue,
                            onPressed: () {
                              setState(() {
                                haspressed1 = !haspressed1;
                              });
                            },
                            child: Text("Select"),
                          )
                      )
                    ],
                  ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.greenAccent,
                          width: 80,
                          height: 35,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Half Time",
                              style: TextStyle(fontSize: 12,color: Colors.black),),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        // color: Colors.grey[300],
                          width: 80,
                          height: 35,
                          child: MaterialButton(
                            color: haspressed2? Colors.grey:Colors.blue,
                            onPressed: () {
                              setState(() {
                                haspressed2 = !haspressed2;
                              });
                            },
                            child: Text("Select"),
                          )
                      )
                    ],
                  ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.greenAccent,
                          width: 80,
                          height: 35,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Time",
                              style: TextStyle(fontSize: 12,color: Colors.black),),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        // color: Colors.grey[300],
                          width: 80,
                          height: 35,
                          child: MaterialButton(
                            color: haspressed3? Colors.grey:Colors.blue,
                            onPressed: () {
                              setState(() {
                                haspressed3 = !haspressed3;
                              });
                            },
                            child: Text("Select"),
                          )
                      )
                    ],
                  ),),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding:EdgeInsets.only(left: 2,right: 2,top: 2),
              child: Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                      child: Divider(
                        color: Colors.black,
                        height: 80,
                      )),
                ),
              ]),),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.greenAccent,
                          width: 80,
                          height: 35,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("8:00 AM - 10 PM",
                              style: TextStyle(fontSize: 12,color: Colors.black),),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        // color: Colors.grey[300],
                          width: 80,
                          height: 35,
                          child: MaterialButton(
                            color: haspressed4? Colors.white:Colors.blue,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey)
                            ),
                            onPressed: () {
                              setState(() {
                                haspressed4=!haspressed4;
                              });
                            },
                            child: Text("Select"),
                          )
                      )
                    ],
                  ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.greenAccent,
                          width: 80,
                          height: 35,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("8:00 AM - 10 PM",
                              style: TextStyle(fontSize: 12,color: Colors.black),),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        // color: Colors.grey[300],
                          width: 80,
                          height: 35,
                          child: MaterialButton(
                            color: haspressed5?Colors.white:Colors.blue,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey)
                            ),
                            onPressed: () {
                              setState(() {
                                haspressed5=!haspressed5;
                              });
                            },
                            child: Text("Select"),
                          )
                      )
                    ],
                  ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.greenAccent,
                          width: 80,
                          height: 35,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("8:00 AM - 10 PM",
                              style: TextStyle(fontSize: 12,color: Colors.black),),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        // color: Colors.grey[300],
                          width: 80,
                          height: 35,
                          child: MaterialButton(
                            color: haspressed6?Colors.white:Colors.blue,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey)
                            ),
                            onPressed: () {
                              setState(() {
                                haspressed6=!haspressed6;
                              });
                            },
                            child: Text("Select"),
                          )
                      )
                    ],
                  ),),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.greenAccent,
                          width: 80,
                          height: 35,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("8:00 AM - 10 PM",
                              style: TextStyle(fontSize: 12,color: Colors.black),),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        // color: Colors.grey[300],
                          width: 80,
                          height: 35,
                          child: MaterialButton(
                            color: haspressed7?Colors.white:Colors.blue,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey)
                            ),
                            onPressed: () {
                              setState(() {
                                haspressed7=!haspressed7;
                              });
                            },
                            child: Text("Select"),
                          )
                      )
                    ],
                  ),),


                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.yellow,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.greenAccent,
                          width: 80,
                          height: 35,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("8:00 AM - 10 PM",
                              style: TextStyle(fontSize: 12,color: Colors.black),),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        // color: Colors.grey[300],
                          width: 80,
                          height: 35,
                          child: MaterialButton(
                            color: haspressed8?Colors.white:Colors.blue,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey)
                            ),
                            onPressed: () {
                              setState(() {
                                haspressed8=!haspressed8;
                              });
                            },
                            child: Text("Select"),
                          )
                      )
                    ],
                  ),),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 40.0),
            child:  MaterialButton(
              minWidth: 300,
              height: 50,
              color: Colors.blue,
              onPressed: () {  },
              child: Text("Add Work",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          )
        ],
      ),
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
          title: const Text('Add Work',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
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


}


Widget makeInput({hint}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 2),
      TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: Colors.grey[100],
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
        ),
      ),
      SizedBox(height: 20,)
    ],
  );
}