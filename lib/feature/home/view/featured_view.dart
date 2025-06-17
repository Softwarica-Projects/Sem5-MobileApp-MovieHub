import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/core/helper/ui_helpers.dart';
import 'package:moviehub/dependency_inject.dart';
import 'package:moviehub/feature/home/widget/featured/featured_shimmer.dart';
import 'package:moviehub/feature/home/widget/featured/featured_widget.dart';
import 'package:moviehub/services/movie/movie_service.dart';
import 'package:moviehub/shared/model/movie_model.dart';
import 'package:moviehub/shared/widgets/load_page_widget.dart';
import 'package:moviehub/shared/widgets/view_slider.dart';

class FeaturedView extends StatelessWidget {
  const FeaturedView({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadPageWidget<List<MovieModel>>(
      loadingWidget: FeaturedViewShimmer(),
      futureFunction: locator<MovieService>().getFeatured(),
      builder: (context, data) => ViewSlider(
        height: AppDefaults.featuredMovieHeight,
        viewportFraction: isMobile ? 0.8 : 0.8,
        length: data.length,
        builder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: FeaturedWidget(data: data[index]),
        ),
      ),
    );
  }
}
