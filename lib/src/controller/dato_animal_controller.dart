import 'package:get/get.dart';

class DatoAnimalController extends GetxController {
  RxDouble peso = 200.0.obs;
  RxDouble kgLeche = 0.0.obs;
  RxDouble materiaGrasa = 3.0.obs;
  RxDouble gmd = 0.50.obs;
  RxString tipo = ''.obs;
  RxMap<String, double> calculo = Map<String, double>().obs;
  RxMap<String, double> requerimientoAnimal = Map<String, double>().obs;
  RxMap<String, double> racionAnimal = Map<String, double>().obs;
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

  loadingData() {
    peso = 200.0.obs;
    kgLeche = 0.0.obs;
    materiaGrasa = 3.0.obs;
  }
}
