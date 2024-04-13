import 'package:dartz/dartz.dart';
import 'package:task_management/features/auth/domain/repository/repository.dart';

import '../../../../core/errors/failure.dart';
import '../entity/login_response.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;
  Future<Either<Failure, LoginResponse>> call(
      String username, String password) async {
    return await _loginRepository.login(username, password);
  }
}
