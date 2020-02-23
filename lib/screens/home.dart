import 'package:flutter/material.dart';
import 'package:nawi_kurdi/widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var textDropdwon = 'هەموو';
  bool selected = false;

  void _showcontent() {
    showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new SimpleDialog(
          // title: const Text('Select assignment'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  textDropdwon = 'هەموو';
                });
              },
              child: const Text('هەموو'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  textDropdwon = 'هاوبەش';
                });
              },
              child: const Text('هاوبەش'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  textDropdwon = 'کوڕ';
                });
              },
              child: const Text('کوڕ'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  textDropdwon = 'کچ';
                });
              },
              child: const Text('کچ'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            padding: EdgeInsets.all(0),
            height: 50,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _showcontent();
                  },
                  child: Container(
                    decoration: new BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color.fromRGBO(246, 242, 230, 1.0),
                          width: 1.0,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.only(left: 5.0),
                    padding: EdgeInsets.only(right: 15.0),
                    height: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Text(
                          textDropdwon,
                          // style: TextStyle(color: Colors.blueGrey[900]),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                new Flexible(
                  child: new TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'گەڕان',
                    ),
                  ),
                ),
              ],
            ),
          ),
          CardWidget(),
          CardWidget(),
          CardWidget(),
        ],
      ),
    );
  }
}
