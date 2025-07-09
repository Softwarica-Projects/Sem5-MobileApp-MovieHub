// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/feature/movie/presentation/movie_detail/widget/cast_widet.dart';
import 'package:moviehub/shared/widgets/form_seperator_box.dart';

class AboutMovieWidget extends StatelessWidget {
  final MovieEntity movie;
  const AboutMovieWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormSeperatorBox(),
          if ((movie.description ?? "").isNotEmpty) ...[
            Text(
              "Description",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            FormSeperatorBox(
              height: 8,
            ),
            Text(movie.description ?? ""),
            FormSeperatorBox(),
          ],
          if (movie.cast.isNotEmpty) ...[
            Text(
              "Cast & Crews",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            FormSeperatorBox(
              height: 10,
            ),
            GridView.builder(
              padding: const EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4,
                crossAxisSpacing: 15.sp,
                mainAxisSpacing: 15.sp,
              ),
              itemCount: movie.cast.length,
              itemBuilder: (context, index) => CastWidget(cast: movie.cast[index]),
            ),
            FormSeperatorBox(
              height: 10,
            ),
          ],
        ],
      ),
    );
  }
}
