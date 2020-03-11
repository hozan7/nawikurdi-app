import 'dart:convert';

import 'package:connectivity/connectivity.dart';
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
  bool _isButtonDisabled = false;

  String textContent = '';

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
  void initState() {
    checkInternetConnection();
    super.initState();
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerMeaning.dispose();
    super.dispose();
  }

  void checkInternetConnection() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      setState(() {
        _isButtonDisabled = true;
        textContent = 'تکایە ئینتەرنێت پێکە ';
      });
    } else {
      // ConnectivityResult.mobile + ConnectivityResult.wifi
      setState(() {
        _isButtonDisabled = false;
        textContent = '';
      });
    }
  }

  sendName() async {
    final body = {
      'name': _controllerName.text,
      'desc': _controllerMeaning.text,
      'gender': gender
    };
    final res = await http.post('https://api.nawikurdi.com/', body: body);
    if (res.statusCode == 200) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Image(
                      image: AssetImage('assets/images/nawikurdi.png'),
                      height: 150.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text('ناوێکی نوێ زیاد بکە '),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 20.0),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          color: _isButtonDisabled
                              ? Colors.grey
                              : Color.fromRGBO(206, 163, 108, 1.0),
                          onPressed: () {
                            if (!_isButtonDisabled) {
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a Snackbar.
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('ناردن ...')));
                                sendName();
                              }
                            }
                          },
                          child: Text(
                            'ناردن',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _isButtonDisabled
                ? Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            textContent,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
          ],
        ),
      ),
    );
  }
}
