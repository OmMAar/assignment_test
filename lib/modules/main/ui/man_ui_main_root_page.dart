import 'package:dukkantek_test/constants/constants.dart';
import 'package:dukkantek_test/utils/utils.dart';
import 'package:dukkantek_test/widgets/wdg_anim_text_beaty.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainRootPage extends StatefulWidget {
  const MainRootPage({Key? key}) : super(key: key);

  @override
  _MainRootPageState createState() => _MainRootPageState();
}

class _MainRootPageState extends State<MainRootPage>
    with SingleTickerProviderStateMixin {
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(
        "Home",
        style: appTextStyle.body1.copyWith(color: AppColors.white),
      ),
      centerTitle: true,
      backgroundColor: AppColors.mainColor,
    );
    double widthC = DeviceUtils.getScaledWidth(context, 1);
    double heightC = DeviceUtils.getScaledHeight(context, 1) -
        appBar.preferredSize.height -
        MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      appBar: appBar,
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: const Center(
          child: TextBeatyAnimationWidget(
            text: "Welcome Back",
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: 'Tab again to exit',
          backgroundColor: AppColors.mainColor,
          textColor: AppColors.white);
      return Future.value(false);
    }
    Navigator.pop(context);
    return Future.value(true);
  }
}
