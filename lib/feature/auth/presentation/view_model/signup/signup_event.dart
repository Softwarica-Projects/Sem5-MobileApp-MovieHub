part of 'signup_view_model.dart';

abstract class SignupEvent {}

class SignupRequested extends SignupEvent {
  final SignupModel signupModel;
  SignupRequested(this.signupModel);
}
