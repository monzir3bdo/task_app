import 'package:task_management/features/auth/data/network/login_service_client.dart';

import '../../domain/entity/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login(String username, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final LoginServiceClient loginServiceClient;

  LoginRemoteDataSourceImpl({required this.loginServiceClient});
  @override
  Future<LoginResponse> login(String username, String password) async {
    return await loginServiceClient.login(username, password);
  }
}
