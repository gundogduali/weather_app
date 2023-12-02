import 'package:flutter/material.dart';
import 'package:weather_app/core/models/status.dart';
import 'package:weather_app/core/models/t_state.dart';
import 'package:weather_app/model/dtos/weather_request_dto.dart';
import 'package:weather_app/model/models/weather_model.dart';
import 'package:weather_app/model/repositories/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  WeatherViewModel(this._weatherRepository);

  final WeatherRepository _weatherRepository;

  // State
  TState<WeatherModel> _state = const TState();

  TState<WeatherModel> get state => _state;

  set state(TState<WeatherModel> value) {
    _state = value;
    notifyListeners();
  }
  //----------------------------------------------------------------------

  Future<void> getWeather() async {
    //TODO: Change latitude and longitude
    final dto = WeatherRequestDto(latitude: 52.52, longitude: 13.419998);
    final eitherResponse = await _weatherRepository.getWeather(dto);

    eitherResponse.fold(
      (l) {
        state = state.copyWith(status: Status.error, error: l);
      },
      (r) {
        state = state.copyWith(status: Status.loaded, data: r);
      },
    );
  }
}
