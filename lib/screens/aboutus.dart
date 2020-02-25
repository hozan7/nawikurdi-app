import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutusScreen extends StatefulWidget {
  @override
  _AboutusScreenState createState() => _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
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
                          FontAwesomeIcons.userFriends,
                          color: Color.fromRGBO(101, 40, 23, 1.0),
                          size: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            'ئاپی ناوی کوردی',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color.fromRGBO(101, 40, 23, 1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'ماڵپەری ناوەکان بە یەکەم پرۆژەی درەختی گەشەپێدەران دادەنرێت کە وەک سەرچاوەیەک و ئەرشیفێک کاردەکات بۆ ناوەکانی زمانی کوردی و ماناکانیان .',
                          style: TextStyle(
                              color: Color.fromRGBO(101, 40, 23, 0.7),
                              fontSize: 13,
                              wordSpacing: 3),
                        ),
                        Text(
                          'تێبینی: سوپاسی ھەموو لایەک و سەرچاوەیەکی کوردی دەکەین کە بەشداربوونە لە کۆکردنەوەی ناوەکان ھەروەھا سوپاسی ئەوانەش دەکەین کە کارێکیان بەشداربوونە لە دەولەمەند کردنی زمانی کوردی و ئێمە سوودمان لێیان وەرگرتووە و زانیاریەکانمان وەرگرتوە لێیان.',
                          style: TextStyle(
                              color: Color.fromRGBO(101, 40, 23, 0.7),
                              fontSize: 13,
                              wordSpacing: 3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
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
                          FontAwesomeIcons.unlock,
                          color: Color.fromRGBO(101, 40, 23, 1.0),
                          size: 20,
                        ),
                        Text(
                          ' سەرچاوەکراوەیە',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromRGBO(101, 40, 23, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'بە مانای ئەوەی هەموو سەرچاوەی کۆدەکەی لە گیتهەب هەیە دەتوانیت بەشداربیت لە پەرەپێدان و باشترکردنی یان سود لە کۆدەکەی وەربگریت',
                          style: TextStyle(
                              color: Color.fromRGBO(101, 40, 23, 0.7),
                              fontSize: 13,
                              wordSpacing: 3),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchURL('https://github.com/DevelopersTree/nawikurdi');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.github,
                                size: 16,
                              ),
                              Text(
                                'سەرچاوە',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
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
                          Icons.notifications,
                          color: Color.fromRGBO(101, 40, 23, 1.0),
                          size: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 3),
                          child: Text(
                            'پەیوەندیمان پێوەبکە',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color.fromRGBO(101, 40, 23, 1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'خۆشحاڵ دەبین بە زانینی هەر رەخنەو پێشنیارێک دەتوانن لە رێگای پەرەی فەیسبووکی درەختی گەشەپێدەرانەوە نامەو پێشنیارەکانتان بگەیەنن',
                          style: TextStyle(
                              color: Color.fromRGBO(101, 40, 23, 0.7),
                              fontSize: 13,
                              wordSpacing: 3),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchURL('https://www.facebook.com/DevelopersTree');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.facebook,
                                size: 16,
                                color: Color.fromRGBO(66, 103, 178, 1.0),
                              ),
                              Text(
                                'پەڕەی فەیسبووک',
                                style: TextStyle(
                                  color: Color.fromRGBO(66, 103, 178, 1.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
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
                          FontAwesomeIcons.tree,
                          color: Color.fromRGBO(101, 40, 23, 1.0),
                          size: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 3),
                          child: Text(
                            'درەختی گەشەپێدەران',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color.fromRGBO(101, 40, 23, 1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'ماڵپەرەکەمان سەرچاوەیەکی ئەکادیمی زانستی کۆمپیتەرە دەتوانیت جۆرەها بابەت و زانیاری وەربگریت ئاستی خۆت بەرەوپێش ببەیت',
                          style: TextStyle(
                            color: Color.fromRGBO(101, 40, 23, 0.7),
                            fontSize: 13,
                            wordSpacing: 3,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchURL('https://devstree.io/');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.tree,
                                size: 16,
                                color: Color.fromRGBO(167, 201, 55, 1.0),
                              ),
                              Text(
                                'درەختی گەشەپێدەران',
                                style: TextStyle(
                                  color: Color.fromRGBO(167, 201, 55, 1.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
