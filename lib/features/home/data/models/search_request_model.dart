class SearchRequestModel {
  final String query;

  SearchRequestModel({
    required this.query,
  });

  Map<String, dynamic> toJson() {
    return {
      'q': query,
    };
  }
}
