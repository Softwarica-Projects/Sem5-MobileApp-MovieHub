part of 'login_view_model.dart';

abstract class LoginEvent {}

class LoginRequested extends LoginEvent {
  final LoginModel loginModel;
  LoginRequested(this.loginModel);
}
