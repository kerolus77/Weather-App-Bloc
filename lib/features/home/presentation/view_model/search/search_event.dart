abstract class HomeEvent {}

class SearchEvent extends HomeEvent {
  final String text;

  SearchEvent({
    required this.text,
  });
}
