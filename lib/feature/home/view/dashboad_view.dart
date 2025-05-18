import 'package:flutter/material.dart';

import 'package:moviehub/feature/home/view/home_view.dart';
import 'package:moviehub/feature/home/widget/bottom_bar.dart';

class DashboadView extends StatefulWidget {
  const DashboadView({super.key});

  @override
  State<DashboadView> createState() => _DashboadViewState();
}

class _DashboadViewState extends State<DashboadView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: HomeView(),
      ),
    );
  }
}
