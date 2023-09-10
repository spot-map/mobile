class ApiConstants {
  ApiConstants._();

  static const BASE_URL = 'http://91.186.199.237/api/v1';

  static const String LOGIN = '$BASE_URL/auth/login';

  static const String REGISTRATION = '$BASE_URL/auth/registration';

  static const String REFRESH = '$BASE_URL/auth/refresh';

  static const String LOGOUT = '$BASE_URL/auth/logout';

  static const String MAP_BASE = "$BASE_URL/spot";

  static const String SPOT_LIST = '$MAP_BASE/index';

  static const String SPOT_BY_ID = '$MAP_BASE/show';

  static const String SEARCH_SPOT = "$MAP_BASE/search";

  static const String FAVORITE = '$BASE_URL/favorite';

  static const String REACTIONS = "$BASE_URL/reaction";

  static const String ADD_SPOT = "$BASE_URL/spot/create";

  static const String ADD_IMAGE_TO_SPOT = "$BASE_URL/image/add";
}
