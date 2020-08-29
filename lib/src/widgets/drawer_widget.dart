import 'package:flutter/material.dart';

import 'list_page_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Column(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  child: ClipOval(child: Image.asset('assets/logo.jpeg')),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Calculadora App',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListPageWidget()
        ],
      ),
    );
  }
}
