import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_map/data/map_by_id_page_models/map_by_id_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/domain/bloc/spot/constants/spot_status.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'spot_event.dart';

part 'spot_state.dart';


class SpotBloc extends Bloc<SpotEvent, SpotState> {
  MapModel? spot;
  final _provider = getIt.get<MapProvider>();

  SpotBloc({required this.spot}) : super(const SpotState()) {
    on<GetSpotList>(_onGetSpotList);
    on<AddSpotEvent>(_onAddSpotEvent);
    on<SelectMultipleImageEvent>((_onSelectMultipleImages));
    on<UnSelectMultipleImageEvent>((_onUnSelectMultipleImages));
    on<SearchSpot>(_onSearchSpot);
  }

  void _onSearchSpot(SearchSpot event, Emitter<SpotState> emit) async{
    try {
      emit(state.copyWith(status: SpotStatus.loading));
      final spots = await _provider.searchSpot(event.name);
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
    }catch (e){
      emit(
        state.copyWith(
          status: SpotStatus.error,
          errorMessage: 'Ошибка',
        ),
      );
      addError(e);
    }
  }

  Future<void> _onSelectMultipleImages(
      SelectMultipleImageEvent event, Emitter<SpotState> emit) async {
    emit(state.copyWith(images: event.images));
  }

  Future<void> _onUnSelectMultipleImages(
      UnSelectMultipleImageEvent event, Emitter<SpotState> emit) async {
    emit(state.copyWith(images: []));
  }

  void _onAddSpotEvent(AddSpotEvent event, Emitter<SpotState> emit) async {
    try {
      emit(state.copyWith(status: SpotStatus.loading));
      await _provider.addSpot(event.name, event.address, event.description,
          event.latitude, event.longitude, state.images);
      emit(state.copyWith(status: SpotStatus.added));
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
    } catch (e){
      emit(
        state.copyWith(
          status: SpotStatus.error,
          errorMessage: 'Ошибка',
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
    }catch (e){
      emit(
        state.copyWith(
          status: SpotStatus.error,
          errorMessage: 'Ошибка',
        ),
      );
      addError(e);
    }
  }
}
