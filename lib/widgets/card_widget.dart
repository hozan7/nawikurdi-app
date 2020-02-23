import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(4),
            child: Icon(
              Icons.supervised_user_circle,
              color: Colors.blue[300],
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'ناو',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    child: Divider(
                      color: Colors.teal.shade100,
                    ),
                  ),
                  Text(
                      'باسکردن باسکردن باسکردن باسکردنمانای ناوەکە باسکردن مانا مانا واتا '
                      ),
                  Icon(Icons.favorite)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
