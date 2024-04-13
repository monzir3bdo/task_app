import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:task_management/core/contants/constants.dart';

part 'add_task_service_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AddTaskServiceClient {
  factory AddTaskServiceClient(Dio dio, {String baseUrl}) =
      _AddTaskServiceClient;
  @POST('/todos/add')
  Future<void> addTask(
    @Field('todo') String todo,
    @Field('completed') bool completed,
    @Field('userId') int userId,
  );
}
