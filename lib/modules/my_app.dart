import 'package:dukkantek_test/constants/constants.dart';
import 'package:dukkantek_test/managers/managers.dart';
import 'package:dukkantek_test/managers/network/mgr_net_connection_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'spalsh/ui/spl_ui_splash_page.dart';

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


   final ConnectionStatusSingleton _connectionStatus = ConnectionStatusSingleton.getInstance();


  @override
  void initState() {
    super.initState();
     _connectionStatus.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: StreamProvider<ConnectivityStatus>(
            create: (_) => ConnectivityService().connectionStatusController.stream,
            initialData: ConnectivityStatus.Cellular,
            builder: (context, snapshot)  {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              routes: Routes.routes,
              home: const SplashPage(),
            );
          }
        ));
  }


  @override
  void dispose() {
    super.dispose();
     _connectionStatus.dispose();
  }
}
