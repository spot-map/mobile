import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/domain/api/provider/favorite_provider.dart';
import 'package:ride_map/internal/di/inject.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final  _provider = getIt.get<FavoriteProvider>();

  FavoriteCubit({
    required FavoriteModel model,
  }) : super(FavoriteState(favoriteModel: model)) {
    _onCreate();
  }

  _onCreate() {
    onGetFavoriteSpot();
  }

  Future<void> onGetFavoriteSpot() async{
    final favorite = await _provider.getFavoriteList();
    emit(
      state.copyWith(
        isLoading: false,
        favorite: favorite,
      ),
    );
  }


  void onAddSpotToFavorite(int id){
    _provider.addSpotToFavorite(id);
    HapticFeedback.vibrate();
    emit(state.copyWith( isLoading: false));
  }


  void onDeleteSpotFromFavorite(int id){
    _provider.deleteSpotFromFavorite(id);
    emit(state.copyWith( isLoading: false));
  }
}
