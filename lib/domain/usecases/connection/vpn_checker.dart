import 'package:ride_map/domain/connection/vpn_checker.dart';
import 'package:ride_map/internal/di/inject.dart';

abstract class VpnCheckerUseCase {
  Future<bool> isVpnActive();
}

class VpnCheckerUseCaseImpl implements VpnCheckerUseCase {
  final VpnChecker _vpnChecker = getIt();

  @override
  Future<bool> isVpnActive() => _vpnChecker.isVpnActive();
}
