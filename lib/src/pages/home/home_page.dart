import 'package:control_animal_app/src/pages/home/widget/card_widget.dart';
import 'package:control_animal_app/src/utils/cart_icons_icons.dart';
import 'package:control_animal_app/src/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'widget/home_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgetList = [
    HomeList(),
    CartPage(),
    HomeList(),
    HomeList(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            }),
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: ThemeData().primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Hogar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ThemeData().primaryColor,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.home,
            ),
            title: Text(
              '   Store  ',
              style: TextStyle(),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.cart,
            ),
            title: Text(
              'My Cart',
              style: TextStyle(),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.favourites,
            ),
            title: Text(
              'Favourites',
              style: TextStyle(),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.account,
            ),
            title: Text(
              'My Account',
              style: TextStyle(),
            ),
          )
        ],
      ),
      body: _widgetList[_index],
    );
  }
}

// ignore: unused_element
Widget _buildBottomBar(BuildContext con) {
  return BottomNavigationBar(
    // selectedItemColor:  ThemeData().primaryColor,
    // unselectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    currentIndex: 2,
    onTap: (index) {},
    items: [
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.home,
            color: Colors.black,
          ),
          title: Text('   Store  ', style: TextStyle())),
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.cart,
          ),
          title: Text('My Cart', style: TextStyle())),
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.favourites,
          ),
          title: Text('Favourites', style: TextStyle())),
      BottomNavigationBarItem(
          icon: Icon(
            CartIcons.account,
          ),
          title: Text(
            'My Account',
            style: TextStyle(),
          ))
    ],
  );
}
