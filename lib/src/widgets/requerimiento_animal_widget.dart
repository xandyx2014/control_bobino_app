import 'package:control_animal_app/src/widgets/title_card_widget.dart';
import 'package:flutter/material.dart';

class RequerimientoAnimal extends StatelessWidget {
  const RequerimientoAnimal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        TitleCard(property: 'Ms(kg)', value: '0asd'),
                        TitleCard(property: 'Ndt(Kg)', value: '0asd'),
                        TitleCard(property: 'Em(Mcal)', value: '0asd'),
                        TitleCard(property: 'Pb(Kg)', value: '0asd'),
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
                        TitleCard(property: 'Ms(kg)', value: '0asd'),
                        TitleCard(property: 'Ndt(Kg)', value: '0asd'),
                        TitleCard(property: 'Em(Mcal)', value: '0asd'),
                        TitleCard(property: 'Pb(Kg)', value: '0asd'),
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
                        TitleCard(property: 'Ms(kg)', value: '0asd'),
                        TitleCard(property: 'Ndt(Kg)', value: '0asd'),
                        TitleCard(property: 'Em(Mcal)', value: '0asd'),
                        TitleCard(property: 'Pb(Kg)', value: '0asd'),
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
                        TitleCard(property: 'Ms(kg)', value: '0asd'),
                        TitleCard(property: 'Ndt(Kg)', value: '0asd'),
                        TitleCard(property: 'Em(Mcal)', value: '0asd'),
                        TitleCard(property: 'Pb(Kg)', value: '0asd'),
                      ],
                    ),
                  ),
                ],
              ),
            )
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
