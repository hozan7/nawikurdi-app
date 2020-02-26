import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nawi_kurdi/models/card_name.dart';
import 'package:nawi_kurdi/widgets/card_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loader = false;

  List<dynamic> names = [];
  ScrollController _scrollController = new ScrollController();

  var textDropdwon = 'هەموو';
  bool selected = true;

  var offset = 0, gender = "";
  String searchText = "";

  final _searchQuery = new TextEditingController();
  Timer _debounce;
  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchText = _searchQuery.text;
      offset = 0;
      fetchNames();
    });
  }

  @override
  void initState() {
    fetchNames();
    _searchQuery.addListener(_onSearchChanged);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchNames();
        offset += 30;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    _searchQuery.removeListener(_onSearchChanged);
    _searchQuery.dispose();

    super.dispose();
  }

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
                  textDropdwon = 'هەموو';
                  names = [];
                  gender = '';
                });
                fetchNames();
              },
              child: Container(
                padding: EdgeInsets.only(right: 80),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.starOfLife,
                      color: Colors.grey[400],
                      size: 15,
                    ),
                    const Text(' هەموو '),
                  ],
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  textDropdwon = 'هاوبەش';
                  names = [];
                  gender = 'O';
                });
                fetchNames();
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
                  names = [];
                  gender = 'M';
                });
                fetchNames();
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
                  names = [];
                  gender = 'F';
                });
                fetchNames();
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

  fetchNames() async {
    var linkAPI = "";
    setState(() {
      loader = true;
    });
    if (searchText.toString().isNotEmpty) {
      names = [];
      if (gender.toString().isNotEmpty) {
        linkAPI =
            'https://api.nawikurdi.com/?limit=30&offset=$offset&gender=$gender&q=$searchText';
      } else {
        linkAPI =
            'https://api.nawikurdi.com/?limit=30&offset=$offset&q=$searchText';
      }
      final res = await http.get(linkAPI);
      if (res.statusCode == 200) {
        var result = jsonDecode(res.body)['names'];
        setState(() {
          names += result.map((n) => CardName.fromJson(n)).toList();
          loader = false;
        });
      }
    } else {
      if (gender.toString().isNotEmpty) {
        linkAPI =
            'https://api.nawikurdi.com/?limit=30&offset=$offset&gender=$gender';
      } else {
        linkAPI = 'https://api.nawikurdi.com/?limit=30&offset=$offset';
      }
      final res = await http.get(linkAPI);
      if (res.statusCode == 200) {
        var result = jsonDecode(res.body)['names'];
        setState(() {
          names += result.map((n) => CardName.fromJson(n)).toList();
          loader = false;
        });
      }
    }
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
                    controller: _searchQuery,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: names.length,
              itemBuilder: (context, int index) {
                return CardWidget(names[index]);
              },
            ),
          ),
          loader
              ? SpinKitThreeBounce(
                  color: Color.fromRGBO(206, 163, 108, 1.0),
                  size: 25.0,
                )
              : Container(
                  width: 0,
                  height: 0,
                ),
        ],
      ),
    );
  }
}
