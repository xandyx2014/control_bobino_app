import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final String property;
  final String value;
  final Color textColor;

  const TitleCard(
      {Key key,
      @required this.property,
      @required this.value,
      this.textColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            '$property :',
            style: TextStyle(color: textColor),
          ),
          Spacer(),
          FittedBox(
            child: Text(
              '$value',
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
