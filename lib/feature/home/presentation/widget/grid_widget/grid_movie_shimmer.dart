import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../shared/widgets/shrimmer.dart';

class GridMovieShimmer extends StatelessWidget {
  const GridMovieShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return RectangularShrimmer(
      size: Size(150, 200.h), // Match movie poster size
      borderRadius: 12.sp,
    );
  }
}
