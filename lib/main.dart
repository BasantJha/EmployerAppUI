import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loginpge/Const/responsive.dart';
import 'AttendenceCalender.dart';
import 'Database/userdetailsform.dart';
import 'Firbasedatabase/Firestoredatabase.dart';
import 'FirebaseAuthentication/loginPage.dart';
import 'ViewController/DashBoard.dart';
import 'ViewController/MyWorkPlaceView/Filter.dart';
import 'ViewController/MyWorkPlaceView/MyWorkPlaceController.dart';
import 'ViewController/SignIn.dart';
import 'pdfviewer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //       options: FirebaseOptions(
  //           apiKey: "AIzaSyA42RaXY5g0y-fmTtBLl0RzYpUepM-F3-U",
  //           authDomain: "employerdatabase-7e036.firebaseapp.com",
  //           projectId: "employerdatabase-7e036",
  //           storageBucket: "employerdatabase-7e036.appspot.com",
  //           messagingSenderId: "276948938821",
  //           appId: "1:276948938821:web:ba66cd2a8594cba7a3332c",
  //           measurementId: "G-EMHETS7EZS"
  //       )
  //   );
  // }
  // else {
  //   await Firebase.initializeApp();
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Responsive(
        mobile: SharedPreference(),
       // DynamicEvent(),
        //LoginPage(),
        //Firestoreconnectivity(),
        //DashBoard(),
        tablet: Container(
          width: 400,
          child:
          SharedPreference(),
          //MyWorkPlace(),
          //DynamicEvent(),
          //LoginPage(),
          //Firestoreconnectivity(),
          //DashBoard(),
        ),
        desktop:  Container(
          width: 400,
          child:
          SharedPreference(),
          //MyWorkPlace(),
          //DynamicEvent(),
          //LoginPage(),
          //Firestoreconnectivity(),
          //DashBoard(),
        ),
      ),
    );
  }
}











