
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Const/responsive.dart';

class AddStaffManuallyManually extends StatefulWidget {
  const AddStaffManuallyManually({Key? key}) : super(key: key);

  @override
  _AddStaffManuallyManuallyState createState() => _AddStaffManuallyManuallyState();
}

class _AddStaffManuallyManuallyState extends State<AddStaffManuallyManually> {
  // String? number, name;
  // final ContactPicker contactPicker = new ContactPicker();
  TextEditingController _phonenumbercontroller = TextEditingController();

  @override
  void initState() {
    // number=" ";
    // name=" ";
    super.initState();
  }

  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
      child:Column(
        children: [
          Container(
            //width: Responsive.isSmallScreen(context)?size.width:size.width/3,
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20,top: 15,right: 20),
                    child: SizedBox(
                      width: 400,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          // Contact contact = await contactPicker.selectContact();
                          // if(contact != null){
                          //   number = contact.phoneNumber.number;
                          //   name = contact.fullName;
                          //   setState(() {
                          //     print(number);
                          //     print(name);
                          //   });
                          // }
                        },
                        icon: Icon(
                          Icons.contact_page_rounded,
                          size: 24.0,
                          color: Colors.blue,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white
                        ),
                        label: Text('Add from Contacts',
                            style: TextStyle(fontSize: 20,color: Colors.blue)),
                      ),),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:EdgeInsets.only(left: 10,right: 10,top: 20),
                    child: Row(children: <Widget>[
                      Expanded(
                        child: new Container(
                            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                            child: Divider(
                              color: Colors.black,
                              height: 50,
                            )),
                      ),

                      Text("OR"),

                      Expanded(
                        child: new Container(
                            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 50,
                            )),
                      ),
                    ]),),
                ),
                Container(
                  child: Padding(
                    padding:EdgeInsets.only(left: 10,right: 10,top: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'Staff name'),

                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding:EdgeInsets.only(left: 10,right: 10,top: 30),
                    child: TextFormField(
                      controller: _phonenumbercontroller,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Phone Number',
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0,top: 10.0),
                  //child: Text(_phonenumbercontroller.text.length.toString()+'/10'),
                  alignment: Alignment.topLeft,
                  child: Text("10/10 Digits Remaining",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
                  ),
                ),
                Container(
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                          // color: Colors.greenAccent,
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 35,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Staff will receive regular attendance, Payments updates vis SMS on their numbers",
                              style: TextStyle(fontSize: 12,color: Colors.black),),
                          ),
                        ),
                      ),
                    ],
                  ),),
                SizedBox(
                  //height: 200,
                  height: MediaQuery.of(context).size.height*0.25,
                ),
                Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("By Continuing you agree to"),
                        TextButton(onPressed: (){},
                          child: Text("Terms & Condition",style: TextStyle(
                              fontSize: 18
                          ),),)
                      ],
                    )
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Continue"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.only(left: 16, right: 16,bottom: 16),
      //   child: Row(
      //   children: [
      //     Expanded(
      //       child: Material(
      //         color: Colors.blue,
      //         child: InkWell(
      //           onTap: () {
      //             //print('called on tap');
      //           },
      //           child: const SizedBox(
      //             height: kToolbarHeight,
      //             width: 100,
      //             child: Center(
      //               child: Text(
      //                 'Continue',
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),),
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          centerTitle: true,
          title:  Text('Add Staff',
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
