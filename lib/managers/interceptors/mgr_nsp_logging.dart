import 'package:dio/dio.dart';
import 'package:dukkantek_test/utils/utils.dart';
import 'package:flutter/foundation.dart';

class Logging extends Interceptor {
  final int _maxCharactersPerLine = 200;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {


        AppUtils.appPrint(" Start HTTP Request --> ");
        AppUtils.appPrint(" Method --> ${options.method} ");
        AppUtils.appPrint(" Path -->   ${options.path}");
        AppUtils.appPrint(" URI  --> ${options.uri.toString()}");
        AppUtils.appPrint("Content type: ${options.contentType}");
        AppUtils.appPrint("<-- END HTTP Request");



    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

      AppUtils.appPrint("Start HTTP Response -->  ${response.statusCode} ${response
          .requestOptions.method} ${response.requestOptions.path}");

    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }

          AppUtils.appPrint(responseAsString.substring(
              i * _maxCharactersPerLine, endingIndex));

      }
    } else {

        AppUtils.appPrint(response.data);

    }

      AppUtils.appPrint("<-- END HTTP Response");

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {

      AppUtils.appPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions
          .path}',);
      AppUtils.appPrint('URI: ${err.requestOptions.uri.toString()}',);
      AppUtils.appPrint("<-- Error -->");
      AppUtils.appPrint(err.error);
      AppUtils.appPrint(err.message);

    return super.onError(err, handler);
  }
}
