import 'package:control_animal_app/src/model/rq_model.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

abstract class PathRq {
  static const rqEnergiaGanacia =
      'assets/data/RQ_ENERGIA/RQ_ENERGIA_GANANCIA.json';
  static const rqEnergiaMantenimiento =
      'assets/data/RQ_ENERGIA/RQ_ENERGIA_MANTENIMIENTO.json';
  static const rqProteinaGanancia =
      'assets/data/RQ_PROTEINA/RQ_PROTEINA_GANACIA.json';
  static const rqProteinaMantenimiento =
      'assets/data/RQ_PROTEINA/RQ_PROTEINA_MANTENIMIENTO.json';
}

class GlobalController extends GetxController {
  RxList<RqModel> rqEnergiaGanacia = List<RqModel>().obs;
  Rx<RqModel> rqEnergiaMantenimiento = RqModel().obs;
  RxList<RqModel> rqProteinaGanacia = List<RqModel>().obs;
  Rx<RqModel> rqProteinaMantenimiento = RqModel().obs;
  @override
  void onInit() {
    super.onInit();
    /* _loadRq(PathRq.rqEnergiaMantenimiento).then((value) {
      print(value);
    }); */
    Future.wait([
      _loadRq(PathRq.rqEnergiaMantenimiento),
      _loadRq(PathRq.rqEnergiaGanacia),
      _loadRq(PathRq.rqProteinaMantenimiento),
      _loadRq(PathRq.rqProteinaGanancia),
    ]).then((value) {
      this.rqEnergiaMantenimiento.value = value[0];
      this.rqEnergiaGanacia.addAll(value[1]);
      this.rqProteinaMantenimiento.value = value[2];
      this.rqProteinaGanacia.addAll(value[3]);
    });
  }

  Future<dynamic> _loadRq(String path) async {
    final rqString = await rootBundle.loadString(path);
    final List<RqModel> rqData = rqModelFromJson(rqString);
    return rqData.length == 1 ? rqData[0] : rqData;
  }
}
