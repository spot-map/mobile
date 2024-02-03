import 'package:ride_map/presentation/ui/screen/add_spot/add_spot_screen.dart';
import 'package:ride_map/presentation/ui/screen/authorization/auth_screen.dart';
import 'package:ride_map/presentation/ui/screen/bottom_navigation/root_screen.dart';
import 'package:ride_map/presentation/ui/screen/favorite/favorite_screen.dart';
import 'package:ride_map/presentation/ui/screen/list/list_spot_screen.dart';
import 'package:ride_map/presentation/ui/screen/map/map_screen.dart';
import 'package:ride_map/presentation/ui/screen/settings/settings_screen.dart';
import 'package:ride_map/presentation/ui/screen/splash/splash_screen.dart';
import 'package:ride_map/presentation/ui/screen/spot_by_id/spot_by_id.dart';
import 'package:ride_map/presentation/ui/widget/full_screen_image/full_screen_image.dart';

class AppRoutes {
  static const splash = '/${SplashScreen.path}';

  static const map = '/${MapScreen.path}';
  static const favorite = '/${FavoriteScreen.path}';
  static const mapList = '/${ListSpotScreen.path}';
  static const auth = '/${AuthScreen.path}';
  static const addSpot = '/${AddSpotScreen.path}';
  static const settings = '/${SettingsScreen.path}';
  static const bottomNavigationHome = '/${RootScreen.path}';
  static const fullImageScreen = '/${FullScreenPage.path}';
  static const spotById = '/${SpotByIdModal.path}';
}
