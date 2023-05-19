import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Const/responsive.dart';

var filterRadioValue = 1;

StatefulBuilder filterPresets1(){
  return StatefulBuilder(
      builder: (BuildContext context, StateSetter state) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Container(
                  padding: EdgeInsets.only(left:10,top: 10),
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(
                          flex: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.72,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Filter by status",textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),),
                            ),
                          )),


                      MaterialButton(
                        onPressed:(){Navigator.of(context).pop();},
                        child: Icon(Icons.close,color: Colors.grey,size: 30,),
                      ),
                    ],
                  )

              ),

              Container(
                padding: EdgeInsets.only(left:20,right: 20),
                child:  ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text('Open'),
                  trailing:  Radio(
                    value: 0,
                    groupValue: filterRadioValue,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      state(() {
                        filterRadioValue = int.parse(value.toString());
                        print("Radio Value $filterRadioValue");
                      });
                    },),
                ),
              ),

              Container(
                padding: EdgeInsets.only(left:20,right: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text('Accepted',),
                  trailing: Radio(
                    value: 1,
                    groupValue: filterRadioValue,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      state(() {
                        filterRadioValue = int.parse(value.toString());
                        print("Radio Value $filterRadioValue");
                      });
                    },
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(left:20,right: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text('Completed'),
                  trailing: Radio(
                    value: 2,
                    groupValue: filterRadioValue,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      state(() {
                        filterRadioValue = int.parse(value.toString());
                        print("Radio Value $filterRadioValue");
                      });
                    },
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(left:20,right: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text('Paid'),
                  trailing: Radio(
                    value: 3,
                    groupValue: filterRadioValue,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      state(() {
                        filterRadioValue = int.parse(value.toString());
                        print("Radio Value $filterRadioValue");
                      });
                    },
                  ),
                ),
              ),


            ],
          ),
        );
      });
}

Responsive filterPresets(){
  return Responsive(
      mobile: filterPresets1(),
      tablet:  Center(
        child: Container(
          width: 300,
          child: filterPresets1(),
        ),
      ),
      desktop: Center(
        child: Container(
          width: 300,
          child:filterPresets1(),
        ),
      )
  );
}


class RadioButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RadioButtonState();
  }

}


class RadioButtonState extends State<RadioButton>{



  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  AppBar(
       title: Text("Appbar"),
     ),
     body: Padding(
       padding: EdgeInsets.symmetric(vertical: 10),
       child: Column(
        children: [
          filterPresets1(),
          if(filterRadioValue == 1)...[
            Text("Hii"),
          ]

          else if (filterRadioValue == 2)...[
            Text("Hii 2")
          ]


        ],
       )
     ),
   );
  }


}