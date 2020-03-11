import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nawi_kurdi/models/card_name.dart';
import 'package:nawi_kurdi/widgets/card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<dynamic> names = [];
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    getFavs();
    super.initState();
  }

  getFavs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var favs = prefs.getString('fav');
    var result = [];
    if (favs != null) {
      result = jsonDecode(favs);
    }
    setState(() {
      names = result.map((n) => CardName.fromJson(n)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: names.length,
              itemBuilder: (context, int index) {
                return CardWidget(names[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
