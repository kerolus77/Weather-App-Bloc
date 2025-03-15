class Urls {
  static final String _key = 'eb0315b46a6f4e00af9152404242407';
  static String get baseUrl => 'https://api.weatherapi.com/v1/';
  static String get getWeather => '/forecast.json?key=$_key';
  static String get search => '/search.json?key=$_key';
}
