import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/services/location_service.dart';
import 'package:weather_app/model/core/app_dio.dart';
import 'package:weather_app/model/data_sources/weather_remote_data_source.dart';
import 'package:weather_app/model/repositories/weather_repository.dart';
import 'package:weather_app/view/route/app_router.dart';
import 'package:weather_app/viewmodel/location_viewmodel.dart';
import 'package:weather_app/viewmodel/weather_viewmodel.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerSingleton<Dio>(AppDio())
    ..registerSingleton<AppRouter>(AppRouter())
    //! Services
    ..registerSingleton<LocationService>(LocationServiceImpl())
    //! Data Sources
    ..registerSingleton<WeatherRemoteDataSource>(
      WeatherRemoteDataSourceImpl(getIt()),
    )
    //! Repositories
    ..registerSingleton<WeatherRepository>(WeatherRepositoryImpl(getIt()))
    //! ViewModels
    ..registerFactory<WeatherViewModel>(() => WeatherViewModel(getIt()))
    ..registerFactory<LocationViewModel>(() => LocationViewModel(getIt()));
}
