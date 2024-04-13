import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/core/helper_functions.dart';
import 'package:task_management/features/auth/presentation/logic/login_cubit/login_cubit.dart';
import 'package:task_management/features/tasks/presentation/screens/tasks_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.preferences});
  final SharedPreferences preferences;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    return const SizedBox(
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
                    Image.asset('assets/png/task_logo.png'),
                    const Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
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
                          prefixIcon: const Icon(Icons.person),
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
                      obscureText: isObscure,
                      onChanged: (password) {
                        context.read<LoginCubit>().password = password;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscure ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
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
                              backgroundColor: const Color(0xff102E61),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                              context.read<LoginCubit>().signIn();

                              widget.preferences.setBool('first_launch', true);
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
