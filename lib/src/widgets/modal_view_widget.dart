import 'package:controlanimalapp/src/model/calculos_model.dart';
import 'package:controlanimalapp/src/widgets/title_card_widget.dart';
import 'package:flutter/material.dart';

class ModalFit extends StatelessWidget {
  final CalculoModel calculo;
  final Function(int i, CalculoModel calculo) onDelete;
  final int index;
  const ModalFit({
    Key key,
    @required this.calculo,
    this.onDelete,
    this.index,
  }) : super(key: key);

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
          onTap: () {
            Navigator.of(context).pop();
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) => ModalSingleCalculo(
                calculo: calculo,
              ),
            );
          },
        ),
        ListTile(
          title: Text('Borrar'),
          leading: Icon(
            Icons.delete,
            color: colorPrimary,
          ),
          onTap: () {
            Navigator.of(context).pop();
            this.onDelete(index, calculo);
          },
        )
      ],
    );
  }
}

class ModalSingleCalculo extends StatelessWidget {
  final CalculoModel calculo;
  const ModalSingleCalculo({
    Key key,
    @required this.calculo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.tryParse(calculo.createdAt);
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(color: Colors.grey[50]),
      child: Column(
        children: [
          ListTile(
            title: Text('Creado a las:'),
            subtitle: Text(
              '${time.day}/${time.month}/${time.year} a las ${time.hour}:${time.minute}',
            ),
          ),
          Divider(),
          Text(
            'Valores del calculo',
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  TitleCard(
                    property: 'Peso kg',
                    value: calculo.pesoKg,
                    textColor: Colors.grey,
                  ),
                  if (calculo.tipo == 'LECHERIA')
                    TitleCard(
                      property: 'Kg leche dia',
                      value: calculo.kgLecheDia,
                      textColor: Colors.grey,
                    ),
                  if (calculo.tipo == 'LECHERIA')
                    TitleCard(
                      property: 'Material grasa',
                      value: calculo.materialGrasa,
                      textColor: Colors.grey,
                    ),
                  if (calculo.tipo == 'ENGORDE')
                    TitleCard(
                      property: 'GMD',
                      value: calculo.gmd,
                      textColor: Colors.grey,
                    ),
                ],
              ),
            ),
          ),
          Text(
            'Racional animal',
            style: TextStyle(color: Colors.grey),
          ),
          Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.17,
            child: ListView.builder(
                itemCount: calculo.racionAnimals.length,
                shrinkWrap: true,
                itemBuilder: (context, int i) {
                  RacionAnimal racionAnimal = calculo.racionAnimals[i];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: const EdgeInsets.all(12),
                      elevation: 2,
                      child: Column(
                        children: [
                          TitleCard(
                            property: 'Insumo',
                            value: racionAnimal.insume,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'Tipo de insumo',
                            value: racionAnimal.tipoInsume,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'Kg dia',
                            value: racionAnimal.kgDia,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'Precio Kg',
                            value: racionAnimal.precioKg,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'Precio total',
                            value: racionAnimal.precioTotal,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'Inclusion',
                            value: racionAnimal.inclusion,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'Kg tn',
                            value: racionAnimal.kgTn,
                            textColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Text(
            'Requerimiento animal',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
                itemCount: calculo.requerimientoAnimals.length,
                shrinkWrap: true,
                itemBuilder: (context, int i) {
                  RequerimientoAnimal requerimientoAnimal =
                      calculo.requerimientoAnimals[i];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: const EdgeInsets.all(12),
                      elevation: 2,
                      child: Column(
                        children: [
                          Text(
                            'Mantenimiento',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TitleCard(
                            property: 'ms',
                            value:
                                (requerimientoAnimal.mantenimientoMs as double)
                                    .toStringAsFixed(2),
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'ndt',
                            value:
                                (requerimientoAnimal.mantenimientoNdt as double)
                                    .toStringAsFixed(2),
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'em',
                            value:
                                (requerimientoAnimal.mantenimientoEm as double)
                                    .toStringAsFixed(2),
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'pb',
                            value:
                                (requerimientoAnimal.mantenimientoPb as double)
                                    .toStringAsFixed(2),
                            textColor: Colors.grey,
                          ),
                          Text(
                            'Produccion',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TitleCard(
                            property: 'ms',
                            value: requerimientoAnimal.produccionMs,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'ndt',
                            value: requerimientoAnimal.produccionNdt,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'em',
                            value: requerimientoAnimal.produccionEm,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'pb',
                            value: requerimientoAnimal.produccionPb,
                            textColor: Colors.grey,
                          ),
                          Text(
                            'Rq total',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TitleCard(
                            property: 'ms',
                            value: requerimientoAnimal.rqTotalMs,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'ndt',
                            value: requerimientoAnimal.rqTotalNdt,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'em',
                            value: requerimientoAnimal.rqTotalEm,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'pb',
                            value: requerimientoAnimal.rqTotalPb,
                            textColor: Colors.grey,
                          ),
                          Text(
                            'Exceso',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TitleCard(
                            property: 'ms',
                            value: requerimientoAnimal.excesoMs,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'ndt',
                            value: requerimientoAnimal.excesoNdt,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'em',
                            value: requerimientoAnimal.excesoEm,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'pb',
                            value: requerimientoAnimal.excesoPb,
                            textColor: Colors.grey,
                          ),
                          Text(
                            'Total Tmr',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TitleCard(
                            property: 'ms',
                            value: requerimientoAnimal.totalTmrMs,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'ndt',
                            value: requerimientoAnimal.totalTmrNdt,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'em',
                            value: requerimientoAnimal.totalTmrEm,
                            textColor: Colors.grey,
                          ),
                          TitleCard(
                            property: 'pb',
                            value: requerimientoAnimal.totalTmrPb,
                            textColor: Colors.grey,
                          ),
                          Text(
                            'Balance concentrado',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TitleCard(
                            property: 'total',
                            value: requerimientoAnimal.balanceConcentrado,
                            textColor: Colors.grey,
                          ),
                          Text(
                            'Balance voluminoso',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TitleCard(
                            property: 'total',
                            value: requerimientoAnimal.balanceVoluminoso,
                            textColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
