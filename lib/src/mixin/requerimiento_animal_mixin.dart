import 'package:control_animal_app/src/model/insumo_model.dart';

class CalculoRequerimientoAnimal {
  Map<String, double> getPorcentajes(List<InsumoModel> insumolist) {
    double porcentajeForrajae = 0.0;
    double porcentajeConcentrado = 0.0;
    double totalMs = this.getMsTotal(insumolist);
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

  Map<String, double> getBalance(List<InsumoModel> insumoList) {
    double msForraje = 0.0, msConcentrado = 0.00, msTotal = 0.0;
    insumoList.forEach((element) {
      msTotal += (element.ms * element.kgDia) / 100;
      if (element.tipo == 'FORRAJE') {
        msForraje += (element.ms * element.kgDia) / 100;
      }
      if (element.tipo == 'CONCENTRADO') {
        msConcentrado += (element.ms * element.kgDia) / 100;
      }
    });
    return {
      'concentrado': msConcentrado / msTotal,
      'forraje': msForraje / msTotal
    };
  }

  Map<String, double> getResultados(List<InsumoModel> insumolist) {
    double ms = 0.0, ndt = 0.0, em = 0.0, pb = 0.00;
    insumolist.forEach((element) {
      ms += (element.ms * element.kgDia) / 100;
      ndt += (element.ndt * ms) / 100;
      em += (element.mcal * ms);
      pb += (element.pb * ms) / 100;
    });
    return {'ms': ms, 'ndt': ndt, 'em': em, 'pb': pb};
  }

  double getMsTotal(List<InsumoModel> insumolist) {
    return insumolist.fold(
        0.0, (previousValue, element) => previousValue + (element.ms / 100));
  }

  double getNdtTotal(List<InsumoModel> insumoList) {
    return insumoList.fold(
        0.0, (previousValue, element) => previousValue + (element.ndt / 100));
  }

  double getEmTotal(List<InsumoModel> insumoList) {
    return insumoList.fold(
        0.0, (previousValue, element) => previousValue + (element.mcal / 100));
  }

  double getPbTotal(List<InsumoModel> insumoList) {
    return insumoList.fold(
        0.0, (previousValue, element) => previousValue + (element.mcal / 100));
  }
}

class MantenimientoLecheModel implements RequerimientoAnimalFactory {
  final List<InsumoModel> insumos;
  double pesoKg, kgLecheDia, materialGrasa;
  MantenimientoLecheModel({this.insumos});
  valuesRq(double pesoKg, double kgLecheDia, double materialGrasa) {
    this.pesoKg = pesoKg;
    this.kgLecheDia = kgLecheDia;
    this.materialGrasa = materialGrasa;
  }
}

class _MantenimientoEngordeModel implements RequerimientoAnimalFactory {
  final List<InsumoModel> insumos;
  _MantenimientoEngordeModel({this.insumos});
}

class _ProduccionModelLeche implements RequerimientoAnimalFactory {
  final List<InsumoModel> insumos;
  _ProduccionModelLeche({this.insumos});
}

class _ProduccionModelEngorde implements RequerimientoAnimalFactory {
  final List<InsumoModel> insumos;
  _ProduccionModelEngorde({this.insumos});
}

enum TipoCalculo { lecheria, engorde }

abstract class RequerimientoAnimalFactory {
  factory RequerimientoAnimalFactory.mantenimiento(
      TipoCalculo typeMantenimiento, List<InsumoModel> insumos) {
    switch (typeMantenimiento) {
      case TipoCalculo.lecheria:
        return MantenimientoLecheModel(insumos: insumos);
      case TipoCalculo.engorde:
        return _MantenimientoEngordeModel(insumos: insumos);
      default:
        return null;
    }
  }
  factory RequerimientoAnimalFactory.produccion(
      TipoCalculo typeMantenimiento, List<InsumoModel> insumos) {
    switch (typeMantenimiento) {
      case TipoCalculo.lecheria:
        return _ProduccionModelLeche(insumos: insumos);
      case TipoCalculo.engorde:
        return _ProduccionModelEngorde(insumos: insumos);
      default:
        return null;
    }
  }
  static getRqTotal(double firts, double seconds) {
    return firts / seconds;
  }

  static getExceso(double firts, double seconds) {
    return firts / seconds;
  }
}
