part of 'weather_details_bloc.dart';

abstract class WeatherDetailsEvent extends Equatable {
  const WeatherDetailsEvent();

  @override
  List<Object?> get props => [];
}

class FetchWeatherDetailsEvent extends WeatherDetailsEvent {}

class ShowHourlyForecastDetailsEvent extends WeatherDetailsEvent {
  final Hour? hour;

  const ShowHourlyForecastDetailsEvent({required this.hour});

  @override
  List<Object?> get props => [hour];
}
