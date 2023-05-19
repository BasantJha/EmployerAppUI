import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Const/responsive.dart';



class BusinessInfo extends StatefulWidget {
   BusinessInfo({Key? key}) : super(key: key);

  @override
  _BusinessInfoState createState() => _BusinessInfoState();
}

class _BusinessInfoState extends State<BusinessInfo> {
  Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: Container(
      padding: EdgeInsets.only(left: 20),
      height: 210,
      width: 300,
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                color: Colors.blue[900],
              ),
              height: 60,
              width: 300,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Thank You For Registering \n on Contract Jobs',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                        ),
                      ),
                    ],
                  ),),
              ),
            ),
            Container(
              height: 140,
              width: 300,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text("Your account is currently inactive, \n you will be informed once \n your request has been accepted",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),),
    ),
  );

  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15,80,15,20),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/login-bg.jpg"),
                fit: BoxFit.cover),
          ),
          child: Card(
            child: Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Column(
                children: [
                  makeInput(hint: 'Company Name'),
                  makeInput(hint: "Address"),
                  makeInput(hint: "City"),
                  makeInput(hint: "State"),
                  makeInput(hint: "Zip Code"),

                  Padding(
                    padding: EdgeInsets.all(20),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height:60,
                      onPressed: () {
                        showDialog(context: context, builder: (BuildContext context) => errorDialog);
                      },
                      color: Colors.blue,
                      child: Text("Complete",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16,
                          color: Colors.white
                      ),),
                    ),),
                ],
              ),),
          ),),),
    );
  }


  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: const Text('Business Info',
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

Widget makeInput({hint,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 3),
      TextField(
        obscureText:obsureText ,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
        ),
      ),
      SizedBox(height: 30,)
    ],
  );
}