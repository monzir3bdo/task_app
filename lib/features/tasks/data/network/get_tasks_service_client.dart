import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:task_management/core/contants/constants.dart';

import '../models/get_task_response.dart';

part 'get_tasks_service_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class GetTasksServiceClient {
  factory GetTasksServiceClient(Dio dio, {String baseUrl}) =
      _GetTasksServiceClient;
  @GET('/todos')
  Future<GetTodoResponse> getTasks(
    @Query('skip') int skip,
    @Query('limit') int limit,
  );
}
