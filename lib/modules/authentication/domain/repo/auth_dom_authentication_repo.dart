import 'package:dio/dio.dart';
import 'package:dukkantek_test/modules/authentication/data/service/auth_data_authentication_service.dart';
import 'package:dukkantek_test/modules/authentication/data/models/auth_data_mdl_signin_response.dart';
import 'package:injectable/injectable.dart';

import 'auth_dom_authentication_repo_i.dart';

@Injectable(as: IAuthRepo)
class AuthRepo implements IAuthRepo {
  final AuthService remote;
  final AuthService local;

  AuthRepo(@Named('remote') this.remote, @Named('local') this.local);

  @override
  Future<SignInResponseModel> signIn(
      {required String email, required String password,CancelToken? cancelToken}) async {
    /// todo don't forget add error check after you finish from error handling
    try {
      final result = await remote.signIn(email: email, password: password,cancelToken: cancelToken);
      // return result != null && !(result is ErrorResponse)
      //     ? result
      //     : await local.getConfigurationFrom(lang);
      return SignInResponseModel.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }
}
