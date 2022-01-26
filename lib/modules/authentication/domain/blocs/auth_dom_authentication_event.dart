import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  final CancelToken? cancelToken;

  SignInEvent({required this.password,required this.email, this.cancelToken});
  @override
  List<Object> get props => [];

  @override
  String toString() => 'SignInEvent';
}
