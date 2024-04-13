import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task_management/core/helper_functions.dart';

import '../../data/models/dto/add_task_dto.dart';
import '../logic/tasks_cubit.dart';
import 'add_and_update_task_button.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.38,
      padding: const EdgeInsetsDirectional.only(
        top: 18.0,
        start: 10,
        end: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              'Add a New Task',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const Gap(50),
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
          const Gap(50),
          BlocConsumer<TasksCubit, TasksState>(
            listener: (context, state) {
              if (state is TaskAddSuccessfullyState) {
                THelperFunctions.showSnackBar('Add Successfully', context);
              }
            },
            builder: (context, state) {
              return AddAndUpdateTaskButton(
                  onPressed: textEditingController.text.isEmpty
                      ? null
                      : () async {
                          await context.read<TasksCubit>().addNewTask(
                                AddTaskDto(
                                  todo: textEditingController.text,
                                ),
                              );
                          if (context.mounted) {
                            Navigator.of(context).pop();
                            await context.read<TasksCubit>().getAllTasks();
                          }
                        },
                  title: 'Add');
            },
          ),
        ],
      ),
    );
  }
}
