import 'package:ride_map/presentation/ui/screens/add_spot/screen.dart';
import 'package:ride_map/presentation/ui/screens/authorization/screen.dart';
import 'package:ride_map/presentation/ui/screens/bottom_navigation/screen.dart';
import 'package:ride_map/presentation/ui/screens/favorite/screen.dart';
import 'package:ride_map/presentation/ui/screens/map/screen.dart';
import 'package:ride_map/presentation/ui/screens/search_spot/screen.dart';
import 'package:ride_map/presentation/ui/screens/settings/screen.dart';
import 'package:ride_map/presentation/ui/screens/splash/screen.dart';
import 'package:ride_map/presentation/ui/screens/spot_by_id/screen.dart';
import 'package:ride_map/presentation/ui/widget/full_screen_image/full_screen_image.dart';

class AppRoutes {
  static const splash = '/${SplashScreen.path}';

  static const map = '/${MapScreen.path}';
  static const favorite = '/${FavoriteScreen.path}';
  static const auth = '/${AuthScreen.path}';
  static const addSpot = '/${AddSpotScreen.path}';
  static const settings = '/${SettingsScreen.path}';
  static const bottomNavigationHome = '/${RootScreen.path}';
  static const fullImageScreen = '/${FullScreenPage.path}';
  static const spotById = '/${SpotByIdScreen.path}';
  static const searchSpot = '/${SearchScreen.path}';
}
