import 'package:ride_map/presentation/ui/screen/add_spot/add_spot_screen.dart';
import 'package:ride_map/presentation/ui/screen/authorization/login_screen/login_screen.dart';
import 'package:ride_map/presentation/ui/screen/favorite/favorite_screen.dart';
import 'package:ride_map/presentation/ui/screen/list/list_spot_screen.dart';
import 'package:ride_map/presentation/ui/screen/map/map_screen.dart';
import 'package:ride_map/presentation/ui/screen/navigation/root_screen.dart';
import 'package:ride_map/presentation/ui/screen/settings/settings_screen.dart';
import 'package:ride_map/presentation/ui/screen/splash/splash_screen.dart';

class AppRoutes{
  static const splash = '/${SplashScreen.path}';

  static const map = '/${MapScreen.path}';
  static const favorite = '/${FavoriteScreen.path}';
  static const mapList = '/${ListSpotScreen.path}';
  static const auth = '/${LoginScreen.path}';
  static const addSpot = '/${AddSpotScreen.path}';
  static const settings = '/${SettingsScreen.path}';
  static const bottomNavigationHome = '/${RootScreen.path}';
}