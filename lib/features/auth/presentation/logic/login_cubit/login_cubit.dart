import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_management/features/auth/domain/repository/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(LoginInitial());
  final LoginRepository loginRepository;

  String? password;
  String? username;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  signIn() async {
    emit(LoginLoadingState());
    final result = await loginRepository.login(username!, password!);

    result.fold(
      (failure) {
        emit(LoginFailedState(message: 'Wrong Credentials'));
      },
      (success) {
        emit(
          LoginSuccessState(),
        );
      },
    );
  }
}
