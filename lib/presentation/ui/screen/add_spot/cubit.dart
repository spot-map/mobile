import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_map/domain/api/usecases/map_uses_case.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/preferences/preferences.dart';

part 'state.dart';

class AddSpotCubit extends Cubit<AddSpotState> {
  final MapUseCase _mapUseCase = getIt();

  Stream<String> get messageStream => _messageController.stream;
  final _messageController = StreamController<String>();

  AddSpotCubit() : super(const AddSpotState());

  void onAddStop(
    String name,
    String address,
    String description,
    double latitude,
    double longitude,
  ) async {
    emit(state.copyWith(isLoading: true));
    if(Prefs.getString('token') != null){
      final result = await _mapUseCase.addSpot(name, address, description, latitude, longitude, state.images);
      if (result.isSuccess) {
        _messageController.add(AddSpotState.showSuccessMessage);
      } else {
        _messageController.add(AddSpotState.showErrorMessage);
      }
      emit(state.copyWith(onAdded: result.value, isLoading: false, images: []));
    }else{
      _messageController.add(AddSpotState.notAuthorized);
    }
    emit(state.copyWith(onAdded: false, isLoading: false, images: []));
  }

  Future<void> onSelectMultipleImages(List<XFile> images) async {
    emit(state.copyWith(images: images));
  }

  Future<void> onUnSelectMultipleImages() async {
    emit(state.copyWith(images: []));
  }
}
