import 'package:flutter/material.dart';
import 'package:moviehub/shared/widgets/shrimmer.dart';

class GenreTabShimmer extends StatelessWidget {
  const GenreTabShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return RectangularShrimmer(
      size: Size(80, double.maxFinite), // Approximate size of a genre tab
      borderRadius: 20,
    );
  }
}
