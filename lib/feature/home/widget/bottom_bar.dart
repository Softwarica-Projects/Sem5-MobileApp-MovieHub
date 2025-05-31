// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/core/theme/app_colors.dart';

class BottomBar extends StatelessWidget {
  final int index;
  final Function(int index) onTabChange;
  const BottomBar({
    super.key,
    required this.index,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final bottomNavBarTheme = Theme.of(context).bottomNavigationBarTheme;
    return SafeArea(
      top: false,
      child: GNav(
          gap: 8,
          selectedIndex: index,
          onTabChange: onTabChange,
          color: bottomNavBarTheme.unselectedIconTheme!.color,
          activeColor: bottomNavBarTheme.selectedIconTheme!.color!,
          iconSize: bottomNavBarTheme.selectedIconTheme!.size!,
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
    );
  }
}
