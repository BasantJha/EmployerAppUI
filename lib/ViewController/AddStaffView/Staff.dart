import 'package:flutter/material.dart';

import '../../Const/responsive.dart';



class StaffScreen extends StatefulWidget {
  const StaffScreen({Key? key}) : super(key: key);

  @override
  _StaffScreenState createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {

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
            padding: EdgeInsets.only(left: 10.0,right: 10.0,top:20.0),
            width: 400,
            height: 70,
            child: ElevatedButton.icon(
              icon: Icon(Icons.contact_page_rounded),
              onPressed: () {},
              label: Text("Add Staff",
                style: TextStyle(color: Colors.white),
              ),
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
          // Container(
          //   padding: EdgeInsets.only(left: 10.0,right: 10.0,top:10.0),
          //   width: 400,
          //   height: 80,
          //   child: Card(
          //     child: Padding(
          //       padding: EdgeInsets.only(left: 10.0,top: 10.0),
          //       child: Align(
          //         alignment: Alignment.centerLeft,
          //         child: Column(
          //           children: [
          //             Text("Andy Akal"),
          //             Text("Not Marked")
          //           ],
          //         ),),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
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
    var size = MediaQuery.of(context).size;
   return Scaffold(
     appBar: AppBar(
       leading: BackButton(
         color: Colors.black,
       ),
       centerTitle: true,
       title:  Text('Staff',
         style: TextStyle( color: Colors.black,fontWeight: FontWeight. bold),),
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