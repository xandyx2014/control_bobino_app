import 'package:get/get.dart';

class DatoAnimalController extends GetxController {
  RxDouble peso = 200.0.obs;
  RxDouble kgLeche = 0.0.obs;
  RxDouble materiaGrasa = 3.0.obs;
  RxDouble gmd = 0.50.obs;
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
