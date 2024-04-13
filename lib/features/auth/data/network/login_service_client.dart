import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:task_management/core/contants/constants.dart';

import '../../domain/entity/login_response.dart';

part 'login_service_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class LoginServiceClient {
  factory LoginServiceClient(Dio dio, {String baseUrl}) = _LoginServiceClient;
  @POST('/auth/login')
  Future<LoginResponse> login(
    @Field('username') String username,
    @Field('password') String password,
  );
}
