import 'package:control_animal_app/src/controller/dato_animal_controller.dart';
import 'package:control_animal_app/src/controller/global_controller.dart';
import 'package:control_animal_app/src/controller/insumo_formulacion_controller.dart';
import 'package:control_animal_app/src/mixin/requerimiento_animal_mixin.dart';
import 'package:control_animal_app/src/model/requerimiento_animal_model.dart';
import 'package:control_animal_app/src/widgets/card_custom_cacule_widget.dart';
import 'package:control_animal_app/src/widgets/chart_pie_widget.dart';
import 'package:control_animal_app/src/widgets/insumo_formulacion_data_widget.dart';
import 'package:control_animal_app/src/widgets/insumo_formulacion_widget.dart';
import 'package:control_animal_app/src/widgets/racion_animal_dia_widget.dart';
import 'package:control_animal_app/src/widgets/requerimiento_animal_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' show pow;

class CalculoEngordePage extends StatelessWidget {
  final pageController = new PageController(
    initialPage: 0,
    viewportFraction: 0.95,
  );
  Widget _buttonNext() {
    return SizedBox(
      width: 220,
      child: MaterialButton(
        height: Get.width * 0.15,
        textColor: Colors.white,
        elevation: 6.0,
        color: Theme.of(Get.context).primaryColor,
        onPressed: () {
          pageController.nextPage(
              duration: Duration(milliseconds: 800), curve: Curves.ease);
        },
        child: Text(
          'Siguiente',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final datoAnimalCtrl = Get.find<DatoAnimalController>();
    return GetBuilder<InsumoFormulacionController>(
        init: InsumoFormulacionController(),
        builder: (_) => Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: AppBar(
                title: Text('Calculos engorde'),
                centerTitle: true,
              ),
              body: Center(
                child: SizedBox(
                  height: Get.height * 0.82,
                  width: Get.width,
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    reverse: false,
                    children: [
                      PageCalcule(
                        child: Center(
                          child: Column(children: [
                            _DatosAnimalEngorde(),
                            _buttonNext(),
                          ]),
                        ),
                      ),
                      PageCalcule(
                        child: Column(children: [
                          InsumoFormulacionWidget(
                            onTap: (value) {
                              _.insumos.add(value);
                            },
                          ),
                          _buttonNext(),
                        ]),
                      ),
                      PageCalcule(
                        child: Column(
                          children: [
                            InsumoFormulacionData(),
                            SizedBox(
                              height: 20,
                            ),
                            _buttonNext(),
                          ],
                        ),
                      ),
                      PageCalcule(
                        child: Column(
                          children: [
                            RacionAnimalWidget(
                              insumos: _.insumos,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _buttonNext(),
                          ],
                        ),
                      ),
                      PageCalcule(
                        child: Column(
                          children: [
                            ChartInsumoFormulacion(
                              insumos: _.insumos,
                            ),
                            _buttonNext(),
                          ],
                        ),
                      ),
                      PageCalcule(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('Requerimiento del animal'),
                              subtitle: Text('informe de datos'),
                            ),
                            Obx(() => RequerimientoAnimalLeche(
                                  pesoKg: datoAnimalCtrl.peso.value,
                                  gmd: datoAnimalCtrl.gmd.value,
                                  insumos: _.insumos,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class RequerimientoAnimalLeche extends StatelessWidget
    with CalculoRequerimientoAnimal {
  final double pesoKg;
  final double gmd;
  final List<InsumoModel> insumos;

  const RequerimientoAnimalLeche(
      {Key key, this.pesoKg = 0.00, this.gmd = 0.00, this.insumos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resultadosInsumo = this.getResultados(insumos);
    final balanceTotal = this.getBalance(insumos);
    final insumosMsTotal = resultadosInsumo['ms'];
    final insumosNdtTotal = resultadosInsumo['ndt'];
    final insumosEmTotal = resultadosInsumo['em'];
    final insumosPbTotal = resultadosInsumo['pb'];
    final globalController = Get.find<GlobalController>();
    final produccion = RequerimientoAnimalModel(
        ms: 0.00,
        ndt: 0.00,
        em: globalController.rqEnergiaGanacia
            .singleWhere((element) => element.gmd == gmd)
            .getValue(this.pesoKg.toString()),
        pb: globalController.rqProteinaMantenimiento.value
                .getValue(this.pesoKg.toString()) /
            1000);

    final mantenimiento = RequerimientoAnimalModel(
        ms: 1.7824 +
            (0.07765 * pow(pesoKg, 0.75)) +
            (4.0415 * gmd) -
            (0.8973 * pow(gmd, 2)),
        ndt: 0.0,
        em: globalController.rqEnergiaMantenimiento.value
            .getValue(this.pesoKg.toString()),
        pb: globalController.rqProteinaMantenimiento.value
                .getValue(this.pesoKg.toString()) /
            1000);

    final rqTotal = RequerimientoAnimalModel(
      ms: mantenimiento.ms,
      ndt: mantenimiento.ndt,
      em: mantenimiento.em + produccion.em,
      pb: mantenimiento.pb + produccion.pb,
    );
    mantenimiento.setNdt(
        ((((rqTotal.ms / rqTotal.em) + 0.3032) / 0.9455) * rqTotal.ms) / 4.4);
    final exceso = RequerimientoAnimalModel(
      ms: (rqTotal.ms - insumosMsTotal) / (insumosMsTotal),
      ndt: (rqTotal.ndt - insumosNdtTotal) / (insumosNdtTotal),
      em: (rqTotal.em - insumosEmTotal) / (insumosEmTotal),
      pb: (rqTotal.pb - insumosPbTotal) / (insumosPbTotal),
    );
    final totalAporte = RequerimientoAnimalModel(
        ms: insumosMsTotal,
        ndt: insumosNdtTotal,
        em: insumosEmTotal,
        pb: insumosPbTotal);
    print(mantenimiento.ndt);
    return RequerimientoAnimal(
      exceso: exceso,
      mantenimiento: mantenimiento,
      produccion: produccion,
      qrTotal: rqTotal,
      totalAporte: totalAporte,
      balanceForraje: balanceTotal['forraje'],
      balanceConcentrado: balanceTotal['concentrado'],
    );
  }
}

class _DatosAnimalEngorde extends StatelessWidget {
  const _DatosAnimalEngorde({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datoAnimalCtrl = Get.find<DatoAnimalController>();
    datoAnimalCtrl.loadingData();
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              title: Text(
                'Datos del animal',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Completa los datos',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Peso Kg',
                  style: TextStyle(color: Colors.black38),
                ),
                Obx(
                  () => Slider(
                    label: '${datoAnimalCtrl.peso.value}',
                    value: datoAnimalCtrl.peso.value,
                    min: 200.0,
                    max: 500.0,
                    divisions: 30,
                    onChanged: (value) {
                      datoAnimalCtrl.peso.value = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GMD',
                  style: TextStyle(color: Colors.black38),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Obx(
                  () => Slider(
                    label: '${datoAnimalCtrl.gmd.value}',
                    value: datoAnimalCtrl.gmd.value,
                    min: 0.5,
                    max: 2.5,
                    divisions: 25,
                    onChanged: (value) {
                      final valueGrasa = double.parse(value.toStringAsFixed(1));
                      datoAnimalCtrl.gmd.value = valueGrasa;
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
