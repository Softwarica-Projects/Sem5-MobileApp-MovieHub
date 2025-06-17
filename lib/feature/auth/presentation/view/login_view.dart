import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviehub/core/constant/app_defaults.dart';
import 'package:moviehub/core/helper/ui_helpers.dart';
import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/core/utility/validator.dart';
import 'package:moviehub/dependency_inject.dart';
import 'package:moviehub/feature/auth/domain/model/login_model.dart';
import 'package:moviehub/feature/auth/presentation/view_model/login/login_view_model.dart';
import 'package:moviehub/services/auth/auth_service.dart';
import 'package:moviehub/services/core/preference_service.dart';
import 'package:moviehub/shared/widgets/custom_ink_well.dart';
import 'package:moviehub/shared/widgets/form_seperator_box.dart';
import 'package:moviehub/shared/widgets/form_title_widget.dart';
import 'package:moviehub/shared/widgets/visibility_widget.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<LoginViewModel>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
          ),
        ),
        body: Builder(builder: (context) {
          return BlocListener<LoginViewModel, LoginState>(
            listener: (context, state) async {
              if (state is LoginLoading) {
                ProgressDialog pr = ProgressDialog(context);
                pr.show();
              } else {
                Navigator.pop(context);
                if (state is LoginSuccess) {
                  displayToastSuccess("Logged in successfully");
                  Navigator.pushNamedAndRemoveUntil(context, Routes.homePage, (route) => false);
                } else if (state is LoginError) {
                  displayToastFailure(state.message);
                }
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: AppDefaults.kPageSidePadding,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      FormTitleWidget(
                        title: "Email Address",
                        child: TextFormField(
                          controller: emailController,
                          validator: Validators.emptyFieldValidator,
                        ),
                      ),
                      FormSeperatorBox(),
                      FormTitleWidget(
                        title: "Password",
                        child: TextFormField(
                          obscureText: obscurePassword,
                          controller: passwordController,
                          decoration: InputDecoration(
                              suffixIcon: CustomInkWell(
                            onTap: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                            child: VisibilityWidget(
                              isVisibile: !obscurePassword,
                            ),
                          )),
                          validator: Validators.emptyFieldValidator,
                        ),
                      ),
                      FormSeperatorBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: CustomInkWell(
                          child: Text(
                            "Create an account?",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12.sp,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.signupPage,
                            );
                          },
                        ),
                      ),
                      FormSeperatorBox(),
                      TextButton(
                        onPressed: () {
                          hideKeyboard(context);
                          if (formKey.currentState!.validate() == false) {
                            return;
                          }
                          BlocProvider.of<LoginViewModel>(context).add(
                            LoginRequested(
                              LoginModel(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            ),
                          );
                        },
                        child: Text('Login'),
                      ),
                      FormSeperatorBox(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
