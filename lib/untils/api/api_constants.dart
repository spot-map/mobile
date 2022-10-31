import 'package:latlong2/latlong.dart';

class ApiConstants{
  ApiConstants._();

  static const BASE_URL = 'http://127.0.0.1:8000/api/v1';

  static const MAP = '$BASE_URL/map';

  static final CURRENT_LOCATION = LatLng(51.5090214, -0.1982948);
}