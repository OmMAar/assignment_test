import 'dart:convert';

import 'package:dukkantek_test/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'errors/utl_error_base.dart';
class AppUtils {
  // UtlApp._();



  static void appPrint(dynamic value){

      if (kDebugMode) {
        print('$value');
      }

  }


  static bool notNullOrEmpty(String? value) {
    return value != null && value.isNotEmpty;
  }
  String _lang = AppStrings.LANG_EN;
  void setLang(String? lang) {
    if(notNullOrEmpty(lang)) {
      _lang = lang!;
    }
    /// todo - remove print

      AppUtils.appPrint('---------------------Lang--------------:$_lang');

  }

  String getLang() {
    if(_lang == AppStrings.LANG_AR) return AppStrings.LANG_AR;
    return AppStrings.LANG_EN;

  }


  static Future<dynamic> parseFileToJson({required String assetFile}) async {
    String jsonData = await rootBundle
        .loadString(assetFile);
    return json.decode(jsonData);
  }

  static snackBarMessage({required BuildContext context,required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: appTextStyle.smallTSBasic.copyWith(color: AppColors.white),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static showErrorMessage(
      {required BaseError error, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          error.message??"Unexpected error occurred",
          style: appTextStyle.smallTSBasic.copyWith(color: AppColors.white),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

AppUtils utlApp = AppUtils();