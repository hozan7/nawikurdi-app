import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class NewNameScreen extends StatefulWidget {
  @override
  NewNameScreenState createState() {
    return NewNameScreenState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class NewNameScreenState extends State<NewNameScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerMeaning = TextEditingController();

  String textDropdwon = 'هاوبەش';
  String gender = 'O';

  void _showcontent() {
    showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: Center(child: const Text('ڕیزدەکەم بەپێی :')),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  textDropdwon = 'هاوبەش';
                  gender = 'O';
                });
                // fetchNames();
              },
              child: Container(
                padding: EdgeInsets.only(right: 80),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.child,
                      color: Colors.orange[100],
                      size: 15,
                    ),
                    const Text(' هاوبەش '),
                  ],
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  textDropdwon = 'کوڕ';
                  gender = 'M';
                });
              },
              child: Container(
                padding: EdgeInsets.only(right: 80),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.male,
                      color: Colors.blue[100],
                      size: 15,
                    ),
                    const Text(' کوڕ '),
                  ],
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  textDropdwon = 'کچ';
                  gender = 'F';
                });
                // fetchNames();
              },
              child: Container(
                padding: EdgeInsets.only(right: 80),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.female,
                      color: Colors.pink[100],
                      size: 15,
                    ),
                    const Text(' کچ '),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controllerName.dispose();
    _controllerMeaning.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Image(
              image: AssetImage('images/nawikurdi.png'),
              height: 150.0,
            ),
            Center(
              child: Text('ناوێکی نوێ زیاد بکە '),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              padding: EdgeInsets.only(right: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'ناوێک بنووسە بۆ ناردن',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'تکایە ناوێک بنووسە';
                  }
                  return null;
                },
                controller: _controllerName,
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              padding: EdgeInsets.only(right: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'مانای ناوە نووسراوەکەت بنووسە',
                ),
                controller: _controllerMeaning,
              ),
            ),
            GestureDetector(
              onTap: () {
                _showcontent();
              },
              child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Text(
                        textDropdwon,
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  )),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('ناردن ...')));
                        sendName();
                      }
                    },
                    child: Text('ناردن'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendName() async {
    final body = {'name': _controllerName.text, 'desc': _controllerMeaning.text, 'gender': gender};
    final res = await http.post('https://api.nawikurdi.com/', body: body);
    print('res');
    print(res);
    if (res.statusCode == 200) {
      print(jsonDecode(res.body)['status']);
      if (jsonDecode(res.body)['status'] == 1) {
        setState(() {
          gender = 'O';
          textDropdwon = 'هاوبەش';
        });
        _controllerName.clear();
        _controllerMeaning.clear();
      }
    }
  }
}
