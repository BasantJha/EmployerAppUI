
import 'package:flutter/material.dart';
import 'BusinessInfo.dart';
import '../Const/responsive.dart';
class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>{
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  late String _otp;

  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
      child: Container(
        //width: Responsive.isSmallScreen(context)?size.width:size.width/3,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/login-bg.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/otpicon.png',
                height: 200.0,
                width: 200.0,
              ),
              width: double.infinity,
            ),
            Container(
              child:  Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
                          child: Text("A text with a one time password (OTP) has been sent to your Mobile Number: 934***3434",
                            style: TextStyle(fontSize: 12,color: Colors.black),),
                        ),
                      ),
                    ],
                    ),
                    // Expanded(
                    //   child:Text("A text with a one time password (OTP) has been sent to your Mobile Number: 934***3434"),
                    // ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OtpInput(_fieldOne, true),
                          OtpInput(_fieldTwo, false),
                          OtpInput(_fieldThree, false),
                          OtpInput(_fieldFour, false)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height:40,
                        onPressed: (){
                          setState(() {
                            _otp = _fieldOne.text +
                                _fieldTwo.text +
                                _fieldThree.text +
                                _fieldFour.text;
                          });
                          Navigator.push(
                            context,MaterialPageRoute(builder: (_)=>  BusinessInfo()),
                          );
                        },
                        color: Colors.blue,
                        child: Text("Verify",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16,
                          color: Colors.white,
                        ),),
                      ),),
                    TextButton(
                      onPressed: () {
                      },
                      child: const Text('Resend OTP',
                        style: TextStyle(color: Colors.blue, fontSize: 12
                        ),
                      ),
                      style: ButtonStyle(
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('OTP Verification',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
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
}
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}