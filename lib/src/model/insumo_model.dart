import 'dart:convert';

import 'package:flutter/material.dart';

List<InsumoModel> insumoModelFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<InsumoModel>.from(
      jsonData.map((x) => InsumoModel.fromJson(x)));
}

String insumoModelToJson(List<InsumoModel> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class InsumoModel {
  String ingrediente;
  double ms;
  double ndt;
  double mcal;
  double pb;
  double kgDia;
  double precioKg;
  String tipo;
  String uuid;

  InsumoModel(
      {this.ingrediente,
      this.ms,
      this.ndt,
      this.mcal,
      this.pb,
      this.tipo,
      this.precioKg,
      this.kgDia,
      this.uuid});

  factory InsumoModel.fromJson(Map<String, dynamic> json) => new InsumoModel(
      ingrediente: json["Ingrediente"],
      ms: double.parse(json["MS"]),
      ndt: double.parse(json["NDT"]),
      mcal: double.parse(json["Mcal"]),
      pb: double.parse(json["PB"]),
      tipo: json["TIPO"],
      precioKg: 0.0,
      kgDia: 0.0,
      uuid: UniqueKey().toString());

  Map<String, dynamic> toJson() => {
        "Ingrediente": ingrediente,
        "MS": ms,
        "NDT": ndt,
        "Mcal": mcal,
        "PB": pb,
        "TIPO": tipo,
      };
  double precioTotal() {
    return this.kgDia * this.precioKg;
  }

  double inclusion(double subTotal) {
    return (this.kgDia / subTotal) * 100;
  }

  double getPrecioTotal() {
    return this.kgDia * this.precioKg;
  }

  double getInclusion(double subTotal) {
    return this.kgDia / subTotal;
  }

  double getKgTn(double subTotal) {
    return this.getInclusion(subTotal) * 1000;
  }
}
