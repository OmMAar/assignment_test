import 'package:bloc/bloc.dart';
import 'package:dukkantek_test/di/di.dart';
import 'package:dukkantek_test/modules/authentication/domain/repo/auth_dom_authentication_repo_i.dart';
import 'package:dukkantek_test/utils/errors/utl_error_base.dart';
import 'package:dukkantek_test/utils/errors/utl_error_handler.dart';
import 'package:dukkantek_test/utils/utils.dart';
import 'package:flutter/foundation.dart';

import 'auth_dom_authentication_event.dart';
import 'auth_dom_authentication_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>(_signInAction);
  }

  final IAuthRepo _authRepo = getIt<IAuthRepo>();

  void _signInAction(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final results = await _authRepo.signIn(
          password: event.password,
          email: event.email,
          cancelToken: event.cancelToken);

      if (AppUtils.notNullOrEmpty(results.token)) {
        emit(SignInSuccess());
      } else {
        emit(SignInError(error: CustomError(message: results.error)));
      }
    } catch (error) {
      /// todo - remove print

        AppUtils.appPrint("SignInError catch $error");

      emit(SignInError(error: DioErrorUtil.handleError(error)));
    }
  }
}
