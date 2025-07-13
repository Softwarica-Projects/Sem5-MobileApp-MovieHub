import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/core/utility/mixin/shake_detector_mixin.dart';
import 'package:moviehub/feature/favourite/presentation/view/fav_movie_list_view.dart';
import 'package:moviehub/feature/favourite/presentation/view_model/fav_movie_list_view_model.dart';
import 'package:moviehub/feature/home/presentation/home/view/home_view.dart';
import 'package:moviehub/feature/home/presentation/widget/bottom_bar.dart';
import 'package:moviehub/feature/profile/presentation/profile/view/profile.dart';
import 'package:moviehub/feature/profile/presentation/profile/view_model/user_view_model.dart';
import 'package:moviehub/feature/search/presentation/view/search_view.dart';
import 'package:shake/shake.dart';

class DashboadView extends StatefulWidget {
  const DashboadView({super.key});

  @override
  State<DashboadView> createState() => _DashboadViewState();
}

class _DashboadViewState extends State<DashboadView> with SingleTickerProviderStateMixin, ShakeDetectorMixin {
  late final TabController _tabBarController;
  final ValueNotifier<int> _tabBarIndex = ValueNotifier(0);
  @override
  void initState() {
    super.initState();
    context.read<UserViewModel>().add(FetchUserEvent());
    context.read<FavMovieListViewModel>().add(FetchMovies());
    _tabBarController = TabController(length: 4, vsync: this);
    _tabBarController.addListener(() {
      _tabBarIndex.value = _tabBarController.index;
    });
  }

  @override
  void onShakeDetected(ShakeEvent event) {
    super.onShakeDetected(event);
    context.read<UserViewModel>().add(ShakePhoneEvent());
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
          children: [HomeView(), SearchView(), FavMovieListView(), ProfileView()],
        ),
      ),
    );
  }
}
