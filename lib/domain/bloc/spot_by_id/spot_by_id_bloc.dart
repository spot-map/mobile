
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/domain/bloc/spot_by_id/constants/by_id_status.dart';
import 'package:ride_map/untils/enum/location_enum.dart';

import '../login/constants/login_status.dart';

part 'spot_by_id_event.dart';
part 'spot_by_id_state.dart';

final MapProvider _provider = MapProvider();

class SpotByIdBloc extends Bloc<SpotByIdEvent, SpotByIdState> {
  MapByIdModel spotByIdModel;

  SpotByIdBloc({required this.spotByIdModel}) : super(SpotByIdState()) {
    on<GetSpotById>(_onGetSpotById);
    on<AddSpotToFavoriteEvent>(_onAddSpotToFavoriteEvent);
  }

  void _onGetSpotById(GetSpotById event, Emitter<SpotByIdState> emit)async {
    try {
      emit(state.copyWith(status: ByIdStatus.loading));
      final spotById = await _provider.getSpotById(event.id);
      emit(
        state.copyWith(
          status: ByIdStatus.loaded,
          spotById: spotById,
        ),
      );
    } on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: ByIdStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: ByIdStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    }
  }

  void _onAddSpotToFavoriteEvent(AddSpotToFavoriteEvent event, Emitter<SpotByIdState> emit){
    try {
      _provider.addSpotToFavorite(event.id);
      emit(state.copyWith(status: ByIdStatus.added));
    } on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: ByIdStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: ByIdStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    }
  }
}
