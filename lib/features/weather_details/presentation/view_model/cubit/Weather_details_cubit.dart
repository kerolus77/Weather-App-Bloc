import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../../data/models/get_weather_request_model.dart';
import '../../../data/models/weather_response_model/hour.dart';
import '../../../data/models/weather_response_model/weather_response_model.dart';
import '../../../data/repository/weather_details_repository.dart';

part 'Weather_details_state.dart';

class WeatherDetailsCubit extends Cubit<WeatherDetailsState> {
  final WeatherDetailsRepository repository;
  final String cityName;
  Hour? showWeatherData;

  WeatherDetailsCubit({required this.repository, required this.cityName})
      : super(WeatherDetailsInitial()) {}

  void showHourlyForecastDetails(Hour? hour) {
    showWeatherData = hour;
    emit(WeatherDetailsChangedState(showWeatherData: showWeatherData));
  }

  WeatherResponseModel? weatherData;
  void getWeatherData() async {
    emit(GetWeatherDetailsLoadingState());
    final result =
        await repository.getWeatherDetailsData(GetWeatherRequestModel(
      alerts: 'no',
      aqi: 'no',
      days: '7',
      cityName: cityName,
    ));
    result.fold((l) {
      emit(WeatherDetailsErrorState());
    }, (r) {
      weatherData = r;
      setCurrentHour();
      emit(WeatherDetailsSuccessState());
    });
  }

  setCurrentHour() {
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
