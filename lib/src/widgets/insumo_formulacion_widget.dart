import 'package:control_animal_app/src/controller/global_controller.dart';
import 'package:control_animal_app/src/controller/insumo_formulacion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsumoFormulacionWidget extends StatelessWidget {
  final Function(InsumoModel insumo) onTap;
  const InsumoFormulacionWidget({Key key, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          child: ListTile(
            title: Text(
              'Insumos de formulacion',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Completa los datos',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ListInsumo(
          onTap: this.onTap,
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

class ListInsumo extends StatelessWidget {
  final Function(InsumoModel insumo) onTap;
  const ListInsumo({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalController = Get.find<GlobalController>();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(7.0),
          child: Row(
            children: [
              Text(
                'Insumo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'Ms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'Mdt',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'Mcal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'Pb',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'Accion',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        GetBuilder<InsumoFormulacionController>(
          init: InsumoFormulacionController(),
          builder: (_) => Container(
            height: Get.height * 0.30,
            child: Obx(() => ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: _.insumos.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final InsumoModel insumoModel = _.insumos.elementAt(index);
                    return InsumoItem(
                      insumo: insumoModel,
                      index: index,
                      onDelete: (value) {
                        _.deleteByIndex(value);
                      },
                    );
                  },
                )),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        FlatButton.icon(
          onPressed: () {
            showModalBottomSheet(
                context: Get.context,
                builder: (context) {
                  return Container(
                    height: Get.height * 0.45,
                    child: ListView.builder(
                        itemCount: globalController.insumo.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final InsumoModel insumo =
                              globalController.insumo[index];
                          return ListTile(
                            onTap: () {
                              insumo.uuid = UniqueKey().toString();
                              this.onTap(insumo);
                              Navigator.of(Get.context).pop();
                            },
                            title: Text('${insumo.ingrediente}'),
                            subtitle: Text('Tipo : ${insumo.tipo}'),
                            trailing: Icon(Icons.add_box),
                          );
                        }),
                  );
                });
          },
          icon: Icon(
            Icons.add,
            color: Colors.blue,
          ),
          label: Text('Adicionar insumo', style: TextStyle(color: Colors.blue)),
        )
      ],
    );
  }
}

class InsumoItem extends StatelessWidget {
  final int index;
  final InsumoModel insumo;
  final Function(int index) onDelete;

  const InsumoItem({Key key, this.insumo, this.onDelete, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.0),
      child: Row(
        children: [
          SizedBox(
            width: Get.width * 0.13,
            child: Text(
              '${insumo.ingrediente}',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Text('${insumo.ms}'),
          Spacer(),
          Text('${insumo.ndt}'),
          Spacer(),
          Text('${insumo.mcal}'),
          Spacer(),
          Text('${insumo.pb}'),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                this.onDelete(index);
              })
        ],
      ),
    );
  }
}
