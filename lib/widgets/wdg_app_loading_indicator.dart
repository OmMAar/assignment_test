import 'package:dukkantek_test/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoadingIndicator extends StatelessWidget {
  final double size;
  const AppLoadingIndicator({Key? key,this.size = 30.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitRing(
            size: size, color: AppColors.darkGreen),
      ),
    );
  }

}
