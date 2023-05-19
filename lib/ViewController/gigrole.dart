import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Const/responsive.dart';

class GigDemo extends StatefulWidget {
  const GigDemo({Key? key}) : super(key: key);

  @override
  _GigDemoState createState() => _GigDemoState();
}

class _GigDemoState extends State<GigDemo>{
  List<Map<String,dynamic>> gigreport = [
    {
      "Gigrole": "Teacher",
      "Date": "13-07-2022",
      "Total Quantity": "42",
      "Done Quantity": "32",
      "Rate": "4200",
      "verify Quantity": "234"
    },
    {
      "Gigrole": "Teacher",
      "Date": "13-07-2022",
      "Total Quantity": "42",
      "Done Quantity": "32",
      "Rate": "4200",
      "verify Quantity": "234"
    }
  ];
  Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Container(
        height: 150,
        width: 300,
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20.0,right: 10.0,left: 10.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
                  child:  TextField(
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Verify Quantity'),
                ),
              ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: (){},
                  child: Text("Verify")
              )
            ],
          ),),
      )
  );

  ListView MainfunctionUi(){
    return ListView.builder(
      itemCount: gigreport.length,
      itemBuilder: (BuildContext context, int index){
        return Padding(
            padding: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                )
              ),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 400,
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        padding: EdgeInsets.only(top: 10.0,left: 10.0,bottom: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      padding: EdgeInsets.only(left: 5.0),
                                      width: 80,
                                      height: 35,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Gig Role",
                                          style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 80,
                                    height: 35,
                                    child:  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("Teacher",
                                        style: TextStyle(fontSize: 12,color: Colors.black),),
                                    ),
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
                                        child: Text("Date",
                                          style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
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
                                    child:  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("13-07-2022",
                                        style: TextStyle(fontSize: 12,color: Colors.black),),
                                    ),
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
                                        child: Text("Total Quantity",
                                          style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
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
                                    child:  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("30",
                                        style: TextStyle(fontSize: 12,color: Colors.black),),
                                    ),
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
                                        child: Text("Done Quantity",
                                          style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
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
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("30",
                                        style: TextStyle(fontSize: 12,color: Colors.black),),
                                    ),
                                  )
                                ],
                              ),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 140,
                        padding: EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      width: 80,
                                      height: 35,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Completed",
                                          style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    //width: 80,
                                      height: 35,
                                      child:  Align(
                                        alignment: Alignment.topRight,
                                        child:TextButton(onPressed: (){
                                          showDialog(context: context, builder: (BuildContext context) => errorDialog);
                                        },
                                            child: Image.asset('verified.png',
                                              height: 20,
                                              width: 30,
                                            )
                                        ),
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
                                      // width: 80,
                                      height: 35,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Rate",
                                          style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    // color: Colors.grey[300],
                                    // width: 80,
                                    height: 35,
                                    child:  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("4200",
                                        style: TextStyle(fontSize: 12,color: Colors.black),),
                                    ),
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
                                        child: Text("Verify Quantity",
                                          style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
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
                                    child:  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("30",
                                        style: TextStyle(fontSize: 12,color: Colors.black),),
                                    ),
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
                                        child: Text(" ",
                                          style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
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
                                    child:  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(" ",
                                        style: TextStyle(fontSize: 12,color: Colors.black),),
                                    ),
                                  )
                                ],
                              ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ));
      },
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
              title: const Text("Gig Report",
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