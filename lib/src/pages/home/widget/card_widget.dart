import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          ListView.separated(
            shrinkWrap: true,
            itemCount: 1,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return _listItem();
            },
          ),
        ],
      ),
    );
  }

  Widget _listItem() {
    return InkWell(
      child: Container(
        height: 120,
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              margin: EdgeInsets.all(10),
              height: 100,
              child: Text('lorem ipsum dolor'),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: new Offset(0.0, 2.0),
                  blurRadius: 25.0,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
