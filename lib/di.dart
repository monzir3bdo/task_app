import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/core/api_caller.dart';
import 'package:task_management/core/network/network_info.dart';
import 'package:task_management/features/auth/data/data_sources/login_remote_data_sources.dart';
import 'package:task_management/features/auth/data/network/login_service_client.dart';
import 'package:task_management/features/tasks/data/data_sources/local_data_source.dart';
import 'package:task_management/features/tasks/data/data_sources/remote_data_source.dart';
import 'package:task_management/features/tasks/data/network/add_task_service_client.dart';
import 'package:task_management/features/tasks/data/network/delete_task_service_client.dart';
import 'package:task_management/features/tasks/data/network/get_tasks_service_client.dart';
import 'package:task_management/features/tasks/data/network/update_task_service_client.dart';
import 'package:task_management/features/tasks/data/repository/repository_impl.dart';

import 'features/tasks/domain/repository/repository.dart';

GetIt sl = GetIt.instance;
Future<void> init() async {
  final dio = await DioFactory().getDio();
  sl.registerLazySingleton(() => GetTasksServiceClient(dio));
  sl.registerLazySingleton(() => AddTaskServiceClient(dio));
  sl.registerLazySingleton(() => DeleteTaskServiceClient(dio));
  sl.registerLazySingleton(() => UpdateTaskServiceClient(dio));
  sl.registerLazySingleton(() => LoginServiceClient(dio));
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(loginServiceClient: sl()));
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(sl(), sl(), sl(), sl()));
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: InternetConnectionChecker()));
  sl.registerLazySingleton<TaskLocalDataSource>(
      () => TaskLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));
  SharedPreferences preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => preferences);
}
