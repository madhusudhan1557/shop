part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterCompleted extends RegisterState {}

class RegisterFailed extends RegisterState {}
