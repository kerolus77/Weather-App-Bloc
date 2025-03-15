part of 'Weather_details_cubit.dart';

sealed class WeatherDetailsState extends Equatable {
  const WeatherDetailsState();

  @override
  List<Object> get props => [];
}

final class WeatherDetailsInitial extends WeatherDetailsState {}

final class WeatherDetailsChangedState extends WeatherDetailsState {
  final Hour? showWeatherData;

  WeatherDetailsChangedState({required this.showWeatherData});

  @override
  List<Object> get props => [showWeatherData!];
}

final class WeatherInitial extends WeatherDetailsState {}

class GetWeatherDetailsLoadingState extends WeatherDetailsState {}

class WeatherDetailsErrorState extends WeatherDetailsState {}

class WeatherDetailsSuccessState extends WeatherDetailsState {}
