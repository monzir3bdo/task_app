import 'package:dartz/dartz.dart' hide Task;
import 'package:task_management/features/tasks/data/models/dto/update_task_dto.dart';
import 'package:task_management/features/tasks/data/models/task_model.dart';
import 'package:task_management/features/tasks/data/network/update_task_service_client.dart';

import '../models/dto/add_task_dto.dart';
import '../network/add_task_service_client.dart';
import '../network/delete_task_service_client.dart';
import '../network/get_tasks_service_client.dart';

abstract class RemoteDataSource {
  Future<List<TaskModel>> getTasks(int skip);
  Future<Unit> addTask(AddTaskDto task);
  Future<Unit> deleteTask(int taskId);
  Future<Unit> updateTask(UpdateTaskDto updateTaskDto);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final GetTasksServiceClient getTasksServiceClient;
  final AddTaskServiceClient addTaskServiceClient;
  final UpdateTaskServiceClient updateTaskServiceClient;
  final DeleteTaskServiceClient deleteTaskServiceClient;
  RemoteDataSourceImpl(this.getTasksServiceClient, this.addTaskServiceClient,
      this.updateTaskServiceClient, this.deleteTaskServiceClient);

  @override
  Future<Unit> addTask(AddTaskDto task) async {
    final response = await addTaskServiceClient.addTask(
        task.todo, task.completed, task.userId);
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteTask(int taskId) async {
    final response = await deleteTaskServiceClient.deleteTask(taskId);
    return Future.value(unit);
    // }
  }

  @override
  Future<List<TaskModel>> getTasks(int skip) async {
    final taskResponse = await getTasksServiceClient.getTasks(skip, 10);
    return taskResponse.todos;
  }

  @override
  Future<Unit> updateTask(UpdateTaskDto updateTaskDto) async {
    final response = await updateTaskServiceClient.updateTask(
      updateTaskDto.taskId,
      updateTaskDto.todo,
      updateTaskDto.completed,
      updateTaskDto.userId,
    );
    return Future.value(unit);
  }
}
