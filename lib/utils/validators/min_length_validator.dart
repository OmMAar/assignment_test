import 'package:flutter/material.dart';
import 'base_validator.dart';

class MinLengthValidator extends BaseValidator {
  final int minLength;

  MinLengthValidator({required this.minLength, this.isFromVerificationPage});

  bool? isFromVerificationPage;

  @override
  String getMessage(BuildContext? context) {
    if (isFromVerificationPage != null && isFromVerificationPage!) return '*';
    return 'This field should minimum length of $minLength characters';
  }

  @override
  bool validate(String value) {
    return value.length >= minLength;
  }
}
