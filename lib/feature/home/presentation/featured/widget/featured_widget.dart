import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/feature/movie/domain/entity/movie_entity.dart';
import 'package:moviehub/shared/widgets/custom_ink_well.dart';
import 'package:moviehub/shared/widgets/image_widget.dart';

class FeaturedWidget extends StatelessWidget {
  final MovieEntity data;
  const FeaturedWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.movieDetail,
          arguments: {
            "id": data.id,
          },
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.sp),
        child: Stack(
          children: [
            ImageWidget(
              clipBorder: true,
              height: double.maxFinite,
              fit: BoxFit.cover,
              width: double.maxFinite,
              imageUrl: data.coverImage,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: double.maxFinite,
                color: Colors.black.withOpacity(0.5),
                padding: EdgeInsets.all(15.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      DateFormat('MMM dd, yyyy').format(DateTime.parse(data.releaseDate)),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
