import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/login_bloc/login_bloc_bloc.dart';
import 'package:login_page_bloc/login_cubit/login_cubit_cubit.dart';
import 'package:login_page_bloc/login_page_bloc.dart';
import 'package:login_page_bloc/login_page_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginPageCubit()),
    );
  }
}
