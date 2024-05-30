import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {

  @override 
  Widget build ( BuildContext context) => IntrinsicHeight( 
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildButton( context, "4.8", "Ranking"),
      buildDivider(),
      buildButton( context, "4.8", "Ranking"),
      buildDivider(),
      buildButton( context, "4.8", "Ranking"),
    ],
  )
);

Widget buildDivider() => Container(
  height: 24,
  child: VerticalDivider(),
);

  Widget buildButton(BuildContext context, String value, String text) =>
    MaterialButton(
      onPressed: () {},
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          SizedBox(height: 2),
          Text(text, style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
  