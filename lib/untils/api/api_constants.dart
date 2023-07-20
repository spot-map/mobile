
class ApiConstants {
  ApiConstants._();

   static const BASE_URL_DEV = 'http://88.210.10.87/api/v1';

  static const String LOGIN = '$BASE_URL_DEV/auth/login';

  static const String REGISTRATION = '$BASE_URL_DEV/auth/registration';

  static const String REFRESH = '$BASE_URL_DEV/auth/refresh';

  static const String LOGOUT = '$BASE_URL_DEV/auth/logout';

  static const String MAP = '$BASE_URL_DEV/spot/index';

  static const String SPOT_BY_ID = '$BASE_URL_DEV/spot/show';

  static const String FAVORITE = '$BASE_URL_DEV/favorite';

}
