part of 'login_bloc_bloc.dart';

class LoginBlocState {
  final String email;
  final String password;
  final bool isSuccess;
  final bool isFailure;

  bool isPasswordVisible;

  LoginBlocState(
      {required this.email,
      required this.password,
      required this.isSuccess,
      required this.isFailure,
      required this.isPasswordVisible});

  factory LoginBlocState.initial() {
    return LoginBlocState(
        email: '',
        password: '',
        isSuccess: false,
        isFailure: false,
        isPasswordVisible: true);
  }

  LoginBlocState copyWith({
    String? email,
    String? password,
    bool? isSuccess,
    bool? isFailure,
    bool? isPasswordVisible,
  }) {
    return LoginBlocState(
      email: email ?? this.email,
      password: password ?? this.password,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
