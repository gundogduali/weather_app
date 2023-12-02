// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class HourlyWeatherModel extends Equatable {
  const HourlyWeatherModel({
    required this.time,
    required this.temperature,
    required this.weatherCode,
  });

  final DateTime time;
  final double temperature;
  final int weatherCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time.millisecondsSinceEpoch,
      'temperature': temperature,
      'weatherCode': weatherCode,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [time, temperature, weatherCode];
}
