import 'package:dartz/dartz.dart';
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/features/auth/data/data_sources/login_remote_data_sources.dart';
import 'package:task_management/features/auth/domain/entity/login_response.dart';

import '../../domain/repository/repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});
  @override
  Future<Either<Failure, LoginResponse>> login(
      String username, String password) async {
    try {
      final response = await loginRemoteDataSource.login(username, password);
      if (response.message == null) {
        return Right(response);
      } else {
        return Left(WrongCredentialFailure(
          message: response.message!,
        ));
      }
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
