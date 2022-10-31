import 'package:dio/dio.dart';
import 'package:ride_map/data/model/spot/spot_model.dart';
import 'package:ride_map/domain/api/repository/i_map_repository.dart';
import 'package:ride_map/untils/api/api_constants.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/dio/dio_manager.dart';

class MapService extends IMapRepository {
  @override
  Future<SpotModel> getSpot() async {
    Response response = await DioManager()
        .dio
        .get(ApiConstants.MAP, options: Options(method: 'GET'));

    if (response.statusCode == 200) {
      Dev.log('SPOTS ${response.data}', name: 'GET SPOTS API REQUEST');
      return SpotModel.fromJson(response.data);
    } else {
      Dev.log('Error ${response.statusCode}',
          name: 'SPOT API ERROR, ${response.statusCode}');
      throw Exception('Failed to load API data');
    }
  }
}
