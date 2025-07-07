import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviehub/core/bloc/view/bloc_builder_view.dart';
import 'package:moviehub/core/bloc/view/bloc_provider_view.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/feature/genre/presentation/widget/genre_widget.dart';
import 'package:moviehub/feature/home/presentation/genre/view_model/genre_list_view_model.dart';
import 'package:moviehub/shared/widgets/center_hint_text.dart';

class GenreListView extends StatefulWidget {
  const GenreListView({super.key});

  @override
  State<GenreListView> createState() => _GenreListViewState();
}

class _GenreListViewState extends State<GenreListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Genre"),
      ),
      body: Padding(
        padding: AppDefaults.kPageSidePadding,
        child: BlocProviderView<GenreListViewModel>(
          child: BlocBuilderView<GenreListViewModel, GenreListState, GenreListSuccess>(
            child: (context, state) {
              var dataList = state.list.where((x) => x.id != "-1").toList();
              if (dataList.isEmpty) {
                return const CenterHintText(text: "No genres found");
              }
              return GridView.builder(
                itemCount: dataList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18.sp,
                  crossAxisSpacing: 18.sp,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, index) => GenreWidget(
                  data: dataList[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
