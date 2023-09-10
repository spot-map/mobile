import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/domain/bloc/spot_by_id/constants/by_id_status.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'spot_by_id_event.dart';

part 'spot_by_id_state.dart';

class SpotByIdBloc extends Bloc<SpotByIdEvent, SpotByIdState> {
  MapByIdModel spotByIdModel;
  final _provider = getIt.get<MapProvider>();

  SpotByIdBloc({required this.spotByIdModel}) : super(SpotByIdState()) {
    on<GetSpotById>(_onGetSpotById);
    on<SendReactions>(_onSendReactions);
  }

  void _onSendReactions(SendReactions event, Emitter<SpotByIdState> emit) {
    try {
      _provider.addReactions(event.text, event.score, event.spotId);
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
    }catch (e){
      emit(
        state.copyWith(
          status: ByIdStatus.error,
          errorMessage: 'Ошибка',
        ),
      );
      addError(e);
    }
  }

  void _onGetSpotById(GetSpotById event, Emitter<SpotByIdState> emit) async {
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
    }catch (e){
      emit(
        state.copyWith(
          status: ByIdStatus.error,
          errorMessage: 'Ошибка',
        ),
      );
      addError(e);
    }
  }
}
