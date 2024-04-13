import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_management/core/helper_functions.dart';
import 'package:task_management/features/tasks/data/models/dto/update_task_dto.dart';
import 'package:task_management/features/tasks/presentation/logic/tasks_cubit.dart';
import 'package:task_management/features/tasks/presentation/widgets/add_and_update_task_button.dart';

import '../../domain/entities/task.dart';

class UpdateTaskWidget extends StatefulWidget {
  const UpdateTaskWidget({super.key, required this.task});

  final Task task;

  @override
  State<UpdateTaskWidget> createState() => _UpdateTaskWidgetState();
}

class _UpdateTaskWidgetState extends State<UpdateTaskWidget> {
  TextEditingController textEditingController = TextEditingController();
  late bool isCompleted;

  @override
  void initState() {
    textEditingController.text = widget.task.todo;
    isCompleted = widget.task.completed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          height: context.height * 0.4,
          child: Column(
            children: [
              const Text(
                'Update Task ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: textEditingController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'Completed',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      value: isCompleted,
                      onChanged: (newValue) {
                        setState(() {
                          isCompleted = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Gap(10),
              AddAndUpdateTaskButton(
                onPressed: () async {
                  await context.read<TasksCubit>().updateTask(
                        UpdateTaskDto(
                          todo: textEditingController.text,
                          completed: isCompleted,
                          taskId: widget.task.id,
                        ),
                      );
                  if (context.mounted) {
                    await context.read<TasksCubit>().getAllTasks();
                  }
                  if (context.mounted) {
                    THelperFunctions.showSnackBar(
                      'Task Updated Successfully',
                      context,
                      backgroundColor: Colors.green,
                    );
                    Navigator.pop(context);
                  }
                },
                title: 'Confirm',
              ),
            ],
          ),
        );
      },
    );
  }
}
