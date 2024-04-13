import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/core/helper_functions.dart';
import 'package:task_management/features/auth/presentation/screens/log_in_screen.dart';
import 'package:task_management/features/tasks/presentation/screens/tasks_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      child: AnimatedSplashScreen(
          splashIconSize: 400,
          splash: Center(child: Lottie.asset('assets/json/task.json')),
          nextScreen: sharedPreferences.getBool('first_launch') ?? false
              ? const TasksPage()
              : LoginScreen(
                  preferences: sharedPreferences,
                )),
    );
  }
}
