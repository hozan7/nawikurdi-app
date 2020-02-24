import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardWidget extends StatelessWidget {
  var name="", desc="", gender="";
  CardWidget(nameData) {
    name=nameData['name'];
    desc=nameData['desc'];
    gender=nameData['gender'];
  }

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
                  gender == 'M' ?  FontAwesomeIcons.male : gender == 'F' ? FontAwesomeIcons.female : FontAwesomeIcons.child,
                  color: gender == 'M' ?  Colors.blue[100] : gender == 'F' ? Colors.pink[100] : Colors.orange[100],
                  size: 30,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromRGBO(101, 40, 23, 1.0),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.red[400],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              desc,
              style: TextStyle(
                color: Color.fromRGBO(101, 40, 23, 0.7),
                fontSize: 12,
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
