import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/core/helper/ui_helpers.dart';
import 'package:moviehub/dependency_inject.dart';
import 'package:moviehub/feature/home/presentation/featured/view/featured_view.dart';
import 'package:moviehub/feature/home/presentation/genre/view/genre_view.dart';
import 'package:moviehub/feature/home/presentation/popular/view/pouplar_view.dart';
import 'package:moviehub/feature/home/presentation/recently_added/view/recently_added_view.dart';
import 'package:moviehub/feature/home/presentation/releasing_soon/view/releasing_soon_view.dart';
import 'package:moviehub/services/core/preference_service.dart';
import 'package:moviehub/shared/widgets/circular_image_widget.dart';
import 'package:moviehub/shared/widgets/form_seperator_box.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppDefaults.kPageSidePadding.left,
        centerTitle: false,
        title: Row(
          children: [
            CircularImageWidget(
              radius: 20,
              fit: BoxFit.fill,
            ),
            adaptableWidth(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, ${locator<PreferenceService>().username}",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                adaptableHeight(height: 4),
                Text(
                  "Your Personal Movie Universe.",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xff92929D),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormSeperatorBox(height: 20),
            FeaturedView(),
            widgetSpacer(),
            GenreView(),
            widgetSpacer(),
            PouplarView(),
            widgetSpacer(),
            RecentlyAddedView(),
            widgetSpacer(),
            ReleasingSoonView(),
            widgetSpacer(),
          ],
        ),
      ),
    );
  }

  Widget widgetSpacer() {
    return SizedBox(height: 30.h);
  }

  @override
  bool get wantKeepAlive => true;
}
