import 'dart:io';

abstract class VpnCheckerUseCase {
  Future<bool> isActive();
}

class VpnCheckerUseCaseImpl implements VpnCheckerUseCase {
  @override
  Future<bool> isActive() async {
    bool isVpnActive;
    List<NetworkInterface> interfaces =
        await NetworkInterface.list(includeLoopback: false, type: InternetAddressType.any);
    interfaces.isNotEmpty
        ? isVpnActive = interfaces.any((interface) =>
            interface.name.contains("tun") || interface.name.contains("ppp") || interface.name.contains("pptp"))
        : isVpnActive = false;
    return isVpnActive;
  }
}
