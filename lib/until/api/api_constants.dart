class ApiConstants {
  ApiConstants._();

  static const BASE_URL = 'http://91.186.199.237/api/v1';
  static const SPOT_BASE = '/spot';

  static const String LOGIN = '/auth/login';

  static const String REGISTRATION = '/auth/registration';

  static const String REFRESH = '/auth/refresh';

  static const String LOGOUT = '/auth/logout';

  static const String MAP = '$SPOT_BASE/index';

  static const String SPOT_BY_ID = '$SPOT_BASE/show';

  static const String SEARCH_SPOT = "$SPOT_BASE/search";

  static const String FAVORITE = '/favorite';

  static const String REACTIONS = "/reaction";

  static const String ADD_SPOT = "$SPOT_BASE/create";

  static const String ADD_IMAGE_TO_SPOT = "/image/add";
}
