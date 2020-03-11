import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nawi_kurdi/models/card_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardWidget extends StatefulWidget {
  final CardName nameData;
  CardWidget(this.nameData);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool checkFavorite = false;
  @override
  void initState() {
    checkFavs();
    super.initState();
  }

  void addFavorite() async {
    var tmpObj = {
      'nameId': widget.nameData.nameId,
      'name': widget.nameData.name,
      'desc': widget.nameData.desc,
      'gender': widget.nameData.gender
    };
    var localFavs = await getFavs();
    var localFavsArr = [];
    if (localFavs != null) {
      localFavsArr = jsonDecode(localFavs);
    }
    localFavsArr.add(tmpObj);
    updateLocalData(jsonEncode(localFavsArr));
    checkFavs();
  }

  void removeFavorite() async {
    var localFavs = await getFavs();
    var localFavsArr = [];
    if (localFavs != null) {
      localFavsArr = jsonDecode(localFavs);
    }
    localFavsArr
        .removeWhere((item) => item['nameId'] == widget.nameData.nameId);
    updateLocalData(jsonEncode(localFavsArr));
    checkFavs();
  }

  checkFavs() async {
    var localFavs = await getFavs();
    var localFavsArr = [];
    if (localFavs != null) {
      localFavsArr = jsonDecode(localFavs);
    }
    setState(() {
      checkFavorite = localFavsArr.indexWhere((item) => item['nameId'] == widget.nameData.nameId) > -1 ? true : false;
    });
  }

  /////////////////////////  shared prefrences  /////////////////////////////
  updateLocalData(favs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fav', favs);
  }

  getFavs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    var favs = prefs.getString('fav');
    return favs;
  }

  //////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(246, 242, 230, 1.0),
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  widget.nameData.gender == 'M'
                      ? FontAwesomeIcons.male
                      : widget.nameData.gender == 'F'
                          ? FontAwesomeIcons.female
                          : FontAwesomeIcons.child,
                  color: widget.nameData.gender == 'M'
                      ? Colors.blue[100]
                      : widget.nameData.gender == 'F'
                          ? Colors.pink[100]
                          : Colors.orange[100],
                  size: 30,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      widget.nameData.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromRGBO(101, 40, 23, 1.0),
                      ),
                    ),
                  ),
                ),
                !checkFavorite ?
                GestureDetector(
                  onTap: () {
                    addFavorite();
                  },
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red[400],
                  ),
                ) :
                GestureDetector(
                  onTap: () async {
                    removeFavorite();
                  },
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red[400],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              widget.nameData.desc,
              style: TextStyle(
                color: Color.fromRGBO(101, 40, 23, 0.7),
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                  color: Color.fromRGBO(101, 40, 23, 0.6),
                ),
                Text(
                  '٣  |  ',
                  style: TextStyle(
                    color: Color.fromRGBO(101, 40, 23, 1),
                  ),
                ),
                Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                  color: Color.fromRGBO(101, 40, 23, 0.6),
                ),
                Text(
                  '٩',
                  style: TextStyle(
                    color: Color.fromRGBO(101, 40, 23, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
