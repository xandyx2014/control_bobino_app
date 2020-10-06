import 'package:control_animal_app/src/services/save_calcule.dart';
import 'package:get/get.dart';
export 'package:control_animal_app/src/services/save_calcule.dart';

class CalculoController extends GetxController {
  final SaveService saveService = new SaveService();
  RxList<CalculoModel> calculo = List<CalculoModel>().obs;
  @override
  void onInit() {
    super.onInit();
  }

  getAll(String q) async {
    final List<CalculoModel> calculoModel = await saveService.getAll(q: q);
    this.calculo.addAll(calculoModel);
  }
}
