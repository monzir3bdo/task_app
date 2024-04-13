import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_management/core/helper_functions.dart';
import 'package:task_management/features/tasks/presentation/logic/tasks_cubit.dart';
import 'package:task_management/features/tasks/presentation/widgets/update_task_widget.dart';

import '../../domain/entities/task.dart';

class TaskOptionsWidget extends StatelessWidget {
  const TaskOptionsWidget({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
      ),
      height: context.height * 0.20,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
              context.showBottomSheet(
                isScrollControlled: true,
                child: UpdateTaskWidget(
                  task: task,
                ),
              );
            },
            leading: const Icon(
              Icons.edit,
              color: Colors.green,
            ),
            title: const Text('Update'),
          ),
          const Gap(20),
          ListTile(
            onTap: () async {
              await context.read<TasksCubit>().deleteTask(task.id);
              await context.read<TasksCubit>().getAllTasks();

              Navigator.pop(context);
              THelperFunctions.showSnackBar(
                'Task Deleted Successfully',
                context,
                backgroundColor: Colors.green,
              );
            },
            leading: const Icon(
              Icons.close,
              color: Colors.red,
            ),
            title: const Text('Remove'),
          ),
        ],
      ),
    );
  }
}
