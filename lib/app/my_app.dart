import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/features/auth/data/repository/repository_impl.dart';
import 'package:task_management/features/auth/presentation/logic/login_cubit/login_cubit.dart';
import 'package:task_management/features/auth/presentation/screens/splash_screen.dart';
import 'package:task_management/features/tasks/data/repository/repository_impl.dart';
import 'package:task_management/features/tasks/presentation/logic/tasks_cubit.dart';

import '../di.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return LoginCubit(
            LoginRepositoryImpl(
              loginRemoteDataSource: sl(),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return TasksCubit(RepositoryImpl(
            remoteDataSource: sl(),
            localDataSource: sl(),
            networkInfo: sl(),
          ));
        })
      ],
      child: MaterialApp(
        home: SplashScreen(sharedPreferences: sl()),
      ),
    );
  }
}
