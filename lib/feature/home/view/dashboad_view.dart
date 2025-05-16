import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/core/theme/app_colors.dart';
import 'package:moviehub/feature/home/view/home_view.dart';
import 'package:moviehub/feature/wishlist/view/wishlist_view.dart';

class DashboadView extends StatefulWidget {
  const DashboadView({super.key});

  @override
  State<DashboadView> createState() => _DashboadViewState();
}

class _DashboadViewState extends State<DashboadView> with SingleTickerProviderStateMixin {
  late final TabController _tabBarController;
  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          curve: Curves.easeOutExpo,
          // duration: Duration(milliseconds: 0),
          gap: 8,
          selectedIndex: _tabBarController.index,
          onTabChange: (value) {
            _tabBarController.animateTo(value);
          },
          color: Color(0xff92929D),
          activeColor: AppColors.primary,
          iconSize: 24,
          tabBackgroundColor: AppColors.kColorBackground,
          padding: EdgeInsets.symmetric(horizontal: AppDefaults.kPageSidePadding.left.h, vertical: 12.h),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Wishlist',
            ),
            GButton(
              icon: Icons.account_circle_rounded,
              text: 'Profile',
            )
          ]),
      body: TabBarView(
        children: [
          HomeView(),
          SizedBox(),
          WishlistView(),
          SizedBox(),
        ],
        controller: _tabBarController,
      ),
    );
  }
}
