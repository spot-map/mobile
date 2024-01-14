import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:share_plus/share_plus.dart';

part 'spot_by_id_state.dart';

class SpotByIdCubit extends Cubit<SpotByIdState> {
  final MapProvider _provider = getIt();

  SpotByIdCubit({required int id}) : super(const SpotByIdState()) {
    _onCreate(id);
  }

  _onCreate(int id) async {
    final spotById = await _provider.getSpotById(id);
    emit(state.copyWith(mapByIdModel: spotById, isLoading: false));
  }

  void onShareSpot(int id) async {
    await Share.share('Йоу! Зацени спот ');
  }

  void onSendReaction(String text, int score, int spotId) async {
    await _provider.addReactions(text, score, spotId);
  }
}
