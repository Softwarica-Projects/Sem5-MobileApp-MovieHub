part of 'movie_detail_view_model.dart';

abstract class MovieDetailEvent {}

class FetchMovieDetail extends MovieDetailEvent {
  FetchMovieDetail();
}
