import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviehub/core/bloc/view/bloc_builder_view.dart';
import 'package:moviehub/core/bloc/view/bloc_provider_view.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/core/helper/image_picker_helper.dart';
import 'package:moviehub/core/helper/ui_helpers.dart';
import 'package:moviehub/core/theme/app_colors.dart';
import 'package:moviehub/core/utility/validator.dart';
import 'package:moviehub/feature/profile/domain/entity/user_entity.dart';
import 'package:moviehub/feature/profile/presentation/edit_profile/view_model/edit_profile_view_model.dart';
import 'package:moviehub/feature/profile/presentation/profile/view_model/user_view_model.dart';
import 'package:moviehub/shared/widgets/circular_image_widget.dart';
import 'package:moviehub/shared/widgets/custom_ink_well.dart';
import 'package:moviehub/shared/widgets/form_seperator_box.dart';
import 'package:moviehub/shared/widgets/form_title_widget.dart';
import 'package:progress_dialog/progress_dialog.dart';

class EditProfileView extends StatefulWidget {
  EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? imageUrl;

  @override
  void initState() {
    var userState = context.read<UserViewModel>().state;
    if (userState is UserLoaded) {
      emailController.text = userState.data.email;
      nameController.text = userState.data.name;
      imageUrl = userState.data.imageUrl;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: AppDefaults.kPageSidePadding,
        child: BlocProviderView<EditProfileViewModel>(
          child: Form(
            child: BlocBuilderView<UserViewModel, UserState, UserLoaded>(
              child: (context, userState) => BlocBuilderView<EditProfileViewModel, EditProfileState, EditProfileLoaded>(
                  child: (context, state) => SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CircularImageWidget(
                                  radius: (72 / 2).sp,
                                  imageUrl: imageUrl,
                                ),
                                Positioned(
                                  right: 0.sp,
                                  bottom: 0.sp,
                                  child: CustomInkWell(
                                    onTap: () {
                                      onImagePickerPick(context, (img) {
                                        setState(() {
                                          imageUrl = img.path;
                                        });
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.kColorBackground,
                                      radius: 12.sp,
                                      child: Icon(Icons.edit, size: 16.sp, color: AppColors.primary),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            FormSeperatorBox(),
                            FormTitleWidget(
                                title: "Full Name",
                                child: TextFormField(
                                  validator: Validators.emptyFieldValidator,
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your full name",
                                  ),
                                )),
                            FormSeperatorBox(),
                            FormTitleWidget(
                                title: "Email",
                                child: TextFormField(
                                  validator: Validators.emailValidator,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your email",
                                  ),
                                )),
                            FormSeperatorBox(),
                            FormSeperatorBox(),
                            TextButton(
                                onPressed: () {
                                  context.read<UserViewModel>().add(UpdateUserEvent(
                                        UserEntity(
                                          id: userState.data.id,
                                          name: nameController.text,
                                          email: emailController.text,
                                          imageUrl: imageUrl,
                                        ),
                                      ));
                                },
                                child: Text(
                                  "Save Change",
                                )),
                            FormSeperatorBox(),
                          ],
                        ),
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
