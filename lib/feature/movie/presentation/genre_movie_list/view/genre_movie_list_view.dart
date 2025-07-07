// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moviehub/core/bloc/view/bloc_builder_view.dart';
import 'package:moviehub/core/bloc/view/bloc_provider_view.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/dependency_inject.dart';
import 'package:moviehub/feature/movie/presentation/genre_movie_list/view_model/genre_movie_list_view_model.dart';
import 'package:moviehub/feature/search/presentation/widget/search_movie_widget.dart';
import 'package:moviehub/shared/widgets/center_hint_text.dart';
import 'package:moviehub/shared/widgets/form_seperator_box.dart';

class GenreMovieListView extends StatelessWidget {
  final String? genreId;
  const GenreMovieListView({
    super.key,
    required this.genreId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProviderView<GenreMovieListViewModel>(
      objLocator: () => locator<GenreMovieListViewModel>(param1: genreId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movies"),
        ),
        body: Padding(
          padding: AppDefaults.kPageSidePadding,
          child: BlocBuilderView<GenreMovieListViewModel, GenreMovieListState, GenreMovieListLoaded>(
            child: (context, state) {
              if (state.movies.isEmpty) {
                return const CenterHintText(text: "No movies found");
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 14),
                itemBuilder: (context, index) => SearchMovieWidget(movie: state.movies[index]),
                separatorBuilder: (context, index) => FormSeperatorBox(),
                itemCount: state.movies.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
