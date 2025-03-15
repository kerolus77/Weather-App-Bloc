import 'package:dartz/dartz.dart';

import '../../../../core/data/network/web_service/api_error_handler.dart';
import '../models/city_model/city_model.dart';
import '../models/search_request_model.dart';
import '../remote/weather_remote_ds.dart';

class WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  WeatherRepository({required this.remoteDataSource});

  Future<Either<ApiErrorModel, List<CityModel>>> search(
      SearchRequestModel queryParam) async {
    try {
      final response = await remoteDataSource.search(queryParam);
      return Right(response);
    } on Exception catch (e) {
      print("Error getting notifications for notification ${e}");
      return Left(ErrorHandler.handle(e));
    }
  }
}
