part of 'spot_by_id_cubit.dart';

class SpotByIdState extends Equatable {
  final bool isLoading;
  final MapByIdModel? mapByIdModel;
  final String errorMessage;

  const SpotByIdState({
    this.mapByIdModel,
    this.isLoading = true,
    String? errorMessage,
  }) : errorMessage = errorMessage ?? '';

  @override
  List<Object?> get props => [isLoading, errorMessage, mapByIdModel];

  SpotByIdState copyWith({MapByIdModel? mapByIdModel, bool? isLoading, String? errorMessage,}) {
    return SpotByIdState(
        errorMessage: errorMessage ?? this.errorMessage,
      mapByIdModel: mapByIdModel ?? this.mapByIdModel,
        isLoading: isLoading ?? this.isLoading,
    );
  }
}
