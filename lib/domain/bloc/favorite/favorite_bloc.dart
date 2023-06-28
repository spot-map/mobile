import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/api/provider/favorite_provider.dart';
import 'package:ride_map/domain/bloc/favorite/constants/favorite_status.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:vibration/vibration.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

final FavoriteProvider _provider = getIt.get<FavoriteProvider>();

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteModel model;

  FavoriteBloc({required this.model}) : super(FavoriteState()) {
    on<GetFavoriteSpotsEvent>(_onGetFavoriteSpotsEvent);
    on<AddSpotToFavoriteEvent>(_onAddSpotToFavoriteEvent);
  }

  void _onGetFavoriteSpotsEvent(
      GetFavoriteSpotsEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(state.copyWith(status: FavoriteStatus.loading));
      final favorite = await _provider.getFavoriteList();
      emit(
        state.copyWith(
          status: FavoriteStatus.loaded,
          favorite: favorite,
        ),
      );
    } on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: FavoriteStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: FavoriteStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    }
  }

  void _onAddSpotToFavoriteEvent(
      AddSpotToFavoriteEvent event, Emitter<FavoriteState> emit) async {
    try {
      _provider.addSpotToFavorite(event.id);
      HapticFeedback.vibrate();
      emit(state.copyWith(status: FavoriteStatus.added));
    } on NetworkError catch (e) {
      emit(
        state.copyWith(
          status: FavoriteStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    } on DioError catch (e) {
      emit(
        state.copyWith(
          status: FavoriteStatus.error,
          errorMessage: e.stackTrace.toString(),
        ),
      );
      addError(e);
    }
  }
}
