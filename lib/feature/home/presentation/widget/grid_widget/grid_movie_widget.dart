// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/core/theme/app_colors.dart';
import 'package:moviehub/feature/home/presentation/widget/rating_widget.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/shared/widgets/custom_ink_well.dart';
import 'package:moviehub/shared/widgets/image_widget.dart';

class GridMovieWidget extends StatelessWidget {
  final MovieEntity data;
  final bool showReleaseDate;
  const GridMovieWidget({
    super.key,
    required this.data,
    this.showReleaseDate = false,
  });

  @override
  Widget build(BuildContext context) {
    var releaseDate = DateTime.parse(data.releaseDate);
    return CustomInkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.movieDetail,
          arguments: {
            "id": data.id,
          },
        );
      },
      child: SizedBox(
        height: 230.h,
        width: 165.w,
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ImageWidget(
                        // clipBorder: true,
                        height: double.maxFinite,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        imageUrl: data.coverImage,
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: showReleaseDate
                            ? Chip(
                                label: Text(DateFormat("d MMM yyyy").format(releaseDate)),
                                backgroundColor: AppColors.primary,
                                labelStyle: TextStyle(color: Colors.white, fontSize: 12.sp),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)))
                            : RatingBoxWidget(
                                rating: data.averageRating,
                              ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        data.genre,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff92929D),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
