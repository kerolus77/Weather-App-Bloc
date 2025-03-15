part of 'weather_details_bloc.dart';

abstract class WeatherDetailsState extends Equatable {
  const WeatherDetailsState();

  @override
  List<Object?> get props => [];
}

class WeatherDetailsInitial extends WeatherDetailsState {}

class WeatherDetailsChangedState extends WeatherDetailsState {
  final Hour? showWeatherData;

  const WeatherDetailsChangedState({required this.showWeatherData});

  @override
  List<Object?> get props => [showWeatherData];
}

class GetWeatherDetailsLoadingState extends WeatherDetailsState {}

class WeatherDetailsErrorState extends WeatherDetailsState {}

class WeatherDetailsSuccessState extends WeatherDetailsState {
  final WeatherResponseModel? weatherData;

  const WeatherDetailsSuccessState({required this.weatherData});

  @override
  List<Object?> get props => [weatherData];
}
