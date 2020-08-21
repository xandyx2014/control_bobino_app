import 'package:control_animal_app/route.dart';
import 'package:control_animal_app/src/model/product_model.dart';
import 'package:control_animal_app/src/utils/cart_icons_icons.dart';
import 'package:control_animal_app/src/widgets/list_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/cart_icons_icons.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: const Color(0xffF4F7FA),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            _TitleHome(
              title: 'Calculos',
              subTitle: 'Ver todos',
              ontap: () {},
            ),
            _HomeButtonsMenu(),
            _TitleHome(
              title: 'Opciones',
              subTitle: 'Todos',
              ontap: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            ListPageWidget()

            // _buildDealList(),
            // _buildDealList()
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildDealList() {
    var items = addItems();
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          var data = items[index];
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  width: 130,
                  height: 140,
                  alignment: Alignment.center,
                  child: Icon(
                    data.image,
                    size: 40,
                    color: Colors.black38,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 15,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 130,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data.name,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4, left: 4),
                  width: 130,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Rs.320',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]);
        },
      ),
    );
  }

  List<Product> addItems() {
    var list = List<Product>();

    var data1 = Product('House Hold', CartIcons.house_hold);
    list.add(data1);
    var data2 = Product('Grocery', CartIcons.grocery);
    list.add(data2);
    var data3 = Product('Liquor', CartIcons.liquor);
    list.add(data3);
    var data4 = Product('Breads', CartIcons.bread);
    list.add(data4);

    return list;
  }
}

class _TitleHome extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback ontap;
  const _TitleHome(
      {Key key,
      @required this.title,
      @required this.subTitle,
      @required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16, top: 4),
          child: Text(
            this.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, top: 4),
          child: FlatButton(
            onPressed: this.ontap,
            child: Text(
              this.subTitle,
              style: TextStyle(color: ThemeData().primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeButtonsMenu extends StatelessWidget {
  const _HomeButtonsMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ButtonMenu(
            icon: Icons.dashboard,
            text: 'Lecheria',
            ontap: () {
              goPageLecheria();
            },
          ),
          _ButtonMenu(
            icon: Icons.data_usage,
            text: 'Engorde',
            ontap: () {},
          ),
        ],
      ),
    );
  }

  void goPageLecheria() {
    Get.toNamed(AppRoutes.lecheria);
  }
}

class _ButtonMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() ontap;

  const _ButtonMenu({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: this.ontap,
          child: Container(
            margin: EdgeInsets.all(10),
            width: 95,
            height: 95,
            alignment: Alignment.center,
            child: Icon(
              this.icon,
              size: 40,
              color: Colors.black38,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 5),
                  blurRadius: 15,
                )
              ],
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Text(this.text),
            Icon(
              Icons.keyboard_arrow_right,
              size: 14,
            )
          ],
        )
      ],
    );
  }
}