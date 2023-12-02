// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:weather_app/core/exceptions/failures.dart';
import 'package:weather_app/model/data_sources/weather_remote_data_source.dart';
import 'package:weather_app/model/dtos/weather_request_dto.dart';
import 'package:weather_app/model/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherModel>> getWeather(WeatherRequestDto dto);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _weatherRemoteDataSource;
  WeatherRepositoryImpl(this._weatherRemoteDataSource);
  @override
  Future<Either<Failure, WeatherModel>> getWeather(
    WeatherRequestDto dto,
  ) async {
    try {
      return Right(await _weatherRemoteDataSource.getWeather(dto));
    } catch (e, s) {
      log('Error: $e');
      log('StackTrace: $s');
      //TODO: Handle if(e is DioError) or (e is ServerException)
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
