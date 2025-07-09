part of 'search_view_model.dart';

abstract class SearchEvent {}

class PerformSearch extends SearchEvent {
  final String query;
  PerformSearch(this.query);
}
