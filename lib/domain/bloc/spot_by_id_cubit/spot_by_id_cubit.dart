import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/api/api_constants.dart';
import 'package:share_plus/share_plus.dart';

part 'spot_by_id_state.dart';

class SpotByIdCubit extends Cubit<SpotByIdState> {
  final MapProvider _provider = getIt.get<MapProvider>();

  SpotByIdCubit({required int id, required MapByIdModel model}) : super(SpotByIdState(mapByIdModel: model)) {
    _onCreate(id);
  }

  _onCreate(int id) async {
    final spotById = await _provider.getSpotById(id);
    emit(state.copyWith(mapByIdModel: spotById, isLoading: false));
  }

  void onShareSpot(int id) async {
    await Share.share('Йоу! Зацени спот ${ApiConstants.SPOT_BY_ID}/${id}');
  }

  void onSendReaction(String text, int score, int spotId) async {
    await _provider.addReactions(text, score, spotId);
  }
}
