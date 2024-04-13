import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_management/core/helper_functions.dart';
import 'package:task_management/features/tasks/presentation/widgets/task_options_widget.dart';

import '../../domain/entities/task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task, required this.onDone});
  final Task task;
  final void Function() onDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      padding: const EdgeInsetsDirectional.only(
        top: 10,
        start: 10,
        end: 10,
      ),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: context.width * 0.75,
                child: Text(
                  task.todo,
                  softWrap: true,
                  style: const TextStyle(
                      fontSize: 16, overflow: TextOverflow.fade),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.showBottomSheet(
                    child: TaskOptionsWidget(
                      task: task,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.more_horiz,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Chip(
                backgroundColor: task.completed ? Colors.green : Colors.red,
                label: Text(task.completed ? 'Completed' : 'Not Yet'),
              ),
              const Gap(10),
              const Chip(
                backgroundColor: Colors.amber,
                label: Text('Priority  '),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.date_range),
              const Text('2024/5/2'),
              const Spacer(),
              GestureDetector(
                onTap: onDone,
                child: const Chip(
                  label: Text('Mark AS Done'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
