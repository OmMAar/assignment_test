import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'auth_data_authentication_service.dart';

@Named('local')
@Injectable(as: AuthService)
class AuthLocalService implements AuthService {
  AuthLocalService();


  @override
  Future<dynamic> signIn({required String email, required String password,CancelToken? cancelToken}) async {

  }




}