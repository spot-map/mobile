import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:ride_map/data/favorite_models/favorite_model.dart';
import 'package:ride_map/domain/usecases/api/favorite.dart';
import 'package:ride_map/domain/usecases/storage/token/tokent.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteUseCase _favoriteUseCase = getIt();
  final TokenStorageUseCaseImpl _tokenStorage = getIt();

  Stream<String> get messageStream => _messageController.stream;
  final _messageController = StreamController<String>();

  FavoriteCubit() : super(const FavoriteState()) {
    _onCreate();
  }

  _onCreate() {
    onGetFavoriteSpot();
  }

  Future<void> onGetFavoriteSpot() async {
    final favorite = await _favoriteUseCase.getFavoriteList();
    emit(
      state.copyWith(
        isLoading: false,
        favorite: favorite,
      ),
    );
  }

  void onAddSpotToFavorite(int id) {
    if (_tokenStorage.accessToken!.isNotEmpty) {
      _favoriteUseCase.addSpotToFavorite(id);
      HapticFeedback.vibrate();
      emit(state.copyWith(isLoading: false));
    } else {
      _messageController.add(FavoriteState.notAuthorized);
    }
  }

  void onDeleteSpotFromFavorite(int id) {
    _favoriteUseCase.deleteSpotFromFavorite(id);
    emit(state.copyWith(isLoading: false));
  }
}
