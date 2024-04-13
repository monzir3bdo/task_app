import 'package:dartz/dartz.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/features/auth/domain/entity/login_response.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponse>> login(
      String username, String password);
}
