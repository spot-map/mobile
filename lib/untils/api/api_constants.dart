import 'package:latlong2/latlong.dart';

class ApiConstants {
  ApiConstants._();

   // static const BASE_URL_LOCAL = 'http://192.168.0.13/api/v1';
  static const BASE_URL_LOCAL_SMOL = 'http://192.168.1.235/api/v1';

  static const String LOGIN = '$BASE_URL_LOCAL_SMOL/auth/login';

  static const String REGISTRATION = '$BASE_URL_LOCAL_SMOL/auth/registration';

  static const MAP = '$BASE_URL_LOCAL_SMOL/spot/index';

  static const SPOT_BY_ID = '$BASE_URL_LOCAL_SMOL/spot/show';

  static const FAVORITE = '$BASE_URL_LOCAL_SMOL/favorite';

  static final CURRENT_LOCATION = LatLng(51.5090214, -0.1982948);
}
