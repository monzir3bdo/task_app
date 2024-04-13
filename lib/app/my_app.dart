import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/features/auth/data/data_sources/login_remote_data_sources.dart';
import 'package:task_management/features/auth/data/network/login_service_client.dart';
import 'package:task_management/features/auth/data/repository/repository_impl.dart';
import 'package:task_management/features/auth/presentation/logic/login_cubit/login_cubit.dart';
import 'package:task_management/features/auth/presentation/screens/log_in_screen.dart';
import 'package:task_management/features/tasks/data/data_sources/remote_data_source.dart';
import 'package:task_management/features/tasks/data/network/add_task_service_client.dart';
import 'package:task_management/features/tasks/data/network/delete_task_service_client.dart';
import 'package:task_management/features/tasks/data/network/get_tasks_service_client.dart';
import 'package:task_management/features/tasks/data/network/update_task_service_client.dart';
import 'package:task_management/features/tasks/data/repository/repository_impl.dart';
import 'package:task_management/features/tasks/presentation/logic/tasks_cubit.dart';

class MyApp extends StatelessWidget {
  final Dio dio;
  const MyApp({super.key, required this.dio});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return LoginCubit(
            LoginRepositoryImpl(
              loginRemoteDataSource: LoginRemoteDataSourceImpl(
                  loginServiceClient: LoginServiceClient(dio)),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return TasksCubit(RepositoryImpl(
            remoteDataSource: RemoteDataSourceImpl(
              GetTasksServiceClient(dio),
              AddTaskServiceClient(dio),
              UpdateTaskServiceClient(dio),
              DeleteTaskServiceClient(dio),
            ),
          ));
        })
      ],
      child: const MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
