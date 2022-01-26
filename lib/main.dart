import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'di/di.dart';
import 'modules/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  await configureInjection();

  return runZonedGuarded(() async {
    runApp(const MyApp());
  }, (error, stack) {
    // FirebaseCrashlytics.instance.recordError(error, stack);
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,

  ]);
}