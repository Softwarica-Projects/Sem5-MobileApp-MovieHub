import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviehub/core/bloc/view/bloc_builder_view.dart';
import 'package:moviehub/core/bloc/view/bloc_provider_view.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/core/helper/ui_helpers.dart';
import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/feature/home/presentation/genre/view_model/genre_list_view_model.dart';
import 'package:moviehub/feature/home/presentation/genre/widget/genre_tabs_shimmer_row.dart';
import 'package:moviehub/feature/home/presentation/genre/widget/tab_genre_widget.dart';
import 'package:moviehub/shared/widgets/custom_ink_well.dart';
import 'package:moviehub/shared/widgets/form_seperator_box.dart';

class GenreView extends StatelessWidget {
  const GenreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProviderView<GenreListViewModel>(
      child: BlocBuilderView<GenreListViewModel, GenreListState, GenreListSuccess>(
          loadingWidget: GenreTabsShimmerRow(),
          errorWidget: (_, __) => SizedBox.shrink(),
          child: (context, state) {
            final data = [...state.list];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDefaults.kPageSidePadding.left,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Genre",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      CustomInkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.genreList);
                        },
                        child: Text(
                          "See All",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                FormSeperatorBox(),
                SizedBox(
                  height: 32.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDefaults.kPageSidePadding.left,
                    ),
                    separatorBuilder: (_, __) => adaptableWidth(width: 8),
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TabGenreWidget(
                        data: data[index],
                        isSelected: index == 0,
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
