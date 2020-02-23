import 'package:flutter/material.dart';
import 'package:nawi_kurdi/init.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(206, 163, 108, .1),
      100: Color.fromRGBO(206, 163, 108, .2),
      200: Color.fromRGBO(206, 163, 108, .3),
      300: Color.fromRGBO(206, 163, 108, .4),
      400: Color.fromRGBO(206, 163, 108, .5),
      500: Color.fromRGBO(206, 163, 108, .6),
      600: Color.fromRGBO(206, 163, 108, .7),
      700: Color.fromRGBO(206, 163, 108, .8),
      800: Color.fromRGBO(206, 163, 108, .9),
      900: Color.fromRGBO(206, 163, 108, 1),
    };
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
        primarySwatch: MaterialColor(0xFFCEA36C, color),
      ),
      home: DefaultTabController(
        length: 3,
        child: InitializePage(),
      ),
    );
  }
}
