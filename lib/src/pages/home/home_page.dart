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
      resizeToAvoidBottomPadding: true,
      drawer: DrawerWidget(),
      /* appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              
            }),
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
      ), */
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
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
      body: Column(
        children: [
          Stack(
            children: [
              FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: AssetImage('assets/menu.jpeg'),
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              /*  Image.asset(
                'assets/menu.jpeg',
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ), */
              Positioned(
                top: 0,
                left: 10.0,
                child: SafeArea(
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.black26),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bienvenido a la aplicacion.',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                        Text(
                          'loremp ipsum dolor',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          _widgetList[_index],
        ],
      ),
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
