// import 'package:control_animal_app/src/pages/lecheria/lecheria_controller.dart';
import 'package:control_animal_app/src/widgets/content_page_widget.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class EngordePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContenidoPagina(
        titulo: 'Ganancia de peso',
        urlImage: 'assets/engorde.jpeg',
        child: ListEngorde(),
      ),
    );
  }
}

class ListEngorde extends StatelessWidget {
  const ListEngorde({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(45))),
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: false,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(Icons.book),
                  foregroundColor: Colors.white,
                ),
                title: Text('Titulo heading'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('subtitle'),
                    Text('subtitle 2'),
                  ],
                ),
                trailing: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => ModalFit(),
                      );
                    }),
              ),
              Divider(
                height: 10.0,
              )
            ],
          );
        },
      ),
    );
  }
}

class ModalFit extends StatelessWidget {
  const ModalFit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color colorPrimary = Colors.grey;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          title: Text('Ver'),
          leading: Icon(
            Icons.book,
            color: colorPrimary,
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          title: Text('Borrar'),
          leading: Icon(
            Icons.delete,
            color: colorPrimary,
          ),
          onTap: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
