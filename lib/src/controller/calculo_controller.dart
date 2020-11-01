import 'package:controlanimalapp/src/model/calculos_model.dart';
import 'package:controlanimalapp/src/services/save_calcule.dart';
import 'package:get/get.dart';
export 'package:controlanimalapp/src/services/save_calcule.dart';

class CalculoController extends GetxController {
  final SaveService saveService = new SaveService();
  RxList<CalculoModel> calculo = List<CalculoModel>().obs;
  @override
  void onInit() {
    super.onInit();
  }

  getAll(String q) async {
    this.calculo.clear();
    final List<CalculoModel> calculoModel = await saveService.getAll(q: q);
    this.calculo.addAll(calculoModel);
  }

  removeItem(int index, CalculoModel calculoModel) async {
    this.calculo.removeAt(index);
    final dynamic resp = await saveService.delete(calculoModel.id);
    return resp;
  }
}
