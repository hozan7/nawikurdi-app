import 'package:flutter/material.dart';
import 'package:nawi_kurdi/screens/aboutus.dart';
import 'package:nawi_kurdi/screens/home.dart';
import 'package:nawi_kurdi/screens/new_name.dart';

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
        title: Text(
          'ناوی کوردی',
          style: TextStyle(color: Colors.white,),
        ),
      ),
      body: TabBarView(
        children: [
          HomeScreen(),
          NewNameScreen(),
          AboutusScreen(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => NewNameScreen()),
      //     );
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar: new TabBar(
        tabs: [
          Tab(
            icon: new Icon(Icons.home),
          ),
          Tab(
            icon: new Icon(Icons.favorite),
          ),
          Tab(
            icon: new Icon(Icons.perm_identity),
          ),
        ],
        labelColor: Color.fromRGBO(51, 20, 10, 1.0),
        unselectedLabelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Color.fromRGBO(246, 242, 230, 1.0),
      ),
      backgroundColor: Color.fromRGBO(206, 163, 108, 1.0),
    );
  }
}
