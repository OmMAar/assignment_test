
import 'package:dio/dio.dart';

mixin AuthService {
  Future<dynamic> signIn({required String email, required String password,CancelToken? cancelToken});
}
