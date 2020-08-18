import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    offset: new Offset(0.0, 2.0),
                    blurRadius: 25.0,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: Text(
                            'Registrarse',
                            style: TextStyle(
                              fontSize: 20,
                              color: ThemeData().primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _TitleForm(),
                  _FormData(),
                ],
              ),
            ),
          ],
        ));
  }
}

class _TitleForm extends StatelessWidget {
  const _TitleForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, top: 8),
          child: Text(
            'Bienvenido a la app.',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16, top: 8),
          child: Text(
            'Ingresa tus datos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}

class _FormData extends StatelessWidget {
  const _FormData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              hintText: 'Usuario',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: TextField(
            obscureText: true,
            style: TextStyle(fontSize: 18),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: ThemeData().primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('home', (route) => false);
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
