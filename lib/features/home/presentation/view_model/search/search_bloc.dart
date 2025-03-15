import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../core/helpers/event_transfotmer.dart';
import '../../../data/models/search_request_model.dart';
import '../../../data/repository/weather_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<HomeEvent, SearchState> {
  final WeatherRepository repository;

  TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode(canRequestFocus: true);

  SearchBloc({required this.repository}) : super(SearchInitial()) {
    on<SearchEvent>((
      event,
      emit,
    ) async {
      if (event.text.isEmptyOrNull) {
        print("empty");
        emit(SearchMyCityEmptyState());
        return;
      }
      emit(SearchMyCityLoadingState());
      final result = await repository.search(SearchRequestModel(
        query: event.text,
      ));

      result.fold((l) {
        l;
        emit(SearchMyCityErrorState(errorMessage: l.toString()));
      }, (r) {
        if (r.isEmpty) {
          emit(SearchMyCitySuccessfullyEmptyState());
        } else {
          emit(SearchMyCitySuccessfullyState(cities: r));
        }
      });
    }, transformer: debounce());
  }
}
