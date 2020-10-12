import 'package:flutter/material.dart';

class DialogConfirmDelete extends StatelessWidget {
  final Function accept;

  const DialogConfirmDelete({Key key, this.accept}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('¿Deseas eliminar este elemento?'),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Rechazar',
              style: TextStyle(color: Colors.grey),
            )),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              this.accept();
            },
            child: Text('Aceptar')),
      ],
    );
  }
}
