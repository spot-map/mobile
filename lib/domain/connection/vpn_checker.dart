import 'dart:io';

abstract class VpnChecker{
  Future<bool> isVpnActive();
}


class VpnCheckerImpl implements VpnChecker {
  @override
  Future<bool> isVpnActive() async {
    bool isVpnActive;
    List<NetworkInterface> interfaces = await NetworkInterface.list(includeLoopback: false, type: InternetAddressType.any);
    interfaces.isNotEmpty
        ? isVpnActive = interfaces.any(
            (interface) => interface.name.contains("tun") || interface.name.contains("ppp") || interface.name.contains("pptp"))
        : isVpnActive = false;
    return isVpnActive;
  }
}
