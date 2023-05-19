import 'package:flutter/material.dart';


class ForgotPassword extends StatelessWidget{
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Password'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 280,
              padding: const EdgeInsets.all(10.0),
              child: const TextField(
                autocorrect: true,
                decoration: InputDecoration(hintText: 'New Password'),
              ),

            ),
            Container(
              width: 280,
              padding: const EdgeInsets.all(10.0),
              child: const TextField(
                autocorrect: true,
                decoration: InputDecoration(hintText:'Confirm Password ' ),
              ),
            ),
            TextButton(onPressed: (){},
                child: const Text('Save password'),

            )

          ],
        ),
      ),
    );
  }

}