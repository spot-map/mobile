// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:location/location.dart';
import 'package:location_repository/src/model/current_location.dart';

class CurrentLocationFailure implements Exception {
  CurrentLocationFailure({
    required this.error,
  });
  final String error;
}

/// {@template location_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class LocationRepository {
  /// {@macro location_repository}
  LocationRepository({
    Location? location,
  }) : _location = location ?? Location();
  final Location _location;

  Future<CurrentUserLocationEntity> getCurrentLocation() async {
    final serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      final isEnabled = await _location.requestService();
      if (!isEnabled) {
        throw CurrentLocationFailure(
          error: "У вас не включена служба определения локации :(",
        );
      }
    }

    final permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      final status = await _location.requestPermission();
      if (status != PermissionStatus.granted) {
        throw CurrentLocationFailure(
          error: "Вы не дали доступ к своей локации :("
        );
      }
    }

    late final LocationData locationData;
    try {
      locationData = await _location.getLocation();
    } catch (_) {
      throw CurrentLocationFailure(
        error: 'Что-то пошло не так при получении вашей геопозиции, '
            'попробуйте позже :(',
      );
    }

    final latitude = locationData.latitude;
    final longitude = locationData.longitude;

    if (latitude == null || longitude == null) {
      throw CurrentLocationFailure(
        error: 'Что-то пошло не так при получении вашей геопозиции, '
            'попробуйте позже :(',
      );
    }

    return CurrentUserLocationEntity(
      latitude: latitude,
      longitude: longitude,
    );
  }
}