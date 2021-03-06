import 'package:controlanimalapp/src/interceptor/auth_interceptor.dart';
import 'package:controlanimalapp/src/model/calculos_model.dart';
import 'package:controlanimalapp/src/utils/enviroment_util.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
export 'package:controlanimalapp/src/model/calculos_model.dart';

class SaveService {
  final _http = new Dio(
    BaseOptions(
      baseUrl: Enviroment.UrlApi,
      headers: {'Authorization': GetStorage().read('token')},
    ),
  )..interceptors.add(authInterfector(Get.context));

  Future<Map<dynamic, dynamic>> save(
      {double peso,
      double kgLecheDia,
      double titulo,
      double materialGrasa,
      double gmd,
      String tipo}) async {
    final Response response = await _http.post(
      '/lecheria',
      data: {
        'peso_kg': peso,
        'kg_leche_dia': kgLecheDia,
        'titulo': titulo,
        'material_grasa': materialGrasa,
        'gmd': gmd,
        'tipo': tipo
      },
    );
    return response.data;
  }

  Future<Map<dynamic, dynamic>> saveRacion(racionAnimal, id) async {
    final Response response = await _http.post(
      '/lecheria/$id/racion',
      data: racionAnimal,
    );
    return response.data;
  }

  Future<Map<dynamic, dynamic>> saveRequerimiento(requerimiento, id) async {
    final Response response = await _http.post(
      '/lecheria/$id/requerimiento',
      data: requerimiento,
    );
    return response.data;
  }

  Future<List<CalculoModel>> getAll({String q = 'LECHERIA'}) async {
    final Response response =
        await _http.get('/lecheria', queryParameters: {'q': q});
    final data =
        (response.data as List).map((e) => CalculoModel.fromJson(e)).toList();
    return data;
  }

  Future<dynamic> delete(int i) async {
    final Response response = await _http.delete('/lecheria/$i');
    return response.data;
  }
}
