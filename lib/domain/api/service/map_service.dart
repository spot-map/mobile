import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/repository/i_map_repository.dart';
import 'package:ride_map/untils/api/api_constants.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/dio/dio_manager.dart';

@Injectable(as: IMapRepository)
class MapService extends IMapRepository {
  @override
  Future<MapModel> getSpot() async {
    Response response = await DioManager()
        .dio
        .get(ApiConstants.MAP, options: Options(method: 'GET'));

    if (response.statusCode == 200) {
      Dev.log('SPOTS ${response.data}', name: 'GET SPOTS API REQUEST');
      return MapModel.fromJson(response.data);
    } else {
      Dev.log('Error ${response.statusCode}',
          name: 'SPOT API ERROR, ${response.statusCode}');
      throw Exception('Failed to load API data');
    }
  }
}
