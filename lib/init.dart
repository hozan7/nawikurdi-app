import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nawi_kurdi/screens/aboutus.dart';
import 'package:nawi_kurdi/screens/home.dart';
import 'package:nawi_kurdi/screens/new_name.dart';
import 'package:nawi_kurdi/screens/favorite.dart';

class InitializePage extends StatefulWidget {
  InitializePage({Key key}) : super(key: key);

  @override
  _InitializePageState createState() => _InitializePageState();
}

class _InitializePageState extends State<InitializePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'ناوی کوردی',
            style: TextStyle(color: Colors.white,),
          ),
        ),
      ),
      body: TabBarView(
        children: [
          HomeScreen(),
          NewNameScreen(),
          FavoriteScreen(),
          AboutusScreen(),
        ],
      ),
      bottomNavigationBar: new TabBar(
        tabs: [
          Tab(
            icon: new Icon(Icons.home),
          ),
          Tab(
            icon: new Icon(Icons.add),
          ),
          Tab(
            icon: new Icon(Icons.favorite),
          ),
          Tab(
            icon: new Icon(FontAwesomeIcons.info, size: 20,),
          ),
        ],
        labelColor: Color.fromRGBO(51, 20, 10, 1.0),
        unselectedLabelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Color.fromRGBO(51, 20, 10, 1.0),
      ),
      backgroundColor: Color.fromRGBO(206, 163, 108, 1.0),
    );
  }
}
