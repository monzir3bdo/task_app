import 'package:flutter/cupertino.dart';
import 'package:task_management/app/my_app.dart';

import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(MyApp());
}
