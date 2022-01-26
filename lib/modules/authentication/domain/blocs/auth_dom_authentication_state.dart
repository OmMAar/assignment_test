import 'package:dukkantek_test/utils/errors/utl_error_base.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AuthInitial';
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AuthLoading';
}

class SignInSuccess extends AuthState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'SignInSuccess';
}

class SignInError extends AuthState {
  const SignInError({required this.error});

  final BaseError error;

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SignInError';
}
