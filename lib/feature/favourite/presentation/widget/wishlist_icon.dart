// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moviehub/core/theme/app_colors.dart';

class WishlistIcon extends StatelessWidget {
  final String movieId;
  final bool isFavourite;
  const WishlistIcon({
    super.key,
    required this.movieId,
    required this.isFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      color: isFavourite ? AppColors.favouriteIcon : Colors.grey,
      size: 24.0,
    );
  }
}
