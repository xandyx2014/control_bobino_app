import 'package:control_animal_app/src/services/save_calcule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatoAnimalController extends GetxController {
  RxDouble peso = 200.0.obs;
  RxDouble kgLeche = 0.0.obs;
  RxDouble materiaGrasa = 3.0.obs;
  RxDouble gmd = 0.50.obs;
  RxString tipo = ''.obs;
  RxMap<String, double> calculo = Map<String, double>().obs;
  RxMap<String, double> requerimientoAnimal = Map<String, double>().obs;
  RxSet<dynamic> racionAnimal = Set().obs;

  @override
  Future<void> onClose() {
    return super.onClose();
    /*  this.peso.value = 200.0;
    this.kgLeche.value = 0.0;
    this.materiaGrasa.value = 3.0; */
  }

  @override
  void onInit() {
    super.onInit();
  }

  guardarDato() async {
    /* try { */
    final saveCalcule = SaveService();
    final saveResp = await saveCalcule.save(
        peso: this.peso.value,
        kgLecheDia: this.kgLeche.value,
        materialGrasa: this.materiaGrasa.value,
        tipo: this.tipo.value,
        gmd: this.gmd.value);
    this.racionAnimal.forEach((e) {
      saveCalcule.saveRacion(e, saveResp['id']);
    });

    await saveCalcule.saveRequerimiento(requerimientoAnimal, saveResp['id']);
    Get.back();
    Get.back();
    showDialog(
        context: Get.context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Se ha creado correctamente',
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Salir'))
              ],
            ));
    /*  } catch (e) {
      Get.back();
      showDialog(
          context: Get.context,
          builder: (BuildContext context) => AlertDialog(
                title: Text('Ha ocurrido un error'),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Salir'))
                ],
              ));
    } */

    // final racion = await saveCalcule.saveRacion(racionAnimal, saveResp['id']);
  }

  loadingData() {
    peso = 200.0.obs;
    kgLeche = 0.0.obs;
    materiaGrasa = 3.0.obs;
    gmd = 0.50.obs;
  }
}
