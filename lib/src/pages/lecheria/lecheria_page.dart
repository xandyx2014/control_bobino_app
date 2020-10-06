// import 'package:control_animal_app/src/pages/lecheria/lecheria_controller.dart';
import 'package:control_animal_app/src/widgets/content_page_widget.dart';
import 'package:control_animal_app/src/widgets/modal_view_widget.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class LecheriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContenidoPagina(
        titulo: 'Produccion de leche',
        urlImage: 'assets/leche.jpeg',
        child: ListLecheria(),
      ),
    );
  }
}

class ListLecheria extends StatelessWidget {
  const ListLecheria({
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
                        builder: (context) => ModalFit(
                          calculo: null,
                        ),
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
