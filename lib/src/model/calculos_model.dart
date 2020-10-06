import 'dart:convert';

List<CalculoModel> calculoModelFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<CalculoModel>.from(
      jsonData.map((x) => CalculoModel.fromJson(x)));
}

String calculoModelToJson(List<CalculoModel> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class CalculoModel {
  dynamic id;
  dynamic pesoKg;
  dynamic kgLecheDia;
  dynamic materialGrasa;
  dynamic gmd;
  dynamic titulo;
  String tipo;
  dynamic userId;
  String createdAt;
  String updatedAt;
  List<RacionAnimal> racionAnimals;
  List<RequerimientoAnimal> requerimientoAnimals;

  CalculoModel({
    this.id,
    this.pesoKg,
    this.kgLecheDia,
    this.materialGrasa,
    this.gmd,
    this.titulo,
    this.tipo,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.racionAnimals,
    this.requerimientoAnimals,
  });

  factory CalculoModel.fromJson(Map<String, dynamic> json) => new CalculoModel(
        id: json["id"],
        pesoKg: json["peso_kg"],
        kgLecheDia: json["kg_leche_dia"],
        materialGrasa: json["material_grasa"],
        gmd: json["gmd"],
        titulo: json["titulo"],
        tipo: json["tipo"],
        userId: json["user_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        racionAnimals: new List<RacionAnimal>.from(
            json["RacionAnimals"].map((x) => RacionAnimal.fromJson(x))),
        requerimientoAnimals: new List<RequerimientoAnimal>.from(
            json["RequerimientoAnimals"]
                .map((x) => RequerimientoAnimal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "peso_kg": pesoKg,
        "kg_leche_dia": kgLecheDia,
        "material_grasa": materialGrasa,
        "gmd": gmd,
        "titulo": titulo,
        "tipo": tipo,
        "user_id": userId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "RacionAnimals":
            new List<dynamic>.from(racionAnimals.map((x) => x.toJson())),
        "RequerimientoAnimals":
            new List<dynamic>.from(requerimientoAnimals.map((x) => x.toJson())),
      };
}

class RacionAnimal {
  dynamic id;
  String insume;
  String tipoInsume;
  dynamic kgDia;
  dynamic precioKg;
  dynamic precioTotal;
  dynamic inclusion;
  dynamic kgTn;
  dynamic calculoLecheriaId;
  String createdAt;
  String updatedAt;

  RacionAnimal({
    this.id,
    this.insume,
    this.tipoInsume,
    this.kgDia,
    this.precioKg,
    this.precioTotal,
    this.inclusion,
    this.kgTn,
    this.calculoLecheriaId,
    this.createdAt,
    this.updatedAt,
  });

  factory RacionAnimal.fromJson(Map<String, dynamic> json) => new RacionAnimal(
        id: json["id"],
        insume: json["insume"],
        tipoInsume: json["tipo_insume"],
        kgDia: json["kg_dia"],
        precioKg: json["precio_kg"],
        precioTotal: json["precio_total"],
        inclusion: json["inclusion"],
        kgTn: json["kg_tn"],
        calculoLecheriaId: json["calculo_lecheria_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "insume": insume,
        "tipo_insume": tipoInsume,
        "kg_dia": kgDia,
        "precio_kg": precioKg,
        "precio_total": precioTotal,
        "inclusion": inclusion,
        "kg_tn": kgTn,
        "calculo_lecheria_id": calculoLecheriaId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class RequerimientoAnimal {
  dynamic id;
  dynamic mantenimientoMs;
  dynamic mantenimientoNdt;
  dynamic mantenimientoEm;
  dynamic mantenimientoPb;
  dynamic produccionMs;
  dynamic produccionNdt;
  dynamic produccionEm;
  dynamic produccionPb;
  dynamic rqTotalMs;
  dynamic rqTotalNdt;
  dynamic rqTotalEm;
  dynamic rqTotalPb;
  dynamic excesoMs;
  dynamic excesoNdt;
  dynamic excesoEm;
  dynamic excesoPb;
  dynamic totalTmrMs;
  dynamic totalTmrNdt;
  dynamic totalTmrEm;
  dynamic totalTmrPb;
  dynamic balanceConcentrado;
  dynamic balanceVoluminoso;
  dynamic calculoLecheriaId;
  String createdAt;
  String updatedAt;

  RequerimientoAnimal({
    this.id,
    this.mantenimientoMs,
    this.mantenimientoNdt,
    this.mantenimientoEm,
    this.mantenimientoPb,
    this.produccionMs,
    this.produccionNdt,
    this.produccionEm,
    this.produccionPb,
    this.rqTotalMs,
    this.rqTotalNdt,
    this.rqTotalEm,
    this.rqTotalPb,
    this.excesoMs,
    this.excesoNdt,
    this.excesoEm,
    this.excesoPb,
    this.totalTmrMs,
    this.totalTmrNdt,
    this.totalTmrEm,
    this.totalTmrPb,
    this.balanceConcentrado,
    this.balanceVoluminoso,
    this.calculoLecheriaId,
    this.createdAt,
    this.updatedAt,
  });

  factory RequerimientoAnimal.fromJson(Map<String, dynamic> json) =>
      new RequerimientoAnimal(
        id: json["id"],
        mantenimientoMs: json["mantenimiento_ms"].toDouble(),
        mantenimientoNdt: json["mantenimiento_ndt"].toDouble(),
        mantenimientoEm: json["mantenimiento_em"].toDouble(),
        mantenimientoPb: json["mantenimiento_pb"].toDouble(),
        produccionMs: json["produccion_ms"],
        produccionNdt: json["produccion_ndt"],
        produccionEm: json["produccion_em"],
        produccionPb: json["produccion_pb"].toDouble(),
        rqTotalMs: json["rq_total_ms"].toDouble(),
        rqTotalNdt: json["rq_total_ndt"],
        rqTotalEm: json["rq_total_em"].toDouble(),
        rqTotalPb: json["rq_total_pb"].toDouble(),
        excesoMs: json["exceso_ms"].toDouble(),
        excesoNdt: json["exceso_ndt"],
        excesoEm: json["exceso_em"].toDouble(),
        excesoPb: json["exceso_pb"].toDouble(),
        totalTmrMs: json["total_tmr_ms"].toDouble(),
        totalTmrNdt: json["total_tmr_ndt"].toDouble(),
        totalTmrEm: json["total_tmr_em"].toDouble(),
        totalTmrPb: json["total_tmr_pb"].toDouble(),
        balanceConcentrado: json["balance_concentrado"],
        balanceVoluminoso: json["balance_voluminoso"],
        calculoLecheriaId: json["calculo_lecheria_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mantenimiento_ms": mantenimientoMs,
        "mantenimiento_ndt": mantenimientoNdt,
        "mantenimiento_em": mantenimientoEm,
        "mantenimiento_pb": mantenimientoPb,
        "produccion_ms": produccionMs,
        "produccion_ndt": produccionNdt,
        "produccion_em": produccionEm,
        "produccion_pb": produccionPb,
        "rq_total_ms": rqTotalMs,
        "rq_total_ndt": rqTotalNdt,
        "rq_total_em": rqTotalEm,
        "rq_total_pb": rqTotalPb,
        "exceso_ms": excesoMs,
        "exceso_ndt": excesoNdt,
        "exceso_em": excesoEm,
        "exceso_pb": excesoPb,
        "total_tmr_ms": totalTmrMs,
        "total_tmr_ndt": totalTmrNdt,
        "total_tmr_em": totalTmrEm,
        "total_tmr_pb": totalTmrPb,
        "balance_concentrado": balanceConcentrado,
        "balance_voluminoso": balanceVoluminoso,
        "calculo_lecheria_id": calculoLecheriaId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
