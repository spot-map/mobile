
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/data/map_by_id_page_model/map_by_id_model.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/untils/enum/location_enum.dart';

part 'spot_by_id_event.dart';
part 'spot_by_id_state.dart';

final MapProvider _provider = MapProvider();

class SpotByIdBloc extends Bloc<SpotByIdEvent, SpotByIdState> {
  MapByIdModel spotByIdModel;

  SpotByIdBloc({required this.spotByIdModel}) : super(SpotByIdState()) {
    on<GetSpotById>(_onGetSpotById);
  }

  void _onGetSpotById(GetSpotById event, Emitter<SpotByIdState> emit)async {
    try {
      emit(state.copyWith(status: LocationStateStatus.loading));
      final spotById = await _provider.getSpotById(event.id);
      emit(
        state.copyWith(
          status: LocationStateStatus.success,
          spotById: spotById,
        ),
      );
    } on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: LocationStateStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: LocationStateStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    }
  }
}
