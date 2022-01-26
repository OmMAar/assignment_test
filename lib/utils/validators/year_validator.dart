import 'package:flutter/material.dart';

import 'base_validator.dart';

class YearValidator extends BaseValidator {
  @override
  String getMessage(BuildContext? context) {
    return "Invalid Year";
  }

  @override
  bool validate(String value) {
    return value.isNotEmpty && value.length == 4;
  }
}
