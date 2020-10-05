import 'package:control_animal_app/src/model/requerimiento_animal_model.dart';
import 'package:control_animal_app/src/widgets/title_card_widget.dart';
import 'package:flutter/material.dart';

class RequerimientoAnimal extends StatelessWidget {
  final RequerimientoAnimalModel mantenimiento,
      produccion,
      qrTotal,
      exceso,
      totalAporte;
  final double balanceConcentrado;
  final double balanceForraje;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const RequerimientoAnimal(
      {Key key,
      @required this.mantenimiento,
      @required this.produccion,
      @required this.qrTotal,
      @required this.exceso,
      @required this.totalAporte,
      @required this.balanceConcentrado,
      @required this.balanceForraje,
      this.onCancel,
      this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final concentrado = balanceConcentrado * 100;
    final forraje = balanceForraje * 100;
    return Container(
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    padding: EdgeInsets.all(10),
                    color: Theme.of(context).primaryColor,
                    width: double.infinity,
                    child: Column(
                      children: [
                        _ListTitleRequerimiento(
                          tipoRequerimiento: 'Mantenimiento',
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        TitleCard(
                          property: 'Ms(kg)',
                          value: mantenimiento.ms.toStringAsFixed(2),
                        ),
                        TitleCard(
                          property: 'Ndt(Kg)',
                          value: mantenimiento.ndt.toStringAsFixed(2),
                        ),
                        TitleCard(
                          property: 'Em(Mcal)',
                          value: mantenimiento.em.toStringAsFixed(2),
                        ),
                        TitleCard(
                          property: 'Pb(Kg)',
                          value: mantenimiento.pb.toStringAsFixed(2),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    color: Theme.of(context).primaryColor,
                    width: double.infinity,
                    child: Column(
                      children: [
                        _ListTitleRequerimiento(
                          tipoRequerimiento: 'Produccion',
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        TitleCard(
                          property: 'Ms(kg)',
                          value: produccion.ms.toStringAsFixed(2),
                        ),
                        TitleCard(
                          property: 'Ndt(Kg)',
                          value: produccion.ndt.toStringAsFixed(2),
                        ),
                        TitleCard(
                          property: 'Em(Mcal)',
                          value: produccion.em.toStringAsFixed(2),
                        ),
                        TitleCard(
                          property: 'Pb(Kg)',
                          value: produccion.pb.toStringAsFixed(2),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    color: Theme.of(context).primaryColor,
                    width: double.infinity,
                    child: Column(
                      children: [
                        _ListTitleRequerimiento(
                          tipoRequerimiento: 'Rq total',
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        TitleCard(
                          property: 'Ms(kg)',
                          value: qrTotal.ms.toStringAsFixed(2),
                        ),
                        TitleCard(
                          property: 'Ndt(Kg)',
                          value: qrTotal.ndt.toStringAsFixed(2),
                        ),
                        TitleCard(
                          property: 'Em(Mcal)',
                          value: qrTotal.em.toStringAsFixed(2),
                        ),
                        TitleCard(
                          property: 'Pb(Kg)',
                          value: qrTotal.pb.toStringAsFixed(2),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    color: Theme.of(context).primaryColor,
                    width: double.infinity,
                    child: Column(
                      children: [
                        _ListTitleRequerimiento(
                          tipoRequerimiento: '% Exceso',
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        TitleCard(
                          property: 'Ms(kg)',
                          value: '${exceso.ms.toStringAsFixed(2)} %',
                        ),
                        TitleCard(
                          property: 'Ndt(Kg)',
                          value: '${exceso.ndt.toStringAsFixed(2)} %',
                        ),
                        TitleCard(
                          property: 'Em(Mcal)',
                          value: '${exceso.em.toStringAsFixed(2)} %',
                        ),
                        TitleCard(
                          property: 'Pb(Kg)',
                          value: '${exceso.pb.toStringAsFixed(2)} %',
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    color: Theme.of(context).primaryColor,
                    width: double.infinity,
                    child: Column(
                      children: [
                        _ListTitleRequerimiento(
                          tipoRequerimiento: 'Total TMR',
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        TitleCard(
                          property: 'Ms(kg)',
                          value: '${totalAporte.ms.toStringAsFixed(2)}',
                        ),
                        TitleCard(
                          property: 'Ndt(Kg)',
                          value: '${totalAporte.ndt.toStringAsFixed(2)}',
                        ),
                        TitleCard(
                          property: 'Em(Mcal)',
                          value: '${totalAporte.em.toStringAsFixed(2)}',
                        ),
                        TitleCard(
                          property: 'Pb(Kg)',
                          value: '${totalAporte.pb.toStringAsFixed(2)}',
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TitleCard(
              property: 'Concentrado',
              value: '${concentrado.toStringAsFixed(2)} %',
              textColor: Colors.black,
            ),
            TitleCard(
              property: 'Forraje',
              value: '${forraje.toStringAsFixed(2)} %',
              textColor: Colors.black,
            ),
            FlatButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('¿Desea guardar el calculo?'),
                      actions: [
                        FlatButton(
                            onPressed: this.onCancel,
                            child: Text(
                              'Cancelar',
                              style: TextStyle(color: Colors.grey),
                            )),
                        FlatButton(
                            onPressed: this.onSave, child: Text('Aceptar')),
                      ],
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save,
                      size: 25,
                      color: Colors.blue,
                    ),
                    Text(
                      'Guardar archivo',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class _ListTitleRequerimiento extends StatelessWidget {
  final String tipoRequerimiento;
  const _ListTitleRequerimiento({Key key, @required this.tipoRequerimiento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleText = TextStyle(color: Colors.white);
    return Container(
      child: ListTile(
        title: Text(
          this.tipoRequerimiento,
          style: styleText,
        ),
        subtitle: Text(
          'Datos',
          style: styleText,
        ),
      ),
    );
  }
}
