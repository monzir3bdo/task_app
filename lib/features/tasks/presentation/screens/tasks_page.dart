import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/core/helper_functions.dart';
import 'package:task_management/features/tasks/data/models/dto/update_task_dto.dart';
import 'package:task_management/features/tasks/presentation/logic/tasks_cubit.dart';

import '../../domain/entities/task.dart';
import '../widgets/add_task_widget.dart';
import '../widgets/task_widget.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  ScrollController scrollController = ScrollController();
  int skip = 0;

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print('Here we are');
      skip += 10;
      if (!context.read<TasksCubit>().isEnd) {
        context.read<TasksCubit>().getAllTasks(skip: skip);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          context.showBottomSheet(
            isScrollControlled: true,
            child: const AddTaskWidget(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          List<Task> tasks = [];
          if (state is TasksLoadedState) {
            tasks.addAll(state.tasks);
          } else if (state is TasksFailureState) {
            return const Text('Failure');
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 10.0,
                end: 10,
                top: 10,
              ),
              child: ListView.builder(
                controller: scrollController,
                itemCount: tasks.length + 1,
                itemBuilder: (context, index) {
                  if (index < tasks.length) {
                    return TaskWidget(
                      task: tasks[index],
                      onDone: () async {
                        await context.read<TasksCubit>().updateTask(
                              UpdateTaskDto(
                                todo: tasks[index].todo,
                                completed: true,
                                taskId: tasks[index].id,
                              ),
                            );
                        await context.read<TasksCubit>().getAllTasks();
                        THelperFunctions.showSnackBar(
                          'Task Done Successfully',
                          context,
                          backgroundColor: Colors.green,
                        );
                      },
                    );
                  } else {
                    if (!context.read<TasksCubit>().isEnd) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            color: Colors.indigo,
                          ),
                        ),
                      );
                    } else if (scrollController.position ==
                        scrollController.position.maxScrollExtent) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            'You have reached the limit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
