part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginCompleted extends LoginState {}

class LoginFailed extends LoginState {}
