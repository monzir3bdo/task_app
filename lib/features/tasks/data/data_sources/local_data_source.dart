import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/features/tasks/data/models/task_model.dart';

import '../../../../core/errors/exceptions.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>> getCachedTasks();
  Future<Unit> cacheTasks(List<TaskModel> taskModels);
}

const cachedTasks = "CACHED_TASKS";

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheTasks(List<TaskModel> taskModels) {
    List taskModelsToJson = taskModels
        .map<Map<String, dynamic>>((taskModel) => taskModel.toJson())
        .toList();
    sharedPreferences.setString(cachedTasks, json.encode(taskModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<TaskModel>> getCachedTasks() {
    final jsonString = sharedPreferences.getString(cachedTasks);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<TaskModel> jsonToTaskModels = decodeJsonData
          .map<TaskModel>((jsonTaskModel) => TaskModel.fromJson(jsonTaskModel))
          .toList();
      return Future.value(jsonToTaskModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
