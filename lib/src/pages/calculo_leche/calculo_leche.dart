import 'package:control_animal_app/route.dart';
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

class CalculoLechePage extends StatelessWidget {
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
    datoAnimalCtrl.racionAnimal.clear();
    return GetBuilder<InsumoFormulacionController>(
        init: InsumoFormulacionController(),
        builder: (_) => Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: AppBar(
                title: Text('Calculos de Leche'),
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
                            DatosAnimalLecheria(),
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
                                  kgLecheDia: datoAnimalCtrl.kgLeche.value,
                                  materialGrasa:
                                      datoAnimalCtrl.materiaGrasa.value,
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
  final double kgLecheDia;
  final double materialGrasa;
  final List<InsumoModel> insumos;

  const RequerimientoAnimalLeche(
      {Key key,
      this.pesoKg = 0.00,
      this.kgLecheDia = 0.00,
      this.materialGrasa = 0.00,
      this.insumos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datoAnimalCtrl = Get.find<DatoAnimalController>();
    final resultadosInsumo = this.getResultados(insumos);
    final balanceTotal = this.getBalance(insumos);
    final insumosMsTotal = resultadosInsumo['ms'];
    final insumosNdtTotal = resultadosInsumo['ndt'];
    final insumosEmTotal = resultadosInsumo['em'];
    final insumosPbTotal = resultadosInsumo['pb'];
    final globalController = Get.find<GlobalController>();
    final double dataCalculeOne =
        (0.40 * kgLecheDia) + (15 * (materialGrasa / 100) * kgLecheDia);
    final double dataCalculeTwo =
        (0.372 * dataCalculeOne + 0.0968 * pow(pesoKg, 0.75));
    final mantenimiento = RequerimientoAnimalModel(
        ms: dataCalculeTwo,
        ndt: globalController.rqCarne
                .singleWhere((element) => element.peso == this.pesoKg)
                .rqNdt /
            1000,
        em: 3.94 + (0.025 * pesoKg),
        pb: (152 + (0.422 * pesoKg)) / 1000);
    final produccion = RequerimientoAnimalModel(
        ms: 0.00,
        ndt: (globalController.rqLeche
                    .singleWhere(
                        (element) => element.grasaLeche == this.materialGrasa)
                    .rqNdt /
                1000) *
            this.kgLecheDia,
        em: (0.57723 + (0.1645 * this.materialGrasa)) * this.kgLecheDia,
        pb: ((42.609 + (11.5428 * this.materialGrasa)) * this.kgLecheDia) /
            1000);
    final qrTotal = RequerimientoAnimalModel(
      ms: mantenimiento.ms + produccion.ms,
      ndt: mantenimiento.ndt + produccion.ndt,
      em: mantenimiento.em + produccion.em,
      pb: mantenimiento.pb + produccion.pb,
    );
    // CALCULAR TABLA DE CALCULO
    // xxxx
    final exceso = RequerimientoAnimalModel(
      ms: insumosMsTotal / (insumosMsTotal - qrTotal.ms),
      ndt: insumosNdtTotal / (insumosNdtTotal - qrTotal.ndt),
      em: insumosEmTotal / (insumosEmTotal - qrTotal.em),
      pb: insumosPbTotal / (insumosPbTotal - qrTotal.pb),
    );
    // xxx
    final totalTmr = RequerimientoAnimalModel(
      ms: insumosMsTotal,
      ndt: insumosEmTotal,
      em: insumosNdtTotal,
      pb: insumosPbTotal,
    );
    datoAnimalCtrl.requerimientoAnimal.value = {};
    datoAnimalCtrl.requerimientoAnimal.addAll({
      'mantenimiento_ms': mantenimiento.ms,
      'mantenimiento_ndt': mantenimiento.ndt,
      'mantenimiento_em': mantenimiento.em,
      'mantenimiento_pb': mantenimiento.pb,
      'produccion_ms': produccion.ms,
      'produccion_ndt': produccion.ndt,
      'produccion_em': produccion.em,
      'produccion_pb': produccion.pb,
      'rq_total_ms': qrTotal.ms,
      'rq_total_ndt': qrTotal.ndt,
      'rq_total_em': qrTotal.em,
      'rq_total_pb': qrTotal.pb,
      'exceso_ms': exceso.ms,
      'exceso_ndt': exceso.ndt,
      'exceso_em': exceso.em,
      'exceso_pb': exceso.pb,
      'total_tmr_ms': totalTmr.ms,
      'total_tmr_ndt': totalTmr.ndt,
      'total_tmr_em': totalTmr.em,
      'total_tmr_pb': totalTmr.pb,
      'balance_concentrado': balanceTotal['forraje'],
      'balance_voluminoso': balanceTotal['concentrado'],
    });
    return RequerimientoAnimal(
      exceso: exceso,
      mantenimiento: mantenimiento,
      produccion: produccion,
      qrTotal: qrTotal,
      totalAporte: totalTmr,
      balanceForraje: balanceTotal['forraje'],
      balanceConcentrado: balanceTotal['concentrado'],
      onSave: () {
        // Get.offNamed(AppRoutes.home);
        print('hi');
        datoAnimalCtrl.guardarDato();
      },
      onCancel: () {
        print('On cancel');
        Get.back();
      },
    );
  }
}

class DatosAnimalLecheria extends StatelessWidget {
  const DatosAnimalLecheria({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datoAnimalCtrl = Get.find<DatoAnimalController>();
    datoAnimalCtrl.loadingData();
    datoAnimalCtrl.tipo.value = 'LECHERIA';
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
                    max: 700.0,
                    divisions: 50,
                    onChanged: (value) {
                      datoAnimalCtrl.peso.value = value;
                      datoAnimalCtrl.calculo.add('peso_kg', value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: TextFormField(
                autofocus: true,
                initialValue: datoAnimalCtrl.kgLeche.value.toString(),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: false,
                ),
                style: TextStyle(fontSize: 18),
                onChanged: (value) {
                  datoAnimalCtrl.kgLeche.value = double.parse(value);
                  datoAnimalCtrl.calculo
                      .add('kg_leche_dia', double.parse(value));
                },
                decoration: InputDecoration(
                  // hintText: 'Usuario',
                  labelText: 'KG LECHE/DIA',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
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
                  ' % Materia grasa',
                  style: TextStyle(color: Colors.black38),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Obx(
                  () => Slider(
                    label: '${datoAnimalCtrl.materiaGrasa.value}',
                    value: datoAnimalCtrl.materiaGrasa.value,
                    min: 3.0,
                    max: 5.5,
                    divisions: 25,
                    onChanged: (value) {
                      final valueGrasa = double.parse(value.toStringAsFixed(1));
                      datoAnimalCtrl.materiaGrasa.value = valueGrasa;
                      datoAnimalCtrl.calculo.add('material_grasa', valueGrasa);
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
