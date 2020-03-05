import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nawi_kurdi/models/card_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardWidget extends StatelessWidget {
  CardName nameData;
  CardWidget(this.nameData);

  void addFavorite() async {
    // await clearfav();
    var tmpObj = {
      'name': nameData.name,
      'desc': nameData.desc,
      'gender': nameData.gender
    };
    var localFavs = await getFavs();
    var localFavsArr = [];
    if (localFavs != null) {
      localFavsArr = jsonDecode(localFavs);
    }

    // check if exist or not
    // if(checkOfExist(localFavsArr,tmpObj)) localFavsArr.add(tmpObj);
    // else localFavsArr.remove(tmpObj);
    localFavsArr.add(tmpObj);
    updateLocalData(jsonEncode(localFavsArr));
    print(jsonDecode(await getFavs()));
  }

  void removeFavorite() async {
    var tmpObj = {
      'name': nameData.name,
      'desc': nameData.desc,
      'gender': nameData.gender
    };
    var localFavs = await getFavs();
    var localFavsArr = [];
    if (localFavs != null) {
      localFavsArr = jsonDecode(localFavs);
    }

    localFavsArr.remove(tmpObj);
    updateLocalData(jsonEncode(localFavsArr));
    print(jsonDecode(await getFavs()));
  }

  /////////////////////////  shared prefrences  /////////////////////////////
  updateLocalData(favs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fav', favs);
  }

  clearfav() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('fav');
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
                  nameData.gender == 'M'
                      ? FontAwesomeIcons.male
                      : nameData.gender == 'F'
                          ? FontAwesomeIcons.female
                          : FontAwesomeIcons.child,
                  color: nameData.gender == 'M'
                      ? Colors.blue[100]
                      : nameData.gender == 'F'
                          ? Colors.pink[100]
                          : Colors.orange[100],
                  size: 30,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      nameData.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromRGBO(101, 40, 23, 1.0),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addFavorite();
                  },
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red[400],
                  ),
                ),
                GestureDetector(
                  onTap: () async{
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
              nameData.desc,
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
