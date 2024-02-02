import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ride_map/domain/usecases/connection_usecases/vpn_checker_usecase.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  Stream<String> get messageStream => _messageController.stream;
  final _messageController = StreamController<String>();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectionStream;
  final VpnCheckerUseCase _checkerUseCase = getIt();

  NetworkCubit() : super(const NetworkState()) {
    _onCreate();
  }

  _onCreate() async {
    _connectionStream = _connectivity.onConnectivityChanged.listen(_connectivityResult);
    _isVpn();
  }

  _connectivityResult(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile || result == ConnectivityResult.ethernet) {
      _messageController.add(NetworkState.isConnected);
    } else if (result == ConnectivityResult.none) {
      _messageController.add(NetworkState.noConnection);
    }
  }

  _isVpn() async {
    if (await _checkerUseCase.isVpnActive()) {
      _messageController.add(NetworkState.isVPN);
    }
  }

  @override
  Future<void> close() {
    return Future.wait([
      _connectionStream.cancel(),
    ]).then(
      (value) => super.close(),
    );
  }
}
