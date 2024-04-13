import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:task_management/core/contants/constants.dart';

part 'delete_task_service_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class DeleteTaskServiceClient {
  factory DeleteTaskServiceClient(Dio dio, {String baseUrl}) =
      _DeleteTaskServiceClient;
  @DELETE('todos/{todoId}')
  Future<void> deleteTask(
    @Path('todoId') int todoId,
  );
}
