import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:task_management/core/contants/constants.dart';

part 'update_task_service_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class UpdateTaskServiceClient {
  factory UpdateTaskServiceClient(Dio dio, {String baseUrl}) =
      _UpdateTaskServiceClient;
  @PUT('/todos/{todoId}')
  Future<void> updateTask(
    @Path('todoId') int todoId,
    @Field('todo') String todo,
    @Field('completed') bool completed,
    @Field('userId') int userId,
  );
}
