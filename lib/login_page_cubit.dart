import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/login_bloc/login_bloc_bloc.dart';
import 'package:login_page_bloc/login_cubit/login_cubit_cubit.dart';

class LoginPageCubit extends StatelessWidget {
  LoginPageCubit({super.key});

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<LoginCubit, LoginCubitState>(
          // listener: (context, state) {

          // },
          builder: (context, state) {
            return Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    onChanged: (value) {
                      context.read<LoginCubit>().emailChanged(value);
                    },
                    validator: (value) {
                      return context.read<LoginCubit>().validateEmail(value);
                    },
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.purple, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.purple, width: 2),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: state.isPasswordVisible,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(PasswordChanged(value));
                    },
                    validator: (value) {
                      return context.read<LoginCubit>().validatePassword(value);
                    },
                    decoration: InputDecoration(
                      hintText: "password",
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            context
                                .read<LoginCubit>()
                                .isPasswordVisible(state.isPasswordVisible);
                          },
                          icon: state.isPasswordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      prefixIcon: const Icon(Icons.key),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.purple, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.purple, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shadowColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(double.infinity, 40),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context
                              .read<LoginCubit>()
                              .loginSubmitted(state.email, state.password);
                          if (state.isSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Success'),
                                duration: const Duration(seconds: 2),
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  onPressed: () {
                                    // Handle undo action
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Login Success')),
                                    );
                                  },
                                ),
                              ),
                            );
                          } else if (state.isFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Failed'),
                                duration: const Duration(seconds: 2),
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  onPressed: () {
                                    // Handle undo action
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Login Failure')),
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
