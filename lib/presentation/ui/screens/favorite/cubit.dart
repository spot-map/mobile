import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:ride_map/data/favorite_models/favorite_model.dart';
import 'package:ride_map/domain/storage/token.dart';
import 'package:ride_map/domain/usecases/api/favorite.dart';
import 'package:ride_map/internal/di/inject.dart';

part 'state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteUseCase _favoriteUseCase = getIt();
  final TokenStorage _tokenStorage = getIt();

  Stream<String> get messageStream => _messageController.stream;
  final _messageController = StreamController<String>();

  FavoriteCubit() : super(const FavoriteState()) {
    _onCreate();
  }

  _onCreate() {
    onGetFavoriteSpot();
  }

  Future<void> onGetFavoriteSpot() async {
    final favorite = await _favoriteUseCase.get();
    if (favorite.isSuccess) {
      emit(state.copyWith(favorite: favorite.value, isLoading: false));
    } else {
      _messageController.add(favorite.message);
      return;
    }
  }

  void onAddSpotToFavorite(int id) async {
    if (_tokenStorage.accessToken!.isNotEmpty) {
      final added = await _favoriteUseCase.add(id);
      if (added.isSuccess) {
        HapticFeedback.vibrate();
      }
      emit(state.copyWith(isLoading: false));
    } else {
      _messageController.add(FavoriteState.notAuthorized);
    }
  }

  void onDeleteSpotFromFavorite(int id) {
    _favoriteUseCase.delete(id);
    emit(state.copyWith(isLoading: false));
  }
}
