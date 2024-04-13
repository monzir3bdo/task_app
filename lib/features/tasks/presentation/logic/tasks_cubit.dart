import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_management/features/tasks/data/models/dto/add_task_dto.dart';
import 'package:task_management/features/tasks/data/models/dto/update_task_dto.dart';
import 'package:task_management/features/tasks/domain/repository/repository.dart';

import '../../domain/entities/task.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(this.repository) : super(TasksInitial());
  final Repository repository;
  List<Task> posts = [];
  int skip = 0;
  bool isLoading = false;
  bool isEnd = false;
  getAllTasks({int skip = 0}) async {
    isLoading = true;
    // emit(TasksLoadingState());

    final response = await repository.getTasks(skip);

    response.fold((l) {
      emit(TasksFailureState());
    }, (tasks) {
      emit(TasksLoadedState(
        tasks: posts,
      ));
      if (tasks.isEmpty) {
        isEnd = true;
      }
      posts.addAll(tasks);
      isLoading = false;
    });
  }

  addNewTask(AddTaskDto taskDto) async {
    emit(TaskAddLoadingState());
    final addTask = await repository.addTask(taskDto);
    addTask.fold(
      (failure) {
        emit(TaskAddFailedState());
      },
      (success) {
        emit(TaskAddSuccessfullyState());
      },
    );
  }

  updateTask(UpdateTaskDto updateTaskDto) async {
    final response = await repository.updateTask(updateTaskDto);
    response.fold(
      (failure) {
        emit(TaskUpdateFailedState());
      },
      (success) {
        emit(TaskUpdateSuccessState());
      },
    );
  }

  deleteTask(int taskId) async {
    final response = await repository.deleteTasks(taskId);
    response.fold((l) => emit(TaskDeleteFailedState()),
        (r) => emit(TaskDeleteSuccessState()));
  }

  markTaskAsDone(Task task) {
    posts.remove(task);
    emit(TaskDoneState(newTasksList: posts));
  }
}
