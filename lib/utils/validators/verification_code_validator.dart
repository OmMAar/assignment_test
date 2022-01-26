import 'package:flutter/material.dart';
import 'base_validator.dart';


class VerificationCodeValidator extends BaseValidator {
  @override
  String getMessage(BuildContext? context) {
    return "Invalid verification code";
  }

  @override
  bool validate(String value) {
    return value.isNotEmpty && value.length == 5;
  }
}
