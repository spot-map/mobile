part of 'cubit.dart';

class MapState extends Equatable {
  final bool isLoading;
  final MapModel? mapModel;
  final String errorMessage;

  const MapState({
    this.mapModel,
    this.isLoading = true,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  @override
  List<Object?> get props => [isLoading, errorMessage, mapModel];

  MapState copyWith({bool? isLoading, String? errorMessage, MapModel? mapModel}) {
    return MapState(
      errorMessage: errorMessage ?? this.errorMessage,
      mapModel: mapModel ?? this.mapModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
