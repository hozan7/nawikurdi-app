import 'package:flutter/material.dart';

class AboutusScreen extends StatefulWidget {
  @override
  _AboutusScreenState createState() => _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'دەربارەی ئێمە',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: Container(
        child: Text('Aboutus Screen'),
      ),
    );
  }
}
