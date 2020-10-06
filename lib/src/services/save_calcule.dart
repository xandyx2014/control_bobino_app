import 'package:control_animal_app/src/interceptor/auth_interceptor.dart';
import 'package:control_animal_app/src/utils/enviroment_util.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SaveService {
  final _http = new Dio(
    BaseOptions(
        baseUrl: Enviroment.UrlApi,
        headers: {'Authorization': GetStorage().read('token')}),
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
    print('Requerimiento $requerimiento id $id');
    final Response response = await _http.post(
      '/lecheria/$id/requerimiento',
      data: requerimiento,
    );
    return response.data;
  }
}
