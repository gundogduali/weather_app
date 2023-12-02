import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/model/core/api_json_keys.dart';

part 'current_weather_model.g.dart';

@JsonSerializable()
class CurrentWeatherModel extends Equatable {
  const CurrentWeatherModel({
    required this.time,
    required this.temperature,
    required this.relativeHumidity,
    required this.windSpeed,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherModelFromJson(json);

  final DateTime time;
  @JsonKey(name: ApiJsonKeys.temperature)
  final double temperature;
  @JsonKey(name: ApiJsonKeys.relativeHumidity)
  final int relativeHumidity;
  @JsonKey(name: ApiJsonKeys.windSpeed)
  final double windSpeed;

  @override
  List<Object?> get props => [time, temperature, relativeHumidity, windSpeed];
}
