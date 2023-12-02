enum UnitEnum {
  metric(
    null,
    '°C',
    'km/h',
    '%',
  ),
  imperial(
    'fahrenheit',
    '°F',
    'km/h',
    '%',
  );

  const UnitEnum(
    this.temperature,
    this.temperatureUnit,
    this.windSpeedUnit,
    this.relativeHumidityUnit,
  );

  final String? temperature;
  final String temperatureUnit;
  // TODO: can change later for imperial. not wanted for now.
  final String windSpeedUnit;
  final String relativeHumidityUnit;
}
