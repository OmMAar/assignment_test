import 'package:dukkantek_test/utils/utils.dart';
import 'package:flutter/material.dart';


class MatchValidator extends BaseValidator {
  String value;

  MatchValidator({required this.value});

  @override
  String getMessage(BuildContext? context) {
    return "There is not match";
  }

  @override
  bool validate(String value) {
    AppUtils.appPrint('const value: ${this.value}');
    AppUtils.appPrint('var value: $value');

    return value == this.value;
  }
}
