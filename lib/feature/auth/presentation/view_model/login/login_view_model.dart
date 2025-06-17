// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/feature/auth/domain/model/login_model.dart';
import 'package:moviehub/feature/auth/domain/use_case/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginViewModel extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _loginUsecase;

  LoginViewModel(
    this._loginUsecase,
  ) : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    var response = await _loginUsecase.call(event.loginModel);
    response.fold((e) {
      emit(LoginError(e.toString()));
      return true;
    }, (x) {
      emit(LoginSuccess());
      return true;
    });
  }
}
