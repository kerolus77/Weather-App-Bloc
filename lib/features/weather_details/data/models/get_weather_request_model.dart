class GetWeatherRequestModel {
  final String cityName;
  final String days;
  final String aqi;
  final String alerts;
  GetWeatherRequestModel(
      {required this.cityName,
      required this.days,
      required this.aqi,
      required this.alerts});

  Map<String, dynamic> toJson() {
    return {
      'q': cityName,
      'days': days,
      'aqi': aqi,
      'alerts': alerts,
    };
  }
}
