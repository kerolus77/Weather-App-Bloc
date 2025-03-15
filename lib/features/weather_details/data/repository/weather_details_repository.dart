import 'package:dartz/dartz.dart';

import '../../../../core/data/network/web_service/api_error_handler.dart';
import '../models/get_weather_request_model.dart';
import '../models/weather_response_model/weather_response_model.dart';
import '../remote/weather_details_remote_ds.dart';

class WeatherDetailsRepository {
  final WeatherDetailsRemoteDs remoteDataSource;
  WeatherDetailsRepository({required this.remoteDataSource});

  Future<Either<ApiErrorModel, WeatherResponseModel>> getWeatherDetailsData(
      GetWeatherRequestModel queryParam) async {
    try {
      final response = await remoteDataSource.getWeather(queryParam);
      return Right(response);
    } on Exception catch (e) {
      print("Error getting notifications for notification ${e}");
      return Left(ErrorHandler.handle(e));
    }
  }
}
