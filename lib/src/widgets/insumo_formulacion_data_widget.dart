import 'package:control_animal_app/src/controller/global_controller.dart';
import 'package:control_animal_app/src/controller/insumo_formulacion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsumoFormulacionData extends StatelessWidget {
  const InsumoFormulacionData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              title: Text(
                'Racion / Animal / Dia',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Completa los datos',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Ingrediente',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Kg/Dia',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Precio/Kg',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: Get.height * 0.35,
                width: Get.width,
                child: GetBuilder<InsumoFormulacionController>(
                    init: InsumoFormulacionController(),
                    builder: (_) => Obx(() => ListView.builder(
                        itemCount: _.insumos.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final InsumoModel insumoModel = _.insumos[index];
                          return _DataInsumo(
                            title: '${insumoModel.ingrediente}',
                            onChangeKgDia: (value) {
                              insumoModel.kgDia = value;
                              _.setInsumo(insumoModel, index);
                            },
                            onChangePrecioKg: (value) {
                              insumoModel.precioKg = value;
                              _.setInsumo(insumoModel, index);
                            },
                          );
                        }))),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _DataInsumo extends StatelessWidget {
  final Function(double value) onChangeKgDia;
  final Function(double value) onChangePrecioKg;
  final String title;
  const _DataInsumo(
      {Key key,
      @required this.title,
      this.onChangeKgDia,
      this.onChangePrecioKg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleTextlenght = title.toString().length;
    final cutString = titleTextlenght >= 14
        ? '${title.substring(0, titleTextlenght ~/ 2)}..'
        : title;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(cutString),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 50.0,
            child: TextFormField(
              initialValue: '0.00',
              onChanged: (value) {
                this.onChangeKgDia(double.parse(value));
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              // decoration: InputDecoration(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 50.0,
            child: TextFormField(
              initialValue: '0.00',
              onChanged: (value) {
                this.onChangePrecioKg(double.parse(value));
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              // decoration: InputDecoration(),
            ),
          ),
        ),
      ],
    );
  }
}
