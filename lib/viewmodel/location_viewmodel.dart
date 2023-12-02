import 'package:flutter/material.dart';
import 'package:weather_app/core/services/location_service.dart';
import 'package:weather_app/model/models/location_model.dart';

class LocationViewModel extends ChangeNotifier {
  LocationViewModel(this._locationService);

  final LocationService _locationService;

  LocationModel _location = const LocationModel(longitude: 0, latitude: 0);

  LocationModel get location => _location;

  set location(LocationModel value) {
    _location = value;
    notifyListeners();
  }

  Future<void> setLocation() async {
    final eitherResponse = await _locationService.askLocationPermission();

    eitherResponse.fold(
      (l) {
        // Set from api call
      },
      (r) {
        location = location.copyWith(
          latitude: r.latitude,
          longitude: r.longitude,
        );
      },
    );
  }
}
