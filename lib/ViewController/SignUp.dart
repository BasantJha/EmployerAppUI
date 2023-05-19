import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpge/ViewController/BusinessInfo.dart';
import 'package:loginpge/ViewController/OtpPage.dart';
import 'package:loginpge/ViewController/SignIn.dart';
import '../Const/responsive.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
      //padding: const EdgeInsets.fromLTRB(15,60,15,0),
        child: Container(
          //width: Responsive.isSmallScreen(context)?width.width:width.width/3,
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
                  makeInput(hint: 'Full Name'),
                  makeInput(hint: "Email Address"),
                  makeInput(hint: "Mobile Number"),
                  makeInput(hint: "Create password",obsureText: true),

                  Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: isChecked ?Image.asset('assets/no-check.png',
                              width: 30,
                              height: 30,
                              fit:BoxFit.fill
                          ) :  Image.asset('assets/check.png',
                              width: 30,
                              height: 30,
                              fit:BoxFit.fill
                          )
                      ),
                      Expanded(
                        child: Text('"By creating an account you agree to our terms of service and Privacy Policy"',
                            style: TextStyle(color: Colors.black,fontSize: 12)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height:60,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (_)=>  OtpScreen()),
                        );
                      },
                      color: Colors.blue,
                      child: Text("Sign Up",style: TextStyle(
                        fontWeight: FontWeight.w600,fontSize: 16,
                        color: Colors.white,
                      ),),
                    ),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (_)=>  LoginDemo()),
                        );
                      },

                        child: Text("Sign In",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),),)
                    ],
                  )
                ],
              ),),
          ),),
    );
  }
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: const Text('Sign Up',
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
      SizedBox(height: 5),
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
          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        ),
      ),
      SizedBox(height: 30,)
    ],
  );
}