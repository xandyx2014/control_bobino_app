import 'package:control_animal_app/src/model/insumo_model.dart';
import 'package:control_animal_app/src/model/leche_model.dart';
import 'package:control_animal_app/src/model/rq_model.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
export 'package:control_animal_app/src/model/insumo_model.dart';
export 'package:control_animal_app/src/model/leche_model.dart';
export 'package:control_animal_app/src/model/rq_model.dart';

abstract class _PathRq {
  static const rqEnergiaGanacia =
      'assets/data/RQ_ENERGIA/RQ_ENERGIA_GANANCIA.json';
  static const rqEnergiaMantenimiento =
      'assets/data/RQ_ENERGIA/RQ_ENERGIA_MANTENIMIENTO.json';
  static const rqProteinaGanancia =
      'assets/data/RQ_PROTEINA/RQ_PROTEINA_GANACIA.json';
  static const rqProteinaMantenimiento =
      'assets/data/RQ_PROTEINA/RQ_PROTEINA_MANTENIMIENTO.json';
  static const rqLeche = 'assets/data/RQ_LECHE.json';
  static const insumo = 'assets/data/INSUMO.json';
}

class GlobalController extends GetxController {
  RxList<RqModel> rqEnergiaGanacia = List<RqModel>().obs;
  Rx<RqModel> rqEnergiaMantenimiento = RqModel().obs;
  RxList<RqModel> rqProteinaGanacia = List<RqModel>().obs;
  Rx<RqModel> rqProteinaMantenimiento = RqModel().obs;
  RxList<LecheModel> rqLeche = List<LecheModel>().obs;
  RxList<InsumoModel> insumo = List<InsumoModel>().obs;
  @override
  void onInit() {
    super.onInit();
    Future.wait([
      _loadRq(_PathRq.rqEnergiaMantenimiento, rqModelFromJson),
      _loadRq(_PathRq.rqEnergiaGanacia, rqModelFromJson),
      _loadRq(_PathRq.rqProteinaMantenimiento, rqModelFromJson),
      _loadRq(_PathRq.rqProteinaGanancia, rqModelFromJson),
      _loadRq(_PathRq.rqLeche, lecheModelFromJson),
      _loadRq(_PathRq.insumo, insumoModelFromJson),
    ]).then((value) {
      this.rqEnergiaMantenimiento.value = value[0];
      this.rqEnergiaGanacia.addAll(value[1]);
      this.rqProteinaMantenimiento.value = value[2];
      this.rqProteinaGanacia.addAll(value[3]);
      this.rqLeche.addAll(value[4]);
      this.insumo.addAll(value[5]);
    });
  }

  Future<dynamic> _loadRq(String path, Function(String value) fromJson) async {
    final rqString = await rootBundle.loadString(path);
    final rqData = fromJson(rqString);
    return rqData.length == 1 ? rqData[0] : rqData;
  }
}
