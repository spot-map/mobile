import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/api/provider/login_provider.dart';
import 'package:ride_map/domain/api/repository/i_favorite_repository.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/untils/api/api_constants.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/preferences/preferences.dart';

@injectable
class FavoriteService implements IFavoriteRepository {
  final Dio _dio = Dio();
  final AuthProvider _provider = getIt.get<AuthProvider>();

  @override
  Future<void> addSpotToFavorite(int id) async {
    try {
      var spotObject = {'spot_id': id};
      _dio.options.headers = {
        'Authorization':
            'Bearer ${Prefs.getString('token')}',
      };

      Response response = await _dio.post(
        ApiConstants.FAVORITE,
        data: spotObject,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode == 201) {
        Dev.log('SPOT ${response.data}', name: 'ADD SPOT TO FAVORITE');
        return response.data;
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'ADD SPOT TO FAVORITE, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<FavoriteModel> getFavoriteList() async {
    try {
      _dio.options.headers = {
        'Authorization':
            'Bearer ${Prefs.getString('token')}',
      };
      print(Prefs.getString('token'));
      Response response = await _dio.get(
        ApiConstants.FAVORITE,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200) {
        Dev.log('FAVORITE ${response.data}', name: 'FAVORITE LIST');
        return FavoriteModel.fromJson(response.data);
      } else {
        Dev.log('Error ${response.statusCode}',
            name: 'FAVORITE LIST API ERROR, ${response.statusCode}');
        throw Exception('${response.data}');
      }
    } on DioError catch (e) {
       throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
