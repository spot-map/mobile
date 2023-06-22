import 'package:latlong2/latlong.dart';

class ApiConstants {
  ApiConstants._();

  static const BASE_URL = 'http://192.168.0.13/api/v1';

  static const String LOGIN = '$BASE_URL/login';

  static const String REGISTRATION = '$BASE_URL/registration';

  static const MAP = '$BASE_URL/spot';

  static final CURRENT_LOCATION = LatLng(51.5090214, -0.1982948);
}
