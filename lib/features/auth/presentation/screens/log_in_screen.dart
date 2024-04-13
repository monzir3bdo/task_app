import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/core/helper_functions.dart';
import 'package:task_management/features/auth/presentation/logic/login_cubit/login_cubit.dart';
import 'package:task_management/features/tasks/presentation/logic/tasks_cubit.dart';
import 'package:task_management/features/tasks/presentation/screens/tasks_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.preferences});
  final SharedPreferences preferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TasksPage(),
                  ));
            } else if (state is LoginFailedState) {
              Navigator.pop(context);
              THelperFunctions.showSnackBar(
                state.message,
                backgroundColor: Colors.red,
                context,
                seconds: 1,
              );
            } else if (state is LoginLoadingState) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 80,
                      width: 80,
                    );
                  });
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(50),
                    const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Gap(50),
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        onChanged: (username) {
                          context.read<LoginCubit>().username = username;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Enter Username',
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const Gap(50),
                    TextFormField(
                      onChanged: (password) {
                        context.read<LoginCubit>().password = password;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const Gap(50),
                    state is LoginLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 60),
                              backgroundColor: Color(0xff102E61),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                              context.read<LoginCubit>().signIn();
                              context.read<TasksCubit>().getAllTasks();
                              preferences.setBool('first_launch', true);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
