import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/model/core/app_dio.dart';
import 'package:weather_app/model/data_sources/weather_remote_data_source.dart';
import 'package:weather_app/model/repositories/weather_repository.dart';
import 'package:weather_app/viewmodel/weather_viewmodel.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerSingleton<Dio>(AppDio())
    //! Data Sources
    ..registerSingleton<WeatherRemoteDataSource>(
      WeatherRemoteDataSourceImpl(getIt()),
    )
    //! Repositories
    ..registerSingleton<WeatherRepository>(WeatherRepositoryImpl(getIt()))
    //! ViewModels
    ..registerFactory<WeatherViewModel>(() => WeatherViewModel(getIt()));
}
