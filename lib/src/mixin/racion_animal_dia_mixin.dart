import 'package:controlanimalapp/src/model/insumo_model.dart';

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
