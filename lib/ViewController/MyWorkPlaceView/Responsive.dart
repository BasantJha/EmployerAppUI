
// import 'package:flutter/material.dart';
//
// enum datepresets {maximum,today,yesterday,last7days}
// datepresets _character1 = datepresets.maximum;
//
// class datePresets extends StatefulWidget{
//   _datePresets createState() => _datePresets();
// }
//
// class _datePresets extends State<datePresets> {
//   Widget buildFilter(){
//    return StatefulBuilder(
//       builder: (BuildContext context, StateSetter state){
//         showModalBottomSheet(
//             context: context,
//             builder: (context) {
//              return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Container(
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Expanded(
//                           flex: 1,
//                           child: Container(
//                             // color: Colors.greenAccent,
//                             width: 80,
//                             height: 35,
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text("Date Presets",
//                                 style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold,
//                                     color: Colors.black),),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Container(
//                           // color: Colors.grey[300],
//                             width: 80,
//                             height: 35,
//                             child: IconButton(
//                                 onPressed: (){
//                                   Navigator.of(context).pop();
//                                 },
//                                 icon: Icon(Icons.close))
//                         )
//                       ],
//                     ),),
//                   RadioListTile(
//                     value: datepresets.maximum,
//                     groupValue: _character1,
//                     onChanged: (datepresets? value) {
//                       setState(() {
//                         _character1 = value!;
//                       });
//                     },
//                     title: Text("Maximum"),
//                     subtitle: Text("16 Aprail - 16 may"),
//                     toggleable: true,
//                     controlAffinity: ListTileControlAffinity.trailing,
//                   ),
//                   RadioListTile(
//                     value: datepresets.today,
//                     groupValue: _character1,
//                     onChanged: (datepresets? value) {
//                       setState(() {
//                         _character1 = value!;
//                       });
//                     },
//                     title: Text("Today"),
//                     subtitle: Text("16 May"),
//                     toggleable: true,
//                     controlAffinity: ListTileControlAffinity.trailing,
//                   ),
//                   RadioListTile(
//                     value: datepresets.yesterday,
//                     groupValue: _character1,
//                     onChanged: (datepresets? value) {
//                       setState(() {
//                         _character1 = value!;
//                       });
//                     },
//                     title: Text("Yesterday"),
//                     subtitle: Text("15 May"),
//                     toggleable: true,
//                     controlAffinity: ListTileControlAffinity.trailing,
//                   ),
//                   RadioListTile(
//                     value: datepresets.last7days,
//                     groupValue: _character1,
//                     onChanged: (datepresets? value) {
//                       setState(() {
//                         _character1 = value!;
//                       });
//                     },
//                     title: Text("Last 7 days"),
//                     subtitle: Text("9 May - 15"),
//                     toggleable: true,
//                     controlAffinity: ListTileControlAffinity.trailing,
//                   ),
//                 ],
//               );
//             });
//       });
//   }
// }
//
//   @override
//   Widget build(BuildContext context) {
//     throw UnimplementedError();
//   }
// }
import 'package:flutter/material.dart';

class Responsiveness extends StatelessWidget{
  final Widget largescreen;
  final Widget smallscreen;
  final Widget mediumscreen;

  const Responsiveness({Key? key,
    required this.mediumscreen,
    required this.smallscreen,
    required this.largescreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context){
    return MediaQuery.of(context).size.width<800;
  }
  static bool isMediumScreen(BuildContext context){
    return MediaQuery.of(context).size.width>=800 && MediaQuery.of(context).size.width<=1200;
  }
  static bool isLargeScreen(BuildContext context){
    return MediaQuery.of(context).size.width>1200;
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints){
          if(constraints.maxWidth>1200){
            return largescreen;
          }else if(constraints.maxWidth<=1200 && constraints.maxWidth>=800){
            return mediumscreen??largescreen;
          }else{
            return smallscreen??largescreen;
          }
        }
    );
  }


}

// import '../../Const/responsive.dart';
// import 'package:flutter/material.dart';
// width returnheight(){
//   return width(
//
//   );
// }
// class width extends StatelessWidget{
//   const width({Key? key}) : super(key: key);
//
//   static Size isMobile(BuildContext context){
//     return MediaQuery.of(context).size;
//   }
//   static int  isMediumScreen(BuildContext context){
//     return 300;
//   }
//   static int  isLargeScreen(BuildContext context){
//     return 300;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//         builder: (context,constraints){
//           if(constraints.maxWidth>=1100){
//             return desktop;
//           }else if(constraints.maxWidth >= 480){
//             return tablet;
//           }else{
//             return mobile;
//           }
//          }
//     );
//   }
// }

