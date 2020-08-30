import 'dart:convert';

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
  String tipo;

  InsumoModel({
    this.ingrediente,
    this.ms,
    this.ndt,
    this.mcal,
    this.pb,
    this.tipo,
  });

  factory InsumoModel.fromJson(Map<String, dynamic> json) => new InsumoModel(
        ingrediente: json["Ingrediente"],
        ms: double.parse(json["MS"]),
        ndt: double.parse(json["NDT"]),
        mcal: double.parse(json["Mcal"]),
        pb: double.parse(json["PB"]),
        tipo: json["TIPO"],
      );

  Map<String, dynamic> toJson() => {
        "Ingrediente": ingrediente,
        "MS": ms,
        "NDT": ndt,
        "Mcal": mcal,
        "PB": pb,
        "TIPO": tipo,
      };
}
