import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/domain/bloc/spot/constants/spot_status.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'spot_event.dart';

part 'spot_state.dart';


@injectable
class SpotBloc extends Bloc<SpotEvent, SpotState> {
  MapModel? spot;
  final MapProvider _provider = getIt.get<MapProvider>();



  SpotBloc({required this.spot}) : super(SpotState()) {
    on<GetSpotList>(_onGetSpotList);
    on<AddSpotEvent>(_onAddSpotEvent);
  }

  void _onAddSpotEvent(AddSpotEvent event, Emitter<SpotState> emit) async{
    try{
      await _provider.addSpot(event.name, event.address, event.description, event.latitude, event.longitude);
      emit(state.copyWith(status: SpotStatus.added));
    }on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: SpotStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: SpotStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    }
  }

  void _onGetSpotList(GetSpotList event, Emitter<SpotState> emit) async {
    try {
      emit(state.copyWith(status: SpotStatus.loading));
      final spots = await _provider.getSpot();
      emit(
        state.copyWith(
          status: SpotStatus.success,
          spot: spots,
        ),
      );
    } on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: SpotStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: SpotStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    }
  }
}
