
class ApiConstants {
  ApiConstants._();

   static const BASE_URL_LOCAL = 'http://88.210.10.87/api/v1';

  static const String LOGIN = '$BASE_URL_LOCAL/auth/login';

  static const String REGISTRATION = '$BASE_URL_LOCAL/auth/registration';

  static const String REFRESH = '$BASE_URL_LOCAL/auth/refresh';

  static const String LOGOUT = '$BASE_URL_LOCAL/auth/logout';

  static const String MAP = '$BASE_URL_LOCAL/spot/index';

  static const String SPOT_BY_ID = '$BASE_URL_LOCAL/spot/show';

  static const String FAVORITE = '$BASE_URL_LOCAL/favorite';

}
