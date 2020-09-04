import 'package:control_animal_app/src/controller/dato_animal_controller.dart';
import 'package:control_animal_app/src/controller/insumo_formulacion_controller.dart';
import 'package:control_animal_app/src/widgets/card_custom_cacule_widget.dart';
import 'package:control_animal_app/src/widgets/chart_pie_widget.dart';
import 'package:control_animal_app/src/widgets/insumo_formulacion_data_widget.dart';
import 'package:control_animal_app/src/widgets/insumo_formulacion_widget.dart';
import 'package:control_animal_app/src/widgets/racion_animal_dia_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
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
            // physics: NeverScrollableScrollPhysics(),
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
                  GetBuilder<InsumoFormulacionController>(
                    init: InsumoFormulacionController(),
                    builder: (_) => InsumoFormulacionWidget(
                      onTap: (value) {
                        _.insumos.add(value);
                        print(_.getSubTotal(TipoInsumo.concentrado, _.insumos));
                      },
                    ),
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
                    ChartInsumoFormulacion(),
                    _buttonNext(),
                  ],
                ),
              ),
              PageCalcule(
                child: Column(
                  children: [
                    RacionAnimalWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DatosAnimalLecheria extends StatelessWidget {
  const DatosAnimalLecheria({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatoAnimalController>(
        init: DatoAnimalController(),
        builder: (_) {
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
                          label: '${_.peso.value}',
                          value: _.peso.value,
                          min: 200.0,
                          max: 500.0,
                          divisions: 30,
                          onChanged: (value) {
                            _.peso.value = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: TextFormField(
                      autofocus: true,
                      initialValue: _.kgLeche.value.toString(),
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                      ),
                      style: TextStyle(fontSize: 18),
                      onChanged: (value) {
                        _.kgLeche.value = double.parse(value);
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
                          label: '${_.materiaGrasa.value}',
                          value: _.materiaGrasa.value,
                          min: 3.0,
                          max: 5.5,
                          divisions: 25,
                          onChanged: (value) {
                            final valueGrasa =
                                double.parse(value.toStringAsFixed(1));
                            _.materiaGrasa.value = valueGrasa;
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
        });
  }
}
