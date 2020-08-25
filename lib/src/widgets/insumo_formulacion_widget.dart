import 'package:flutter/material.dart';

class InsumoFormulacionWidget extends StatelessWidget {
  const InsumoFormulacionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleText = TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
    return Column(
      children: [
        Container(
          color: ThemeData().primaryColor,
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
        FittedBox(
          child: DataTable(
            dataRowHeight: 80.0,
            headingRowHeight: 80.0,
            columns: [
              DataColumn(
                  label: Text(
                'Insumo',
                style: styleText,
              )),
              DataColumn(
                  label: Text(
                '% Ms',
                style: styleText,
              )),
              DataColumn(
                  label: Text(
                '% NDT',
                style: styleText,
              )),
              DataColumn(
                  label: Text(
                'EM (Mcal/Kg)',
                style: styleText,
              )),
              DataColumn(
                  label: Text(
                '% PB',
                style: styleText,
              )),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text(
                    'sulfato de Zn',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '98.0',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '78.00',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '56.00',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '42.00',
                    style: styleText,
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'Avena',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '98.0',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '78.00',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '56.00',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '42.00',
                    style: styleText,
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'Comida 2',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '98.0',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '78.00',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '56.00',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '42.00',
                    style: styleText,
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'Comida 3',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '98.0',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '78.00',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '56.00',
                    style: styleText,
                  )),
                  DataCell(Text(
                    '42.00',
                    style: styleText,
                  )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
