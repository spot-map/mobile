import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/data/map_by_id_models/map_by_id_model.dart';
import 'package:ride_map/domain/usecases/api_usecases/map_usecase.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:share_plus/share_plus.dart';

part 'state.dart';

class SpotByIdCubit extends Cubit<SpotByIdState> {
  final MapUseCase _mapUseCase = getIt();

  SpotByIdCubit({required int id}) : super(const SpotByIdState()) {
    _onCreate(id);
  }

  _onCreate(int id) async {
    final spotById = await _mapUseCase.getSpotById(id);
    emit(state.copyWith(mapByIdModel: spotById, isLoading: false));
  }

  void onShareSpot(int id) async {
    await Share.share('Йоу! Зацени спот ');
  }

  void onSendReaction(String text, int score, int spotId) async {
    await _mapUseCase.addReactions(text, score, spotId);
  }
}
