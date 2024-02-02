part of 'cubit.dart';

class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object> get props => [];


  static const String isVPN = 'isVPN';
  static const String noConnection = 'noConnection';
  static const String isConnected = 'notAuthorized';
}