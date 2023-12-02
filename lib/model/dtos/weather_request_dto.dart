class WeatherRequestDto {
  WeatherRequestDto({
    required this.latitude,
    required this.longitude,
  }) {
    //TODO: Change later from settings ui etc...
    _current = ['temperature_2m', 'relative_humidity_2m', 'wind_speed_10m'];
    _hourly = ['temperature_2m', 'weather_code'];
    _daily = ['weather_code'];
    _timezone = 'GMT';
  }

  final double latitude;
  final double longitude;
  late final List<String> _current;
  late final List<String> _hourly;
  late final List<String> _daily;
  late final String _timezone;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'current': _current,
      'hourly': _hourly,
      'daily': _daily,
      'timezone': _timezone,
    };
  }
}
