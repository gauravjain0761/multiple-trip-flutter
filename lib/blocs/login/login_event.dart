part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class VerifyOTP extends LoginEvent {
  final String otp;
  final String mobilenumber;
  VerifyOTP({
    required this.otp,
    required this.mobilenumber,
  });
}

class UserSignup extends LoginEvent {
  final String userId;
  final String email;
  final String password;
  UserSignup({
    required this.email,
    required this.password,
    required this.userId,
  });
}

class LoginByPassword extends LoginEvent {
  final String password;
  final String mobilenumber;
  LoginByPassword({
    required this.password,
    required this.mobilenumber,
  });
}

// class DoUserLogout extends LoginEvent {}
