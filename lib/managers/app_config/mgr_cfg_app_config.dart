import 'dart:collection';

import 'package:dukkantek_test/utils/utils.dart';
import 'package:flutter/foundation.dart';

class AppConfig {
  AppConfig._internal();

  static final AppConfig _instance = AppConfig._internal();

  static AppConfig get instance => _instance;


  LinkedHashMap config = LinkedHashMap();

  void setConfig(dynamic json) {

      AppUtils.appPrint("error configuration catch 2 $json");

    LinkedHashMap<String, String?> data = LinkedHashMap.from(json);
    if (data.isNotEmpty) {
      config.addAll(data);
    }
  }

  String getConfigurationValue(String configKey) => config[configKey]??"";

  dynamic getConfiguration() => config;

  void clearConfig() {
    config.clear();
  }
}
