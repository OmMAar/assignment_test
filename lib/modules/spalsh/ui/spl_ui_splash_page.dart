import 'dart:async';
import 'package:dukkantek_test/constants/constants.dart';
import 'package:dukkantek_test/managers/navigation/mgr_nav_routes.dart';
import 'package:dukkantek_test/utils/utl_device.dart';
import 'package:dukkantek_test/widgets/wdg_img_image_assets_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.getScaledWidth(context, 1);
    double height = DeviceUtils.getScaledHeight(context, 1);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: <Widget>[
             const Center(
                child:  ImageAssetCircleWidget(
                  imagePath: AppAssets.userManagementBG,
                ),
              ),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.bounceInOut,
                  bottom: 10,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(AppDimens.space20),
                          child: SpinKitThreeBounce(
                            color: AppColors.mainColor,
                            size: width * 0.05,
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          )),
    );
  }

  _startTimer() {
    var _duration = const Duration(milliseconds: 3000);
    return Timer(_duration, _navigate);
  }

  _navigate() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.of(context).pushReplacementNamed(Routes.loginPage);
  }
}
