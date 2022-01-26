import 'package:dio/dio.dart';
import 'package:dukkantek_test/constants/con_endpoints.dart';
import 'package:dukkantek_test/managers/managers.dart';
import 'package:injectable/injectable.dart';

import 'auth_data_authentication_service.dart';

@Named('remote')
@Injectable(as: AuthService)
class AppRemoteService implements AuthService {
  final HttpManager httpManager;

  AppRemoteService(this.httpManager);

  @override
  Future<dynamic> signIn(
      {required String email, required String password,CancelToken? cancelToken}) async {
    var dataParameters = <String, dynamic>{};
    dataParameters['email'] = email;
    dataParameters['password'] = password;

    return await httpManager.post(AppEndpoints.signIn, data: dataParameters,cancelToken: cancelToken);
  }
}
