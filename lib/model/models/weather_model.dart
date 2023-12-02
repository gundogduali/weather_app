import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/model/core/api_json_keys.dart';
import 'package:weather_app/model/models/current_weather_model.dart';
import 'package:weather_app/model/models/daily_weather_model.dart';
import 'package:weather_app/model/models/hourly_weather_model.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Equatable{
  WeatherModel({
    required this.current,
    required this.hourly,
    required this.daily,
  });

  final CurrentWeatherModel current;
  @JsonKey(fromJson: _hourlyFromJson)
  final List<HourlyWeatherModel> hourly;
  @JsonKey(fromJson: _dailyFromJson)
  final List<DailyWeatherModel> daily;

  static List<HourlyWeatherModel> _hourlyFromJson(Map<String, dynamic> json) {
    final timeList = List<String>.from(json[ApiJsonKeys.time] as List<dynamic>);
    final temperatureList =
        List<num>.from(json[ApiJsonKeys.temperature] as List<dynamic>);
    final weatherCodeList =
        List<num>.from(json[ApiJsonKeys.weatherCode] as List<dynamic>);
    final returnModels = <HourlyWeatherModel>[];
    for (var i = 0; i < timeList.length; i++) {
      final hourlyModel = HourlyWeatherModel(
        time: DateTime.parse(timeList[i]),
        temperature: temperatureList[i].toDouble(),
        weatherCode: weatherCodeList[i].toInt(),
      );
      returnModels.add(hourlyModel);
    }
    return returnModels;
  }

  static List<DailyWeatherModel> _dailyFromJson(Map<String, dynamic> json) {
    final timeList = List<String>.from(json[ApiJsonKeys.time] as List<dynamic>);
    final weatherCodeList =
        List<num>.from(json[ApiJsonKeys.weatherCode] as List<dynamic>);
    final returnModels = <DailyWeatherModel>[];
    for (var i = 0; i < timeList.length; i++) {
      final hourlyModel = DailyWeatherModel(
        time: DateTime.parse(timeList[i]),
        weatherCode: weatherCodeList[i].toInt(),
      );
      returnModels.add(hourlyModel);
    }
    return returnModels;
  }
  
  @override
  List<Object?> get props => [current,hourly,daily];
}
