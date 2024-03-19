part of 'cubit.dart';

class MapState extends Equatable {
  final bool isLoading;
  final MapModel? mapModel;

  const MapState({
    this.mapModel,
    this.isLoading = true,
  });

  @override
  List<Object?> get props => [isLoading, mapModel];

  MapState copyWith({bool? isLoading, MapModel? mapModel}) {
    return MapState(
      mapModel: mapModel ?? this.mapModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
