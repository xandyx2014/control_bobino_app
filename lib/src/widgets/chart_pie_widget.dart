import 'package:controlanimalapp/src/controller/global_controller.dart';
import 'package:controlanimalapp/src/mixin/requerimiento_animal_mixin.dart';
import 'package:flutter/material.dart';
import 'indicator_widget.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartInsumoFormulacion extends StatelessWidget
    with CalculoRequerimientoAnimal {
  final List<InsumoModel> insumos;
  const ChartInsumoFormulacion({Key key, @required this.insumos})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map<String, double> porcentajes = this.getBalance(insumos);
    final double forrajePorcentaje =
        double.parse(porcentajes['forraje'].toStringAsFixed(2));
    final double concentradoPorcentaje =
        double.parse(porcentajes['concentrado'].toStringAsFixed(2));
    return AspectRatio(
        aspectRatio: 1.0,
        child: Column(
          children: [
            ListTile(
              title: Text('Requerimiento del animal'),
              subtitle: Text('Balance'),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                          pieTouchData: PieTouchData(
                              touchCallback: (pieTouchResponse) {}),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections(
                              forrajePorcentaje, concentradoPorcentaje)),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Indicator(
                      color: Color(0xff0293ee),
                      text: 'Concentrado',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Indicator(
                      color: Color(0xfff8b250),
                      text: 'Voluminoso',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 28,
                ),
              ],
            )
          ],
        ));
  }

  List<PieChartSectionData> showingSections(firts, seconds) {
    final double fontSize = 16;
    final double radius = 50;
    return [
      PieChartSectionData(
        color: const Color(0xff0293ee),
        value: seconds,
        title: '$seconds %',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      ),
      PieChartSectionData(
        color: const Color(0xfff8b250),
        value: firts,
        title: '$firts%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      )
    ];
  }
}
