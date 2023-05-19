import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Const/responsive.dart';

class Work extends StatefulWidget {
  const Work({Key? key}) : super(key: key);

  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
  List<String> _locations = ['Attendance Approval','Work Approval'];
  String? _selectedLocation;
  List<String> images = [
    " ",
    " ",
    "  ",
    " ",
    " ",
    " "
  ];
  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
            //color: Colors.grey[200],
            width: 400,
            child: DropdownButtonFormField(
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
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0,right: 10.0),
            child: TextField(
              textAlign: TextAlign.left,
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
            ),),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
                padding: EdgeInsets.only(right: 20.0,top: 10.0),
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Approve All",
                    style: TextStyle(color: Colors.white),
                  ),
                )
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext, index){
                          return Card(
                            child: Column(
                              children: [
                                Container(
                                    height: 80,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0,left: 10.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Center(
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 5.0),
                                                      width: 80,
                                                      height: 60,
                                                      child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Column(
                                                            children: [
                                                              Text("Arun Akal",
                                                                style: TextStyle(fontSize: 12,color: Colors.black),),
                                                              Text("1 May - 17 May",
                                                                style: TextStyle(fontSize: 12,color: Colors.black),),
                                                            ],
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                      padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                                                      width: 100,
                                                      height: 50,
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        child: Text("Select",
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                      )
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
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
                                            height: 60,
                                            padding: EdgeInsets.only(left: 10.0,top: 10.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Delivery "),
                                                Text("5")
                                              ],
                                            )
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
                                            onPressed: () {},
                                          )
                                      )
                                    ],
                                  ),),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: images.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.vertical,
                      )
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          centerTitle: true,
          title:  Text('Work',
            style: TextStyle( color: Colors.black,fontWeight: FontWeight. bold),),
          actions: <Widget>[
            Container(
              color: Colors.white,
              child: IconButton(
                icon: new Image.asset('assets/download.png'),
                onPressed: () {},
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
}

