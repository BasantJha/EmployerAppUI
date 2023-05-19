import 'package:flutter/material.dart';
import 'package:loginpge/ViewController/Dateselection.dart';
import 'package:loginpge/ViewController/MyWorkPlaceView/MyWorkPlaceController.dart';
import 'package:loginpge/ViewController/gigrole.dart';

import '../Const/responsive.dart';
import 'DashBoard.dart';
import 'ForgotPassword.dart';
import 'SignUp.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  bool isChecked = false;
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  bool _isvalid=false;
   late Box box1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createopenBox();
  }
  void createopenBox() async {
    box1 = await Hive.openBox('logindata');
    getdata();
  }
  void getdata()async{
    if(box1.get('email')!=null){
      _emailController.text = box1.get('email');
      isChecked = true;
      setState(() {
      });
    }
    if(box1.get('pass')!=null){
      _passwordController.text = box1.get('pass');
      isChecked = true;
      setState(() {
      });
    }
  }
  SingleChildScrollView MainfunctionUi(){
    return SingleChildScrollView(
      child: Center(
        child: Container(
          // width: Responsive.isSmallScreen(context)?width.width:width.width/3,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/login-bg.jpg"),
                fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset('assets/banner.png',
                  width: 250,
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22,top:0,bottom: 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children:  [
                        Text("Welcome!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 30,
                          ),
                        ),
                        Text("Sign in to continue",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),

                  ),
                ),

                //<-- Email Textfield section -->
                Padding(
                  padding:  EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 5.0, bottom: 10),

                  child: TextFormField(
                    controller: _emailController, keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/email.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.fill,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Enter valid email id as abc@gmail.com'),

                  ),
                ),
                //<-- Password Section -->
                Padding(
                  padding:  EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10, bottom: 0),
                  child: TextField(
                    controller: _passwordController, keyboardType: TextInputType.visiblePassword,

                    obscureText: true,

                    decoration:  InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/password.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.fill,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Enter secure password'),
                  ),
                ),
                // <-- Remember me or Forget password Section -->
                Container(

                  padding: EdgeInsets.only(left: 11,right: 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Container(
                        // value: isChecked,
                        // onChanged: (value){
                        //   setState(() {
                        //     isChecked = !isChecked;
                        //   });
                        // }

                          child: Row(
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
                              Text("Remember me",style: TextStyle(color: Colors.black,fontSize: 12)),
                            ],
                          )
                      ),

                      // SizedBox(
                      //   width: 15,
                      // ),



                      Container(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,MaterialPageRoute(builder: (_)=> const Dateselection()),
                            );
                          },
                          child: const Text('ForgetPassword?',
                            style: TextStyle(color: Colors.black, fontSize: 12
                            ),
                          ),
                        ),),
                    ],
                  ),),
                // <-- Login Code -->
                Container(
                  height: 50,
                  width: 300,
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height:60,
                    onPressed: (){
                      login();
                      Navigator.push(
                        context,MaterialPageRoute(builder: (_)=> Responsive(
                        mobile: DashBoard(),
                        tablet: Center(
                          child: Container(
                            width: 400,
                            child: DashBoard(),
                            //SharedPreference(title: 'Shared Location',)
                          ),
                        ),
                        desktop: Center(
                          child: Container(
                            width: 400,
                            child: DashBoard(),
                          ),
                        ),
                      )),

                     // const DashBoard()
                      );
                    },
                    color: Colors.blue,
                    child: Text("Sign In",style: TextStyle(
                        fontWeight: FontWeight.w600,fontSize: 16,
                        color: Colors.white
                    ),),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: 60,
                    width: 250,
                    child: Row(
                      children:  [
                        SizedBox(
                          width: 35,
                        ),
                        Text("New Employer?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,MaterialPageRoute(builder: (_)=>  SignUp()),
                            );
                          },
                          child:  Text('Sign Up!',
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),),);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size;
    return MaterialApp(
      title: "Sign In",
        debugShowCheckedModeBanner: false,
        home: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/login-bg.jpg"), fit: BoxFit.cover)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                title: const Text("Sign In",
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
     ),
    );
  }
  void login(){
    if(isChecked){
      box1.put('email', _emailController.value.text);
      box1.put('pass', _passwordController.value.text);
    }
  }
// bool validatePassword(String value){
//   RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
//
//   if(value.isEmpty){
//     return false;
//   }
//   else if(!regex.hasMatch(value)){
//     return false;
//   }
//   else{
//     return true;
//   }
}
//<-- login Function -->
//signin(){
//   _isvalid = EmailValidator.validate(_emailController.text);
//   if (_isvalid && validatePassword(_passwordController.text)) {
//     showDialog(
//       context: context,
//       builder: (ctx) =>
//           AlertDialog(
//             title: const Text("Massage"),
//             content: const Text("Successfully login"),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(ctx).pop();
//                 },
//                 child: const Text("okay"),
//               ),
//             ],
//           ),
//     );
//
//     Fluttertoast.showToast(msg: "Valid Email and Password");
//     Navigator.push(
//       context, MaterialPageRoute(builder: (
//         _) => const DashBoard()),
//     );
//   } else if (_emailController.text.isEmpty) {
//     showDialog(
//       context: context,
//       builder: (ctx) =>
//           AlertDialog(
//             title: const Text("Error Massage"),
//             content: const Text("Enter Email"),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(ctx).pop();
//                 },
//                 child: const Text("okay"),
//               ),
//             ],
//           ),
//     );
//
//     Fluttertoast.showToast(msg: "Enter email");
//   }
//   else {
//     if (!_isvalid) {
//       showDialog(
//         context: context,
//         builder: (ctx) =>
//             AlertDialog(
//               title: const Text("Error Massage"),
//               content: const Text(" please Enter valid Email"),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(ctx).pop();
//                   },
//                   child: const Text("okay"),
//                 ),
//               ],
//             ),
//       );
//
//       Fluttertoast.showToast(msg: "Enter valid email");
//     }
//     else {
//       showDialog(
//         context: context,
//         builder: (ctx) =>
//             AlertDialog(
//               title: const Text("Error Massage"),
//               content: const Text(
//                   "Password Format is not correct "
//                       "\nHint: Rohit@1003"),
//
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(ctx).pop();
//                   },
//                   child: const Text("okay"),
//                 ),
//               ],
//             ),
//       );
//
//       Fluttertoast.showToast(msg: "Enter Correct password");
//     }
//     // Fluttertoast.showToast(msg: "Enter a valid email and password");
//   }
// }
//}










