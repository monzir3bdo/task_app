import 'package:flutter/cupertino.dart';
import 'package:task_management/app/my_app.dart';
import 'package:task_management/core/api_caller.dart';

import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  final dio = await DioFactory().getDio();
  runApp(MyApp(dio: dio));
}
