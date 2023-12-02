import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/model/core/app_dio.dart';
import 'package:weather_app/model/data_sources/weather_remote_data_source.dart';
import 'package:weather_app/model/repositories/weather_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerSingleton<Dio>(AppDio())
    ..registerSingleton<WeatherRemoteDataSource>(
      WeatherRemoteDataSourceImpl(getIt()),
    )
    ..registerSingleton<WeatherRepository>(WeatherRepositoryImpl(getIt()));
}
