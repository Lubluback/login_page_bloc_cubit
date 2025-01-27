import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitState.initial());

  void emailChanged(
    String email,
  ) {
    final email = validateEmail(state.email);
    emit(state.copyWith(email: email));
  }

  void passwordChanged(String? password) {
    final password = validateEmail(state.password);
    emit(state.copyWith(password: password));
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

  void loginSubmitted(String email, String password) {
    emit(state.copyWith(isFailure: false, isSuccess: false));

    if (state.email == email && state.password == password) {
      emit(state.copyWith(isSuccess: true));
    } else {
      emit(state.copyWith(isFailure: true));
    }
  }

  void isPasswordVisible(bool password) {
    emit(state.copyWith(
      isPasswordVisible: !state.isPasswordVisible,
    ));
  }
}
