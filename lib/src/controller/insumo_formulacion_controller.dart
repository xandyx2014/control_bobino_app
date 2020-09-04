import 'package:control_animal_app/src/model/insumo_model.dart';
import 'package:get/get.dart';

abstract class TipoInsumo {
  static const String forraje = 'FORRAJE';
  static const String concentrado = 'CONCENTRADO';
}

class RacionAnimalDia {
  double getSubTotal(String tipoInsumo, List<InsumoModel> insumos) {
    double value = 0.0;
    insumos.forEach((insumo) {
      if (insumo.tipo == TipoInsumo.forraje) {
        value = value + insumo.kgDia;
      }
      if (insumo.tipo == TipoInsumo.concentrado) {
        value = value + insumo.kgDia;
      }
    });
    return value;
  }
}

class InsumoFormulacionController extends GetxController with RacionAnimalDia {
  RxList<InsumoModel> insumos = List<InsumoModel>().obs;

  add(InsumoModel value) {
    this.insumos.add(value);
  }

  void setInsumo(InsumoModel insumo, int index) {
    this.insumos[index] = insumo;
  }

  @override
  Future<void> onClose() {
    return super.onClose();
  }

  deleteByIndex(int index) {
    this.insumos.removeAt(index);
  }
}
