import 'package:latlong2/latlong.dart';

class ApiConstants {
  ApiConstants._();

   static const BASE_URL_LOCAL = 'http://192.168.0.12/api/v1';
  // static const BASE_URL_LOCAL = 'http://192.168.1.235/api/v1';

  static const String LOGIN = '$BASE_URL_LOCAL/auth/login';

  static const String REGISTRATION = '$BASE_URL_LOCAL/auth/registration';

  static const String REFRESH = '$BASE_URL_LOCAL/auth/refresh';

  static const String LOGOUT = '$BASE_URL_LOCAL/auth/logout';

  static const String MAP = '$BASE_URL_LOCAL/spot/index';

  static const String SPOT_BY_ID = '$BASE_URL_LOCAL/spot/show';

  static const String FAVORITE = '$BASE_URL_LOCAL/favorite';

  static final CURRENT_LOCATION = LatLng(51.5090214, -0.1982948);
}
