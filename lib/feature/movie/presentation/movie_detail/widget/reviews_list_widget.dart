// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/presentation/movie_detail/widget/review_widget.dart';

class ReviewsListWidget extends StatelessWidget {
  final MovieEntity movie;
  const ReviewsListWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) => ReviewWidget(review: movie.ratings[index]),
      separatorBuilder: (context, index) => Divider(),
      itemCount: movie.ratings.length,
    );
  }
}
