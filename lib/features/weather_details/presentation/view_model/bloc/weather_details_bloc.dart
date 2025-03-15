import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../data/models/get_weather_request_model.dart';
import '../../../data/models/weather_response_model/hour.dart';
import '../../../data/models/weather_response_model/weather_response_model.dart';
import '../../../data/repository/weather_details_repository.dart';

part 'weather_details_event.dart';
part 'weather_details_state.dart';

class WeatherDetailsBloc
    extends Bloc<WeatherDetailsEvent, WeatherDetailsState> {
  final WeatherDetailsRepository repository;
  final String cityName;
  Hour? showWeatherData;
  WeatherResponseModel? weatherData;
  WeatherDetailsBloc({required this.repository, required this.cityName})
      : super(WeatherDetailsInitial()) {
    on<FetchWeatherDetailsEvent>(_onFetchWeatherData);
    on<ShowHourlyForecastDetailsEvent>(_onShowHourlyForecastDetails);
  }

  void _onFetchWeatherData(
    FetchWeatherDetailsEvent event,
    Emitter<WeatherDetailsState> emit,
  ) async {
    emit(GetWeatherDetailsLoadingState());

    final result =
        await repository.getWeatherDetailsData(GetWeatherRequestModel(
      alerts: 'no',
      aqi: 'no',
      days: '7',
      cityName: cityName,
    ));

    result.fold(
      (failure) => emit(WeatherDetailsErrorState()),
      (data) {
        weatherData = data;
        _setCurrentHour();
        emit(WeatherDetailsSuccessState(weatherData: weatherData));
      },
    );
  }

  void _onShowHourlyForecastDetails(
      ShowHourlyForecastDetailsEvent event, Emitter<WeatherDetailsState> emit) {
    showWeatherData = event.hour;
    emit(WeatherDetailsChangedState(showWeatherData: showWeatherData));
  }

  void _setCurrentHour() {
    String currentHour = DateFormat('yyyy-MM-dd HH:00').format(DateTime.now());

    showWeatherData = weatherData?.forecast?.forecastday?[0].hour?.firstWhere(
      (hour) => hour.time == currentHour,
      orElse: () => Hour(
        condition: weatherData?.current?.condition,
        tempC: weatherData?.current?.tempC,
        humidity: weatherData?.current?.humidity,
        pressureMb: weatherData?.current?.pressureMb,
        windKph: weatherData?.current?.windKph,
      ),
    );
  }
}
