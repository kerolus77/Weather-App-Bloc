import 'package:weather_app/core/utils/urls.dart';

import '../../../../core/data/network/web_service/api_service.dart';
import '../models/city_model/city_model.dart';
import '../models/search_request_model.dart';

class WeatherRemoteDataSource {
  Future<List<CityModel>> search(SearchRequestModel queryParam) async {
    final response = await AppDio().get(
      path: Urls.search,
      queryParams: queryParam.toJson(),
    );
    return (response.data as List).map((e) => CityModel.fromJson(e)).toList();
  }
}
