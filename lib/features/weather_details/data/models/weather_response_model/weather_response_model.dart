import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class WeatherResponseModel {
	Location? location;
	Current? current;
	Forecast? forecast;

	WeatherResponseModel({this.location, this.current, this.forecast});

	factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
		return WeatherResponseModel(
			location: json['location'] == null
						? null
						: Location.fromJson(json['location'] as Map<String, dynamic>),
			current: json['current'] == null
						? null
						: Current.fromJson(json['current'] as Map<String, dynamic>),
			forecast: json['forecast'] == null
						? null
						: Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'location': location?.toJson(),
				'current': current?.toJson(),
				'forecast': forecast?.toJson(),
			};
}
