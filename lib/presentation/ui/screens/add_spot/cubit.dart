import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_map/core/di/inject.dart';
import 'package:ride_map/data/storage/token.dart';
import 'package:ride_map/domain/entities/map_by_id_models/map_by_id_model.dart';
import 'package:ride_map/domain/usecases/map/map.dart';
import 'package:ride_map/domain/entities/common/validator.dart';

part 'state.dart';

class AddSpotCubit extends Cubit<AddSpotState> {
  final MapUseCase _mapUseCase = getIt();
  final TokenStorage _tokenStorage = getIt();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Stream<String> get messageStream => _messageController.stream;
  final _messageController = StreamController<String>();

  AddSpotCubit() : super(AddSpotState());

  void onAddStop(
    double latitude,
    double longitude,
  ) async {
    emit(state.copyWith(isLoading: true));
    if (_tokenStorage.accessToken != null) {
      final result = await _mapUseCase.create(
          nameController.text, addressController.text, descriptionController.text, latitude, longitude, state.images);
      if (result.isSuccess) {
        final addImage = await _mapUseCase.addImage(result.value.data!.id!, state.images);
        if (addImage.isSuccess) {
          _messageController.add(AddSpotState.showSuccessMessage);
        } else {
          _messageController.add(addImage.message);
        }
      } else {
        _messageController.add(AddSpotState.showErrorMessage);
      }
      emit(state.copyWith(onAdded: result.value, isLoading: false, images: []));
    } else {
      _messageController.add(AddSpotState.notAuthorized);
    }
  }

  Future<void> onSelectMultipleImages(List<XFile> images) async {
    emit(state.copyWith(images: images));
  }

  onSpotNameChanged(String name) {
    state.name = name;
    final newError = TextValidators.spotName(name);
    if (state.nameError != newError) {
      emit(state.copyWith(nameError: newError));
    }
  }

  onDescriptionChanged(String description) {
    state.description = description;
    final newError = TextValidators.description(description);
    if (state.nameError != newError) {
      emit(state.copyWith(nameError: newError));
    }
  }

  onAddressChanged(String address) {
    state.address = address;
    final newError = TextValidators.address(address);
    if (state.nameError != newError) {
      emit(state.copyWith(address: newError));
    }
  }

  Future<void> onUnSelectMultipleImages() async {
    emit(state.copyWith(images: []));
  }

  @override
  Future<void> close() {
    _messageController.close();
    nameController.dispose();
    addressController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
