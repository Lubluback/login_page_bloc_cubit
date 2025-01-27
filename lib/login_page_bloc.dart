import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/login_bloc/login_bloc_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
        child: BlocBuilder<LoginBloc, LoginBlocState>(
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
                      context.read<LoginBloc>().add(EmailChanged(state.email));
                    },
                    validator: validateEmail,
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
                      context
                          .read<LoginBloc>()
                          .add(PasswordChanged(state.password));
                    },
                    validator: validatePassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                PasswordVisibility(!state.isPasswordVisible));
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
                              .read<LoginBloc>()
                              .add(LoginSubmitted(state.email, state.password));
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
                                      const SnackBar(content: Text('Login Success')),
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
                                      const SnackBar(content: Text('Login Failure')),
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

  String? validateEmail(String? email) {
    final bool name = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!);
    if (email.trim().isEmpty) {
      return "required email";
    } else if (!name) {
      return 'invalid email Id';
    }
    return null;
  }

  String? validatePassword(String? password) {
    final bool name =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password!);
    if (password.trim().isEmpty) {
      return "required password";
    } else if (!name) {
      return 'invalid password';
    } else {
      return null;
    }
  }
}
