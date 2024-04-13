import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/di.dart';
import 'package:task_management/features/tasks/data/models/dto/add_task_dto.dart';
import 'package:task_management/features/tasks/data/models/dto/update_task_dto.dart';
import 'package:task_management/features/tasks/domain/repository/repository.dart';

void main() async {
  await init();
  group('Testing Repository ', () {
    final repository = sl<Repository>();
    test(
      'Add Task',
      () async {
        final response = await repository.getTasks(0);
        expect(response.isRight(), true);
      },
    );
    test('Add Task', () async {
      final response = await repository.addTask(
        AddTaskDto(todo: 'Trying to be a better Developer'),
      );
      expect(response.isRight(), true);
    });
    test('Remove Task', () async {
      final response = await repository.deleteTasks(150);
      expect(response.isRight(), true);
    });
    test('Update Task', () async {
      final response = await repository.updateTask(UpdateTaskDto(
        todo: 'go to sleep',
        completed: false,
        taskId: 150,
      ));
    });
  });
}
