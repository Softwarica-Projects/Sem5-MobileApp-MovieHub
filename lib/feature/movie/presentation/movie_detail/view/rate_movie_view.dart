// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'package:moviehub/core/bloc/view/bloc_builder_view.dart';
import 'package:moviehub/core/bloc/view/bloc_provider_view.dart';
import 'package:moviehub/core/helper/ui_helpers.dart';
import 'package:moviehub/core/utility/validator.dart';
import 'package:moviehub/dependency_inject.dart';
import 'package:moviehub/feature/movie/presentation/movie_detail/view_model/movie_detail/movie_detail_view_model.dart';
import 'package:moviehub/feature/movie/presentation/movie_detail/view_model/rating/rate_movie_view_model.dart';
import 'package:moviehub/shared/widgets/form_seperator_box.dart';
import 'package:moviehub/shared/widgets/rating_widget.dart';

class RateMovieView extends StatefulWidget {
  final String movieId;
  final Function onSuccess;
  const RateMovieView({
    Key? key,
    required this.movieId,
    required this.onSuccess,
  }) : super(key: key);

  @override
  State<RateMovieView> createState() => _RateMovieViewState();
}

class _RateMovieViewState extends State<RateMovieView> {
  double rating = 4;
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProviderView<RateMovieViewModel>(
      objLocator: () => locator<RateMovieViewModel>(param1: widget.movieId),
      child: BlocListener<RateMovieViewModel, RateMovieState>(
        listener: (context, state) async {
          if (state is RateMovieLoading) {
            ProgressDialog progressDialog = ProgressDialog(context);
            await progressDialog.show();
          } else {
            Navigator.of(context).pop();
            if (state is RateMovieSuccess) {
              widget.onSuccess();
              displayToastSuccess("Rating submitted successfully");
              Navigator.of(context).pop();
            } else if (state is RateMovieError) {
              displayToastFailure(state.message);
            }
          }
        },
        child: Form(
          key: formKey,
          child: Column(
            children: [
              FormSeperatorBox(),
              RatingWidget(
                size: 28.sp,
                rating: rating,
                onUpdate: (p0) {
                  setState(() {
                    rating = p0;
                  });
                },
              ),
              FormSeperatorBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 12,
                minLines: 10,
                validator: Validators.emptyFieldValidator,
                controller: descriptionController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  hintText: "Write description here...",
                ),
              ),
              FormSeperatorBox(
                height: 20,
              ),
              Builder(builder: (context) {
                return TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate() == false) {
                      return;
                    }
                    BlocProvider.of<RateMovieViewModel>(context).add(
                      SubmitRating(
                        rating: rating,
                        description: descriptionController.text,
                      ),
                    );
                  },
                  child: Text("Submit"),
                );
              }),
              FormSeperatorBox(),
            ],
          ),
        ),
      ),
    );
  }
}
