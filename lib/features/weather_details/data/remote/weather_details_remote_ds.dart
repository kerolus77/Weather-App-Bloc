import 'package:weather_app/core/utils/urls.dart';

import '../../../../core/data/network/web_service/api_service.dart';
import '../models/get_weather_request_model.dart';
import '../models/weather_response_model/weather_response_model.dart';

class WeatherDetailsRemoteDs {
  Future<WeatherResponseModel> getWeather(
      GetWeatherRequestModel queryParam) async {
    final response = await AppDio().get(
      path: Urls.getWeather,
      queryParams: queryParam.toJson(),
    );
    return WeatherResponseModel.fromJson(response.data);
  }
}
