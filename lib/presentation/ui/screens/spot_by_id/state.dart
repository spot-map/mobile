part of 'cubit.dart';

class SpotByIdState extends Equatable {
  final bool isLoading;
  final MapByIdModel? mapByIdModel;

  const SpotByIdState({
    this.mapByIdModel,
    this.isLoading = true,
  });

  @override
  List<Object?> get props => [isLoading, mapByIdModel];

  SpotByIdState copyWith({
    MapByIdModel? mapByIdModel,
    bool? isLoading,
  }) {
    return SpotByIdState(
      mapByIdModel: mapByIdModel ?? this.mapByIdModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
