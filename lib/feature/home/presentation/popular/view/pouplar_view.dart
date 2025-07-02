import 'package:flutter/material.dart';
import 'package:moviehub/core/bloc/view/bloc_builder_view.dart';
import 'package:moviehub/core/bloc/view/bloc_provider_view.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/core/helper/ui_helpers.dart';
import 'package:moviehub/feature/home/presentation/popular/view_model/popular_list_view_model.dart';
import 'package:moviehub/feature/home/presentation/widget/grid_widget/grid_movie_shimmer_row.dart';
import 'package:moviehub/feature/home/presentation/widget/grid_widget/grid_movie_widget.dart';
import 'package:moviehub/shared/widgets/form_seperator_box.dart';

class PouplarView extends StatelessWidget {
  const PouplarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProviderView<PopularListViewModel>(
      child: BlocBuilderView<PopularListViewModel, PopularListState, PopularListSuccess>(
          loadingWidget: GridMovieShimmerRow(),
          errorWidget: (_, __) => SizedBox.shrink(),
          child: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDefaults.kPageSidePadding.left,
                    ),
                    child: Text(
                      "Most Popular",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  FormSeperatorBox(),
                  AspectRatio(
                    aspectRatio: 1.55,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDefaults.kPageSidePadding.left,
                      ),
                      separatorBuilder: (_, __) => adaptableWidth(width: 12),
                      itemCount: state.list.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GridMovieWidget(data: state.list[index]);
                      },
                    ),
                  ),
                ],
              )),
    );
  }
}
