import 'package:equatable/equatable.dart';
import 'package:weather_app/features/home/data/models/city_model/city_model.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

abstract class SearchMyCity extends SearchState {}

class SearchMyCityLoadingState extends SearchMyCity {}

class SearchMyCitySuccessfullyState extends SearchMyCity {
  final List<CityModel> cities;

  SearchMyCitySuccessfullyState({required this.cities});
}

class SearchMyCitySuccessfullyEmptyState extends SearchMyCity {}

class SearchMyCityErrorState extends SearchMyCity {
  final String errorMessage;

  SearchMyCityErrorState({required this.errorMessage});
}

class SearchMyCityEmptyState extends SearchMyCity {}

class FocusState extends SearchState {}
