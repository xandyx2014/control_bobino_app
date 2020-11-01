// import 'package:control_animal_app/src/pages/lecheria/lecheria_controller.dart';
import 'package:controlanimalapp/src/controller/calculo_controller.dart';
import 'package:controlanimalapp/src/model/calculos_model.dart';
import 'package:controlanimalapp/src/widgets/content_page_widget.dart';
import 'package:controlanimalapp/src/widgets/dialog_confirm_widget.dart';
import 'package:controlanimalapp/src/widgets/modal_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return GetBuilder<CalculoController>(
        init: CalculoController(),
        builder: (_) {
          _.getAll('ENGORDE');
          return Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(45))),
            child: Obx(() => ListView.builder(
                  itemCount: _.calculo.length,
                  shrinkWrap: false,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final CalculoModel calculo = _.calculo[index];
                    final DateTime time = DateTime.parse(calculo.createdAt);

                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: primaryColor,
                            child: Icon(Icons.book),
                            foregroundColor: Colors.white,
                          ),
                          title: Text(
                              '${time.day}/${time.month}/${time.year} a las ${time.hour}:${time.minute}'),
                          subtitle: Text('# ${calculo.id}'),
                          trailing: IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => ModalFit(
                                    calculo: calculo,
                                    index: index,
                                    onDelete: (int i, CalculoModel calculo) {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            DialogConfirmDelete(
                                          accept: () {
                                            _.removeItem(index, calculo);
                                          },
                                        ),
                                      );
                                      //_.removeItem(index, calculo);
                                    },
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
                )),
          );
        });
  }
}
