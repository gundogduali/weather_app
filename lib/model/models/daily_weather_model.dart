import 'dart:convert';

import 'package:equatable/equatable.dart';

class DailyWeatherModel extends Equatable {
  const DailyWeatherModel({
    required this.time,
    required this.weatherCode,
  });

  final DateTime time;
  final int weatherCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time.millisecondsSinceEpoch,
      'weatherCode': weatherCode,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [time, weatherCode];
}
