import 'package:flutter/material.dart';

import '../../Const/responsive.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {

  List<String> images = [
    " ",
    " ",
    "  ",
    " ",
    " ",
    " ",
    " ",
    "  ",
    " ",
    " "
  ];


  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext, index){
                    return Container(
                      padding: EdgeInsets.only(left: 10.0,right: 10.0,top:10.0),
                      width: 400,
                      height: 80,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0,top: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text("Andy Akal"),
                                Text("Not Marked")
                              ],
                            ),),
                        ),
                      ),
                    );
                  },
                  itemCount: images.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          )
        ],
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
        title:  Text('Delivery List',
          style: TextStyle( color: Colors.black,fontWeight: FontWeight. bold),),
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
      ),
    );
  }
  
}