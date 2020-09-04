import 'package:flutter/material.dart';

class PageCalcule extends StatelessWidget {
  final Widget child;

  const PageCalcule({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        elevation: 15,
        child: child,
      ),
    );
  }
}
