import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dukkantek_test/constants/con_endpoints.dart';
import 'package:dukkantek_test/managers/managers.dart';
import 'package:dukkantek_test/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@Singleton(as: HttpManager)
class AppHttpManager implements HttpManager {
  late Dio dio = Dio(
    BaseOptions(
      connectTimeout: AppEndpoints.connectionTimeout,
      receiveTimeout: AppEndpoints.receiveTimeout,
    ),
  )

    /// todo - remove comment dashes from line below when to add firebase configurations
    // ..interceptors.add(MgrNspDioFirebasePerformance())
    ..interceptors.add(Logging())
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: kDebugMode,
        compact: true,
        maxWidth: 250));

  // Get:-----------------------------------------------------------------------
  @override
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {

        AppUtils.appPrint(e.toString());

      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  @override
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> postWithFile(
    String uri, {
    Map<String, dynamic>? data,
    required String fileKey,
    required String filePath,
    required String fileName,
    required String extension,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Map<String, dynamic> dataMap = {};
      if (data != null) {
        dataMap.addAll(data);
      }
      if (filePath != null && fileName != null) {
        dataMap.addAll({
          fileKey: await MultipartFile.fromFile(
            filePath, filename: fileName,

            /// may you will need to active this line , it depends on the server side
            // contentType: new MediaType("image", extension),
          ),
        });
      }

      final Response response = await dio.post(
        uri,
        data: FormData.fromMap(dataMap),
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  @override
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  @override
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
