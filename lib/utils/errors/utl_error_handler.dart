import 'dart:io';

import 'package:dukkantek_test/constants/constants.dart';
import 'package:dukkantek_test/helpers/hlp_error_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils.dart';
import 'utl_error_base.dart';


/// todo -- add some static messages for typical error
class DioErrorUtil {

  // general methods:------------------------------------------------------------
  static BaseError handleError(dynamic error) {
    if (error is DioError) {

      return _handleDioError(error);
    }
    else {
     // errorDescription = "Unexpected error occured";
      return const UnknownError(message: "Unexpected error occurred");
    }

  }

 static BaseError _handleDioError(DioError error) {
    if (error.type == DioErrorType.other ||
        error.type == DioErrorType.response) {
      if (error is SocketException) return SocketError();
      /// todo - remove print

        AppUtils.appPrint(' =============== SocketException ===============');

      if (error.type == DioErrorType.response) {
        /// todo - remove print


          AppUtils.appPrint("DioErrorType.RESPONSE message ${error.message}");
          AppUtils.appPrint("DioErrorType.RESPONSE response ${error.response}");

        /// todo -- set default messages
        switch (error.response!.statusCode) {
          case 400:
            return BadRequestError(
                message : error.response?.data['error'] ?? "Bad Request Error"
            );
          case 401:
            return UnauthorizedHttpError(
                 message: error.response?.data['error'] ?? "Unauthorized Http Error"
            );
          case 403:
            return ForbiddenError(
                message: error.response?.data['error'] ?? "Forbidden Error"
            );
          case 404:
            return NotFoundError(
                message: error.response?.data['error'] ?? "NotFound Error"
            );
          case 409:
            return ConflictError(
                message: error.response?.data['error'] ?? "Conflict Error"
            );
          case 422:
            return CustomError(
                message: error.response?.data['error'] ?? "Unexpected error"
            );
          case 500:
            return InternalServerError(
                message: error.response?.data['error'] ?? "Internal Server Error"
            );
          default:
            return HttpError(
                message: error.response?.data['error'] ?? "Http Error"
            );
        }
      }
      return NetError(
          message: error.response?.data['error'] ?? "Net Error"
      );
    } else if (error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      return TimeoutError(
          message: error.response?.data['error'] ?? "Timeout Error"
      );
    } else if (error.type == DioErrorType.cancel) {
      return CancelError(
          message: error.response?.data['error'] ?? "Cancel Error"
      );
    }
    else {
      return const UnknownError(
          message: "Unexpected error occurred"
      );
    }
  }
}