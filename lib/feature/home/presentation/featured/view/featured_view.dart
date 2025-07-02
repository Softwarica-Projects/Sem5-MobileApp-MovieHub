import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviehub/core/bloc/view/bloc_builder_view.dart';
import 'package:moviehub/core/bloc/view/bloc_provider_view.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/core/helper/ui_helpers.dart';
import 'package:moviehub/feature/home/presentation/featured/view_model/featured_movies_view_model.dart';
import 'package:moviehub/feature/home/presentation/featured/widget/featured_shimmer.dart';
import 'package:moviehub/feature/home/presentation/featured/widget/featured_widget.dart';
import 'package:moviehub/shared/widgets/view_slider.dart';

class FeaturedView extends StatelessWidget {
  const FeaturedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProviderView<FeaturedMoviesViewModel>(
      child: BlocBuilderView<FeaturedMoviesViewModel, FeaturedMoviesState, FeaturedMoviesSuccess>(
        loadingWidget: FeaturedViewShimmer(),
        errorWidget: (_, __) => SizedBox.shrink(),
        child: (context, state) => ViewSlider(
          height: AppDefaults.featuredMovieHeight,
          viewportFraction: isMobile ? 0.8 : 0.8,
          length: state.movies.length,
          builder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: FeaturedWidget(data: state.movies[index]),
          ),
        ),
      ),
    );
  }
}
