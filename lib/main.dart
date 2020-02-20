import 'package:flutter/material.dart';
import 'package:nawi_kurdi/init.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // for direction rtl
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
      theme: ThemeData(
        fontFamily: 'UbuntuKurdish',
        primarySwatch: Colors.orange,
      ),
      home: DefaultTabController(
        length: 3,
        child: InitializePage(),
      ),
    );
  }
}
