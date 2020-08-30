import 'dart:convert';

List<LecheModel> lecheModelFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<LecheModel>.from(jsonData.map((x) => LecheModel.fromJson(x)));
}

String lecheModelToJson(List<LecheModel> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class LecheModel {
  double grasaLeche;
  double rqNdt;

  LecheModel({
    this.grasaLeche,
    this.rqNdt,
  });

  factory LecheModel.fromJson(Map<String, dynamic> json) => new LecheModel(
        grasaLeche: double.parse(json["GRASA_LECHE"]),
        rqNdt: double.parse(json["RQ_NDT"]),
      );

  Map<String, dynamic> toJson() => {
        "GRASA_LECHE": grasaLeche,
        "RQ_NDT": rqNdt,
      };
}
