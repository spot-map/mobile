import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_map/domain/api/provider/map_provider.dart';
import 'package:ride_map/internal/di/inject.dart';
part 'add_spot_state.dart';

class AddSpotCubit extends Cubit<AddSpotState> {
  final MapProvider _provider = getIt();

  AddSpotCubit() : super( const AddSpotState());

  void onAddStop(
      String name,
      String address,
      String description,
      double latitude,
      double longitude,
      ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _provider.addSpot(name, address, description, latitude, longitude, state.images);
    emit(state.copyWith(onAdded: result.value, isLoading: false, images: []));
  }

  Future<void> onSelectMultipleImages(List<XFile> images) async {
    emit(state.copyWith(images: images));
  }

  Future<void> onUnSelectMultipleImages() async {
    emit(state.copyWith(images: []));
  }
}
