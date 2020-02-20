import 'package:flutter/material.dart';

class NewNameScreen extends StatefulWidget {
  @override
  _NewNameScreenState createState() => _NewNameScreenState();
}

class _NewNameScreenState extends State<NewNameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'ناوێکی نوێ ',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: Container(
        child: Text('New Name Screen'),
      ),
    );
  }
}
