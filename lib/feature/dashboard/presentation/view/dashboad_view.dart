import 'package:flutter/material.dart';
import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/dependency_inject.dart';
import 'package:moviehub/feature/favourite/presentation/view/fav_movie_list_view.dart';
import 'package:moviehub/feature/home/presentation/home/view/home_view.dart';
import 'package:moviehub/feature/home/presentation/widget/bottom_bar.dart';
import 'package:moviehub/feature/search/presentation/view/search_view.dart';
import 'package:moviehub/services/core/preference_service.dart';
import 'package:moviehub/shared/widgets/center_hint_text.dart';

class DashboadView extends StatefulWidget {
  const DashboadView({super.key});

  @override
  State<DashboadView> createState() => _DashboadViewState();
}

class _DashboadViewState extends State<DashboadView> with SingleTickerProviderStateMixin {
  late final TabController _tabBarController;
  final ValueNotifier<int> _tabBarIndex = ValueNotifier(0);
  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: 4, vsync: this);
    _tabBarController.addListener(() {
      _tabBarIndex.value = _tabBarController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: ValueListenableBuilder<int>(
            valueListenable: _tabBarIndex,
            builder: (context, _, __) {
              return BottomBar(
                  index: _tabBarIndex.value,
                  onTabChange: (index) {
                    _tabBarController.animateTo(index);
                  });
            }),
        body: TabBarView(
          controller: _tabBarController,
          children: [
            HomeView(),
            SearchView(),
            FavMovieListView(),
            Center(
              child: TextButton(
                onPressed: () {
                  locator<PreferenceService>().clearAll();
                  Navigator.of(context).pushNamedAndRemoveUntil(Routes.loginPage, (route) => false);
                },
                child: Text("Logout "),
              ),
            ),
            // CenterHintText(text: "Profile Page"),
          ],
        ),
      ),
    );
  }
}
