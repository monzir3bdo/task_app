import 'package:dartz/dartz.dart' hide Task;
import 'package:task_management/core/errors/failure.dart';
import 'package:task_management/features/tasks/data/data_sources/remote_data_source.dart';
import 'package:task_management/features/tasks/data/models/dto/add_task_dto.dart';
import 'package:task_management/features/tasks/data/models/task_model.dart';
import 'package:task_management/features/tasks/domain/entities/task.dart';

import '../../domain/repository/repository.dart';
import '../models/dto/update_task_dto.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, Unit>> addTask(AddTaskDto taskDto) async {
    try {
      final response = await remoteDataSource.addTask(taskDto);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTasks(int taskId) async {
    try {
      final response = await remoteDataSource.deleteTask(taskId);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getTasks(int skip) async {
    final response = await remoteDataSource.getTasks(skip);
    final tasksList = response.map((e) => e.toDomain()).toList();
    return right(tasksList);
  }

  @override
  Future<Either<Failure, Unit>> updateTask(UpdateTaskDto updateTaskDto) async {
    try {
      final response = await remoteDataSource.updateTask(updateTaskDto);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

extension TaskModelExtension on TaskModel {
  Task toDomain() {
    return Task(
      id: this.id,
      userId: this.userId,
      todo: this.todo,
      completed: this.completed,
    );
  }
}
