// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:moviehub/core/helper/ui_helpers.dart';
import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/shared/widgets/custom_ink_well.dart';

import 'package:moviehub/shared/widgets/form_seperator_box.dart';
import 'package:moviehub/shared/widgets/image_widget.dart';
import 'package:moviehub/shared/widgets/label_widget.dart';

class SearchMovieWidget extends StatelessWidget {
  final MovieEntity movie;
  const SearchMovieWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.movieDetail,
          arguments: {
            'id': movie.id,
          },
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(
            imageUrl: movie.coverImage,
            height: 150.h,
            width: 110.w,
          ),
          adaptableWidth(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                movieReleaseOrNotChip(DateTime.parse(movie.releaseDate)),
                // FormSeperatorBox(
                //   height: 5.h,
                // ),
                Text(movie.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.displayMedium),
                FormSeperatorBox(
                  height: 8.h,
                ),
                LabelWidget(
                  icon: Icons.calendar_month_sharp,
                  label: DateTime.parse(movie.releaseDate).year.toString(),
                ),
                FormSeperatorBox(
                  height: 4.h,
                ),
                LabelWidget(
                  icon: Icons.timer,
                  label: "${movie.runtime} Minutes",
                ),
                FormSeperatorBox(
                  height: 4.h,
                ),
                LabelWidget(
                  icon: MdiIcons.filmstrip,
                  label: movie.genre,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
