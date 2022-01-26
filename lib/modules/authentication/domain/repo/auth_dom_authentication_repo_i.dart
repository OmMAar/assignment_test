
import 'package:dio/dio.dart';
import 'package:dukkantek_test/modules/authentication/data/models/auth_data_mdl_signin_response.dart';

mixin IAuthRepo {
  Future<SignInResponseModel> signIn({required String email, required String password,CancelToken? cancelToken});
}
