import 'package:control_animal_app/src/controller/dato_animal_controller.dart';
import 'package:control_animal_app/src/controller/global_controller.dart';
import 'package:control_animal_app/src/mixin/racion_animal_dia_mixin.dart';
import 'package:control_animal_app/src/widgets/title_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RacionAnimalWidget extends StatelessWidget with RacionAnimalDia {
  final List<InsumoModel> insumos;
  const RacionAnimalWidget({Key key, @required this.insumos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datoAnimalCtrl = Get.find<DatoAnimalController>();
    datoAnimalCtrl.racionAnimal.clear();
    final size = MediaQuery.of(context).size;
    final double subTotalConcentrado = this.getSubTotal('CONCENTRADO', insumos);
    final double subTotalForraje = this.getSubTotal('FORRAJE', insumos);
    return Column(
      children: [
        ListTile(
          title: Text('Racion Animal'),
          subtitle: Text('resultados'),
        ),
        SizedBox(
          height: size.height * 0.30,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: insumos.length,
            itemBuilder: (context, index) {
              final InsumoModel insumoModel = insumos[index];
              final inclusion = insumoModel.tipo == 'FORRAJE'
                  ? insumoModel.getInclusion(subTotalForraje)
                  : insumoModel.getInclusion(subTotalConcentrado);
              final kgTn = insumoModel.tipo == 'FORRAJE'
                  ? insumoModel.getKgTn(subTotalForraje)
                  : insumoModel.getKgTn(subTotalConcentrado);
              print(inclusion);
              datoAnimalCtrl.racionAnimal.add({
                'insume': insumoModel.ingrediente,
                'tipo_insume': insumoModel.tipo,
                'kg_dia': insumoModel.kgDia,
                'precio_kg': insumoModel.precioKg,
                'precio_total': insumoModel.precioTotal(),
                'inclusion': inclusion,
                'kg_tn': kgTn,
              });

              return Container(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  // height: 300.0,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      TitleCard(
                        property: 'Insumo',
                        value: insumoModel.ingrediente,
                      ),
                      TitleCard(
                          property: 'Tipo',
                          value: insumoModel.tipo.toLowerCase()),
                      TitleCard(
                          property: 'Kg/dia', value: '${insumoModel.kgDia}'),
                      TitleCard(
                          property: 'Precio/Kg',
                          value: '${insumoModel.precioKg}'),
                      TitleCard(
                          property: 'Precio total',
                          value:
                              insumoModel.getPrecioTotal().toStringAsFixed(2)),
                      if (insumoModel.tipo == 'FORRAJE')
                        TitleCard(
                          property: '% Inclusion',
                          value: insumoModel
                              .getInclusion(subTotalForraje)
                              .toStringAsFixed(2),
                        ),
                      if (insumoModel.tipo == 'FORRAJE')
                        TitleCard(
                          property: 'Kg/Tn',
                          value: insumoModel
                              .getKgTn(subTotalForraje)
                              .toStringAsFixed(2),
                        ),
                      if (insumoModel.tipo == 'CONCENTRADO')
                        TitleCard(
                          property: '% Inclusion',
                          value: insumoModel
                              .getInclusion(subTotalConcentrado)
                              .toStringAsFixed(2),
                        ),
                      if (insumoModel.tipo == 'CONCENTRADO')
                        TitleCard(
                          property: 'Kg/Tn',
                          value: insumoModel
                              .getKgTn(subTotalConcentrado)
                              .toStringAsFixed(2),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        TitleCard(
          property: 'SubTotal Concentrado',
          value: subTotalConcentrado.toStringAsFixed(2),
          textColor: Colors.black,
        ),
        TitleCard(
          property: 'SubTotal Forraje',
          value: subTotalForraje.toStringAsFixed(2),
          textColor: Colors.black,
        ),
        TitleCard(
          property: 'Total KG/DIA TMR',
          value: this.getTotalKgDia(insumos).toStringAsFixed(2),
          textColor: Colors.black,
        ),
        TitleCard(
          property: 'Precio total',
          value: this.getPrecioTotal(insumos).toStringAsFixed(2),
          textColor: Colors.black,
        ),
        TitleCard(
          property: 'Precio Tn',
          value: this.getPrecioTotalTn(insumos).toStringAsFixed(2),
          textColor: Colors.black,
        ),
      ],
    );
  }
}
