import 'package:dukkantek_test/modules/authentication/ui/auth_ui_login_page.dart';
import 'package:dukkantek_test/modules/main/ui/man_ui_main_root_page.dart';
import 'package:dukkantek_test/modules/spalsh/ui/spl_ui_splash_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  /// set routes config for entire app
  /// splash page
  static const String splash = '/splash/SplUiSplashPage';



  /// main pages
  static const String mainRootPage = '/main/ManUiMainRootPage';

  /// user management pages
  static const String loginPage = '/auth/LoginPage';







  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashPage(),


    mainRootPage: (BuildContext context) => const MainRootPage(),


    loginPage: (BuildContext context) => const LoginPage(),
  };

}



