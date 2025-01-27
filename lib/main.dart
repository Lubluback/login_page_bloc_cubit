import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_bloc/login_bloc/login_bloc_bloc.dart';
import 'package:login_page_bloc/login_cubit/login_cubit_cubit.dart';
import 'package:login_page_bloc/login_page_cubit.dart';
import 'package:login_page_bloc/select_lang.dart';
import 'package:login_page_bloc/utils/alertdialoguebox.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ml'), Locale('hi')],
    path: 'assets/translations',
    saveLocale: true,
    fallbackLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LanguageSelectionScreen()),
    );
  }
}
