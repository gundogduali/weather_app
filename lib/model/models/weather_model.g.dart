// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      current:
          CurrentWeatherModel.fromJson(json['current'] as Map<String, dynamic>),
      hourly:
          WeatherModel._hourlyFromJson(json['hourly'] as Map<String, dynamic>),
      daily: WeatherModel._dailyFromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'current': instance.current,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
