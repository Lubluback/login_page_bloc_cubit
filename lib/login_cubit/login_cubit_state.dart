part of 'login_cubit_cubit.dart';


 class LoginCubitState {
   final String email;
  final String password;
  final bool isSuccess;
  final bool isFailure;

  bool isPasswordVisible;

  LoginCubitState(
      {required this.email,
      required this.password,
      required this.isSuccess,
      required this.isFailure,
      required this.isPasswordVisible});

  factory LoginCubitState.initial() {
    return LoginCubitState(
        email: '',
        password: '',
        isSuccess: false,
        isFailure: false,
        isPasswordVisible: true);
  }

  LoginCubitState copyWith({
    String? email,
    String? password,
    bool? isSuccess,
    bool? isFailure,
    bool? isPasswordVisible,
  }) {
    return LoginCubitState(
      email: email ?? this.email,
      password: password ?? this.password,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
