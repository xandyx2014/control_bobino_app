import 'package:control_animal_app/src/model/insumo_model.dart';
import 'package:get/get.dart';

abstract class TipoInsumo {
  static const String forraje = 'FORRAJE';
  static const String concentrado = 'CONCENTRADO';
}

class RacionAnimalDia {
  double getSubTotal(String tipoInsumo, List<InsumoModel> insumoList) {
    // double value = 0.0;
    return insumoList.fold(0.0, (previousValue, element) {
      if (element.tipo == tipoInsumo) {
        return previousValue + element.kgDia;
      }
      return previousValue + 0.0;
    });
  }

  double getTotalKgDia(List<InsumoModel> insumoList) {
    return insumoList.fold(
        0.0, (previousValue, element) => previousValue + element.kgDia);
  }

  double getPrecioTotal(List<InsumoModel> insumoList) {
    return insumoList.fold(
        0.0, (previousValue, element) => previousValue + element.precioTotal());
  }

  double getPrecioTotalTn(List<InsumoModel> insumoList) {
    return this.getPrecioTotal(insumoList) * 1000;
  }
}

class RequerimientoAnimal {
  double _getMsTotal(List<InsumoModel> insumolist) {
    return insumolist.fold(
        0.0, (previousValue, element) => previousValue + element.ms);
  }

  Map<String, double> getPorcentajes(List<InsumoModel> insumolist) {
    double porcentajeForrajae = 0.0;
    double porcentajeConcentrado = 0.0;
    double totalMs = this._getMsTotal(insumolist);
    insumolist.forEach((element) {
      if (element.tipo == 'FORRAJE') {
        porcentajeForrajae += element.ms;
      }
      if (element.tipo == 'CONCENTRADO') {
        porcentajeConcentrado += element.ms;
      }
    });

    return {
      'forraje': porcentajeForrajae / totalMs,
      'concentrado': porcentajeConcentrado / totalMs
    };
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
