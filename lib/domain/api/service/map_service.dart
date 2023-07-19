import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/repository/i_map_repository.dart';
import 'package:ride_map/untils/api/api_constants.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/dio/dio_manager.dart';

@Injectable(as: IMapRepository)
class MapService implements IMapRepository {

  @override
  Future<MapModel> getSpot() async {
    try {
      Response response =
          await  DioManager().dio.get(ApiConstants.MAP, options: Options(method: 'GET'));

      if (response.statusCode == 200) {
        Dev.log('SPOTS ${response.data}', name: 'GET SPOTS API REQUEST');
        return MapModel.fromJson(response.data);
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'SPOT API ERROR, ${response.statusCode}');
        throw Exception('Failed to load API data');
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<MapByIdModel> getSpotById(int id) async {
    try {
      Dev.log('GET SPOT BY ID $id', name: 'GET SPOT BY ID');
      Dev.log('RESPONSE TO ${ApiConstants.SPOT_BY_ID}/$id', name: 'RESPONSE');
      Response response = await  DioManager().dio.get('${ApiConstants.SPOT_BY_ID}/$id');
      if (response.statusCode == 200) {
        Dev.log('SPOT ${response.data}', name: 'GET SPOT BY ID');
        return MapByIdModel.fromJson(response.data);
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'SPOT BY ID API ERROR, ${response.statusCode}');
        throw Exception('Failed to load API data');
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addReactions(String text, int score, int spotId) {
    // TODO: implement addReactions
    throw UnimplementedError();
  }
}
