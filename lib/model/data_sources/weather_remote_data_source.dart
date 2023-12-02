import 'package:dio/dio.dart';
import 'package:weather_app/core/exceptions/exceptions.dart';
import 'package:weather_app/model/core/api_constants.dart';
import 'package:weather_app/model/dtos/weather_request_dto.dart';
import 'package:weather_app/model/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(WeatherRequestDto dto);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  const WeatherRemoteDataSourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<WeatherModel> getWeather(WeatherRequestDto dto) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiConstants.forecast,
      queryParameters: dto.toMap(),
    );
    if (response.data != null) {
      return WeatherModel.fromJson(response.data!);
    } else {
      throw ServerException();
    }
  }
}
