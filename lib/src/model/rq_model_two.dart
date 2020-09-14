import 'dart:convert';

List<RqModelTwo> rqModelTwoFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<RqModelTwo>.from(jsonData.map((x) => RqModelTwo.fromJson(x)));
}

String rqModelTwoToJson(List<RqModelTwo> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class RqModelTwo {
  double peso;
  double rqMs;
  double rqNdt;

  RqModelTwo({
    this.peso,
    this.rqMs,
    this.rqNdt,
  });

  factory RqModelTwo.fromJson(Map<String, dynamic> json) => new RqModelTwo(
        peso: double.parse((json["peso"] as String).replaceAll(',', '')),
        rqMs: double.parse((json["rqMs"] as String).replaceAll(',', '')),
        rqNdt: double.parse((json["rqNdt"] as String).replaceAll(',', '')),
      );

  Map<String, dynamic> toJson() => {
        "peso": peso,
        "rqMs": rqMs,
        "rqNdt": rqNdt,
      };
}
