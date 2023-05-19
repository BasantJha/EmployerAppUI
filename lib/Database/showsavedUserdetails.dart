import 'package:flutter/material.dart';
import '../Const/responsive.dart';
import 'Userdetails.dart';

import 'databasehelper.dart';
class  DataCard extends StatefulWidget {
  DataCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  List<User> data = [];
  @override
  DataCardState createState() =>  DataCardState(data);
}

class  DataCardState extends State<DataCard> {
  DataCardState(List<User> data);
  //List<User> data = datagiven;
  TextEditingController idDeleteController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool refresh = false;
  ListView MainfunctionUi(){
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.data.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            margin:EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Text("ID"),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Text("Email"),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Text("Name"),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Text("Address"),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Text("Contact"),
                              )
                            ],
                          ),
                        ],
                      )
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(widget.data[index].id.toString()),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(widget.data[index].email.toString()),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(widget.data[index].name.toString()),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(widget.data[index].address.toString()),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(widget.data[index].contact.toString())
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: ElevatedButton(
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      title: Text('Do You want To Delete'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, false), // passing false
                                          child: Text('cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            _delete(widget.data[index].id);
                                            _queryAll();
                                            Navigator.pop(context, false);
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    );
                                  }).then((exit) {
                                if (exit == null) return;

                                if (exit) {
                                  // user pressed Yes button
                                } else {
                                  // user pressed No button
                                }
                              });
                            },
                            child: Text("Delete")
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show table"),
      ),
      body:  Responsive(
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

  void _delete(id) async {
    final rowsDeleted = await dbHelper.delete(id);
    _showMessageInScaffold('deleted $rowsDeleted row(s): row $id');
  }

  void _showMessageInScaffold(String message) {
    // ignore: deprecated_member_use
    // _scaffoldKey.currentState?.showSnackBar(
    //     SnackBar(
    //       content: Text(message),
    //     )
    // );
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  void   _queryAll() async {
    final  allRows = await dbHelper.queryAllRows();
    print(allRows);
    widget.data.clear();
    allRows.forEach((k)
    {
      widget.data.add(User.fromMap(k));
      setState(() {
        widget.data= widget.data;
      });
    });

  }

}
