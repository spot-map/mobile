import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/usecases/favorite_use_case.dart';
import 'package:ride_map/internal/di/inject.dart';
part 'state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteUseCase _favoriteUseCase = getIt();

  FavoriteCubit() : super(const FavoriteState()) {
    _onCreate();
  }

  _onCreate() {
    onGetFavoriteSpot();
  }

  Future<void> onGetFavoriteSpot() async{
    final favorite = await _favoriteUseCase.getFavoriteList();
    emit(
      state.copyWith(
        isLoading: false,
        favorite: favorite,
      ),
    );
  }


  void onAddSpotToFavorite(int id){
    _favoriteUseCase.addSpotToFavorite(id);
    HapticFeedback.vibrate();
    emit(state.copyWith( isLoading: false));
  }


  void onDeleteSpotFromFavorite(int id){
    _favoriteUseCase.deleteSpotFromFavorite(id);
    emit(state.copyWith( isLoading: false));
  }
}
