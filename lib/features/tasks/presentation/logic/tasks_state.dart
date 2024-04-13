part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class TasksLoadingState extends TasksState {}

final class TasksLoadedState extends TasksState {
  final List<Task> tasks;

  TasksLoadedState({required this.tasks});
}

final class TasksFailureState extends TasksState {}

final class TaskDoneState extends TasksState {
  final List<Task> newTasksList;

  TaskDoneState({required this.newTasksList});
}

class TaskAddSuccessfullyState extends TasksState {}

class TaskAddLoadingState extends TasksState {}

class TaskAddFailedState extends TasksState {}

class TaskUpdateSuccessState extends TasksState {}

class TaskUpdateLoadingState extends TasksState {}

class TaskUpdateFailedState extends TasksState {}

class TaskDeleteLoadingState extends TasksState {}

class TaskDeleteSuccessState extends TasksState {}

class TaskDeleteFailedState extends TasksState {}
