part of 'spot_bloc.dart';


enum RequestStatus{
  loaded,
  failure,
  loading,
}

 class SpotState extends Equatable {
  SpotState({
    required this.spot,
    this.status = RequestStatus.loading,
    this.message = ''
  });
  final SpotModel spot;
  final String message;
  final RequestStatus status;
  SpotState copyWith({
    SpotModel? spot,
    RequestStatus? status,
    String? message
  }) {
    return SpotState(spot: spot ?? this.spot,
        message: message ?? this.message,
        status: status ?? this.status);
  }
  @override
  List<Object?> get props => [spot,status];
}


