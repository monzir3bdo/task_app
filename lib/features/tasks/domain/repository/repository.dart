import 'package:dartz/dartz.dart' hide Task;
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/features/tasks/data/models/dto/update_task_dto.dart';
import 'package:task_management/features/tasks/domain/entities/task.dart';

import '../../data/models/dto/add_task_dto.dart';

abstract class Repository {
  Future<Either<Failure, List<Task>>> getTasks(int skip);
  Future<Either<Failure, Unit>> addTask(AddTaskDto taskDto);
  Future<Either<Failure, Unit>> deleteTasks(int taskId);
  Future<Either<Failure, Unit>> updateTask(UpdateTaskDto updateTaskDto);
}
